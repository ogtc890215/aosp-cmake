project(libappfuse)

set(APPFUSE_ROOT ${ANDROID_ROOT}/system/core/libappfuse)

set(SOURCE_FILES
        ${APPFUSE_ROOT}/FuseAppLoop.cc
        ${APPFUSE_ROOT}/FuseBuffer.cc
        ${APPFUSE_ROOT}/FuseBridgeLoop.cc
        ${APPFUSE_ROOT}/EpollController.cc
        )


add_library(libappfuse SHARED ${SOURCE_FILES})
target_include_directories(libappfuse PUBLIC
        ${APPFUSE_ROOT}/include
        )
target_compile_options(libappfuse PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libappfuse
        libbase
        )