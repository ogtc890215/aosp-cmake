project(BootAnimation)

set(BOOTANIMATION_ROOT ${ANDROID_ROOT}/frameworks/base/cmds/bootanimation)

add_definitions(-DGL_GLEXT_PROTOTYPES)
add_definitions(-DEGL_EGLEXT_PROTOTYPES)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunreachable-code")

include_directories(${ANDROID_ROOT}/external/tinyalsa/include)
include_directories(${ANDROID_ROOT}/frameworks/wilhelm/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libbootanimation SHARED ${BOOTANIMATION_ROOT}/BootAnimation.cpp)
target_link_libraries(libbootanimation
        libcutils
        liblog
        libandroidfw
        libutils
        libbinder
        libui
        libskia
        libEGL
        libGLESv1_CM
        libgui
        libtinyalsa
        libbase
        )

set(SOURCE_FILES
        ${BOOTANIMATION_ROOT}/BootAnimationUtil.cpp

        ${BOOTANIMATION_ROOT}/bootanimation_main.cpp
        ${BOOTANIMATION_ROOT}/audioplay.cpp

        )

include_directories(${ANDROID_ROOT}/${ANDROID_ROOT}/prebuilts/ndk/current/sources/android/cpufeatures)

add_executable(bootanimation ${SOURCE_FILES})
target_link_libraries(bootanimation
        libOpenSLES
        libandroidfw
        libbase
        libbinder
        libbootanimation
        libcutils
        liblog
        libutils

        )