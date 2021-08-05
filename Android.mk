# Copyright (C) 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# Define the platform which you want to compile
# BXT or SKL or KBL

LOCAL_SRC_FILES += instrumentation/metrics_discovery/codegen/md_main_BXT.cpp \
				   instrumentation/metrics_discovery/codegen/md_main_SKL_GT2.cpp \
				   instrumentation/metrics_discovery/codegen/md_main_SKL_GT3.cpp \
				   instrumentation/metrics_discovery/codegen/md_main_SKL_GT4.cpp \
				   instrumentation/metrics_discovery/codegen/md_main_KBL_GT2.cpp \
				   instrumentation/metrics_discovery/codegen/md_main_KBL_GT3.cpp \
				   instrumentation/metrics_discovery/codegen/md_main_HSW.cpp \
				   instrumentation/metrics_discovery/codegen/md_main_BDW.cpp \
				   instrumentation/metrics_discovery/codegen/md_main.cpp \
				   instrumentation/metrics_discovery/common/md_utils.cpp \
				   instrumentation/metrics_discovery/common/md_internal.cpp \
				   instrumentation/metrics_discovery/common/md_calculation.cpp \
				   instrumentation/metrics_discovery/linux/md_driver_ifc_linux_perf.cpp \
				   instrumentation/utils/common/iu_debug.c \
				   instrumentation/utils/linux/iu_std_linux.cpp \
				   ../mesa3d-intel/src/intel/dev/gen_device_info.c \
				   ../mesa3d-intel/src/util/log.c

LOCAL_CPPFLAGS := -DNDEBUG \
				  -DINCLUDE_ALL_METRICS \
				  -O2 -D_FORTIFY_SOURCE=2 -Wformat \
				  -fdiagnostics-color=auto  \
				  -fstack-protector \
				  -Wno-unused \
				  -Werror \
				  -Wno-strict-aliasing \
				  -Wno-unknown-pragmas \
				  -Wno-comment \
				  -msse \
				  -Wformat-security \
				  -DMD_USE_PERF \
				  -DOGL_GEM \
				  -DMETRICS_DISCOVERY \
				  -fno-inline \
				  -Wall \
				  -Wno-reorder \
                                  -Wno-error=overloaded-virtual \
				  -Wno-error=missing-field-initializers \
                                  -Wno-error=unused-parameter \
                                  -Wno-error=missing-braces \
                                  -Wno-error=unused-variable \
				  -std=c++11

LOCAL_LDFLAGS :=  -Wl,--no-undefined \
				  -Wl,-z,defs \
				  -Wl,-z,noexecstack \
				  -Wl,-z,relro \
				  -Wl,-z,now

LOCAL_C_INCLUDES := \
					$(LOCAL_PATH)/instrumentation/metrics_discovery/linux/inc \
					$(LOCAL_PATH)/instrumentation/metrics_discovery/common/inc \
					$(LOCAL_PATH)/instrumentation/utils/common/inc \
					$(LOCAL_PATH)/instrumentation/utils/linux/inc \
					$(LOCAL_PATH)/inc/common \
					$(LOCAL_PATH)/inc/common/instrumentation \
					$(LOCAL_PATH)/inc/common/instrumentation/api \
					$(LOCAL_PATH)/../mesa3d-intel/src \
					$(LOCAL_PATH)/../mesa3d-intel/include \
					$(LOCAL_PATH)/../mesa3d-intel/src/intel/common \
					$(LOCAL_PATH)/../mesa3d-intel/src/intel/dev \
					$(LOCAL_PATH)/../drm-intel/include/drm \

LOCAL_SHARED_LIBRARIES :=  libcutils \
						   libdrm \
						   liblog

LOCAL_MODULE := libmd
LOCAL_PROPRIETARY_MODULE := true
#LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
