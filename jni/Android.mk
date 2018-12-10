LOCAL_PATH := $(call my-dir)

#########################################################
# OpenCV library
include $(CLEAR_VARS)

OPENCV_INCL   := libs/opencv/OpenCV-3.4.3-android-sdk/sdk/native/jni/include
OPENCV_LIB    := $(LOCAL_PATH)/../../libs/opencv/OpenCV-3.4.3-android-sdk/sdk/native/libs/$(TARGET_ARCH_ABI)

LOCAL_MODULE := opencv_shared
LOCAL_SRC_FILES = $(OPENCV_LIB)/libopencv_java3.so

LOCAL_EXPORT_CPPFLAGS := -std=c++11 -Wno-unused-parameter -Wno-unused-variable -Wno-unused-function
LOCAL_EXPORT_C_INCLUDES := $(OPENCV_INCL)

include $(PREBUILT_SHARED_LIBRARY)

#########################################################
# libpng library
include $(CLEAR_VARS)

LIBPNG_INCL   := libs/libPNG-1.5.27/jni
LIBPNG_LIB    := $(LOCAL_PATH)/../../libs/libPNG-1.5.27/obj/local/$(TARGET_ARCH_ABI)

LOCAL_MODULE := libpng_static
LOCAL_SRC_FILES = $(LIBPNG_LIB)/libpng.a

LOCAL_EXPORT_C_INCLUDES := $(LIBPNG_INCL)

include $(PREBUILT_STATIC_LIBRARY)

#########################################################
# png++ library
include $(CLEAR_VARS)

LIBPNG_PLUSPLUS_INCL   := libs/png++-0.2.9

LOCAL_EXPORT_C_INCLUDES := $(LIBPNG_PLUSPLUS_INCL)

#########################################################
# S-Pixel library
include $(CLEAR_VARS)

LOCAL_C_INCLUDES   := $(OPENCV_INCL) $(LIBPNG_INCL) $(LIBPNG_PLUSPLUS_INCL)
LOCAL_CPP_FEATURES := rtti exceptions

LOCAL_CPP_FLAGS    := -std=c++11 -Wno-unused-parameter -Wno-unused-variable -Wno-unused-function
LOCAL_CPP_FLAGS    += -Wl,--exclude-libs,ALL

LOCAL_LDLIBS           := -llog -landroid -latomic
LOCAL_STATIC_LIBRARIES := libpng_static
LOCAL_SHARED_LIBRARIES := opencv_shared

LOCAL_MODULE    := libspixel
LOCAL_SRC_FILES :=\
  stdafx.cpp \
  structures.cpp \
  functions.cpp \
  sallocator.cpp \
  segengine.cpp \
  spixel.cpp \
  utils.cpp \

include $(BUILD_SHARED_LIBRARY)
