project(libvrsensor)

set(VRSENSOR_ROOT ${ANDROID_ROOT}/frameworks/native/libs/vr/libvrsensor)

set(SOURCE_FILES
        ${VRSENSOR_ROOT}/pose_client.cpp
        ${VRSENSOR_ROOT}/sensor_client.cpp
        ${VRSENSOR_ROOT}/latency_model.cpp
        )

include_directories(${ANDROID_ROOT}/system/core/base/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/native/libs/vr/libbroadcastring/include)

add_library(libvrsensor SHARED ${SOURCE_FILES})
target_include_directories(libvrsensor PUBLIC
        ${VRSENSOR_ROOT}/include
        )
target_link_libraries(libvrsensor
        libbase
        libcutils
        libhardware
        liblog
        libutils
        libui

        libdisplay
        libbufferhub
        libbufferhubqueue
        )

