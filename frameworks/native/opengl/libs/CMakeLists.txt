project(OpenGL)

set(OpenGL_ROOT ${ANDROID_ROOT}/frameworks/native/opengl/libs)

include_directories(${ANDROID_ROOT}/frameworks/native/opengl/include)
add_library(libETC1 SHARED ${OpenGL_ROOT}/ETC1/etc1.cpp)

add_definitions(-DGL_GLEXT_PROTOTYPES)
add_definitions(-DEGL_EGLEXT_PROTOTYPES)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden")

include_directories(${ANDROID_ROOT}/bionic/libc/private)

include_directories(${ANDROID_ROOT}/system/core/libsystem/include)
include_directories(${ANDROID_ROOT}/hardware/libhardware/include)
include_directories(${ANDROID_ROOT}/frameworks/native/libs/nativebase/include)


set(SOURCE_FILES
        ${OpenGL_ROOT}/EGL/egl_tls.cpp
        ${OpenGL_ROOT}/EGL/egl_cache.cpp
        ${OpenGL_ROOT}/EGL/egl_display.cpp
        ${OpenGL_ROOT}/EGL/egl_object.cpp
        ${OpenGL_ROOT}/EGL/egl.cpp
        ${OpenGL_ROOT}/EGL/eglApi.cpp
        ${OpenGL_ROOT}/EGL/Loader.cpp
        ${OpenGL_ROOT}/EGL/BlobCache.cpp

        ${OpenGL_ROOT}/EGL/getProcAddress.cpp
        )


add_library(libEGL SHARED ${SOURCE_FILES})
target_include_directories(libEGL PUBLIC
        ${ANDROID_ROOT}/frameworks/native/opengl/include
        ${OpenGL_ROOT}/EGL/include
        )
target_compile_definitions(libEGL PRIVATE LOG_TAG=\"libEGL\")
target_link_libraries(libEGL
        "-Wl,--exclude-libs=ALL"
        libcutils
        liblog
        libgraphicsenv
        libnativewindow
        libbacktrace
        libvndksupport
        libhidlbase
        libhidltransport
        libutils

        android.hardware.configstore-1.0
        android.hardware.configstore-utils
        )


add_library(libGLESv1_CM SHARED ${OpenGL_ROOT}/GLES_CM/gl.cpp)
target_include_directories(libGLESv1_CM PUBLIC
        ${ANDROID_ROOT}/frameworks/native/opengl/include
        )
target_compile_definitions(libGLESv1_CM PRIVATE
        LOG_TAG=\"libGLESv1\"
        )
target_link_libraries(libGLESv1_CM
        libEGL
        )


add_library(libGLESv2 SHARED ${OpenGL_ROOT}/GLES2/gl2.cpp)
target_include_directories(libGLESv2 PUBLIC
        ${ANDROID_ROOT}/frameworks/native/opengl/include
        )
target_compile_definitions(libGLESv2 PRIVATE
        LOG_TAG=\"libGLESv2\"
        )
target_link_libraries(libGLESv2
        libEGL
        )

add_library(libGLESv3 SHARED ${OpenGL_ROOT}/GLES2/gl2.cpp)
target_include_directories(libGLESv3 PUBLIC
        ${ANDROID_ROOT}/frameworks/native/opengl/include
        )
target_compile_definitions(libGLESv3 PRIVATE
        LOG_TAG=\"libGLESv3\"
        )
target_link_libraries(libGLESv3
        libEGL
        )