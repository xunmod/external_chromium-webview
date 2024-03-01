#
# Copyright (C) 2014 The Android Open Source Project
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
#

# Install the prebuilt webview apk.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := WebViewGoogle
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_MULTILIB := both
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

LOCAL_REQUIRED_MODULES := \
        libwebviewchromium_loader \
        libwebviewchromium_plat_support

LOCAL_MODULE_TARGET_ARCH := arm arm64 x86
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_SRC_FILES := prebuilt/$(my_src_arch)/WebViewGoogle.apk

ifeq ($(TARGET_ARCH),arm) 
    TARGET_ARCH_ABI := armeabi-v7a
else ifeq ($(TARGET_ARCH),arm64) 
    TARGET_ARCH_ABI := arm64-v8a
else ifeq ($(TARGET_ARCH),x86) 
    TARGET_ARCH_ABI := x86
endif

LOCAL_PREBUILT_JNI_LIBS := \
        @lib/$(TARGET_ARCH_ABI)/libwebviewchromium.so \
        @lib/$(TARGET_ARCH_ABI)/libarcore_sdk_c.so \
        @lib/$(TARGET_ARCH_ABI)/libchromium_android_linker.so \
        @lib/$(TARGET_ARCH_ABI)/libcrashpad_handler_trampoline.so

include $(BUILD_PREBUILT)
