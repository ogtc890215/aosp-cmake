project(libsensor)

set(SENSOR_ROOT ${ANDROID_ROOT}/frameworks/native/libs/sensor)

set(SOURCE_FILES
        ${SENSOR_ROOT}/BitTube.cpp
        ${SENSOR_ROOT}/ISensorEventConnection.cpp
        ${SENSOR_ROOT}/ISensorServer.cpp
        ${SENSOR_ROOT}/Sensor.cpp
        ${SENSOR_ROOT}/SensorEventQueue.cpp
        ${SENSOR_ROOT}/SensorManager.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)

add_library(libsensor SHARED ${SOURCE_FILES})
target_include_directories(libsensor PUBLIC
        ${SENSOR_ROOT}/include
        ${ANDROID_ROOT}/frameworks/native/libs/binder/include
        ${ANDROID_ROOT}/hardware/libhardware/include
        )
target_compile_options(libsensor PRIVATE
        -Weverything
        -Werror
        -Wno-exit-time-destructors
        -Wno-global-constructors
        -Wno-c++98-compat-pedantic
        -Wno-nested-anon-types
        -Wno-gnu-anonymous-struct
        -Wno-padded
        )
target_link_libraries(libsensor PRIVATE
        libbinder
        libcutils
        libutils
        liblog
        libhardware
        )
