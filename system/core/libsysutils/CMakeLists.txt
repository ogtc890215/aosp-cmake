project(libsysutils)

set(SYSUTILS_ROOT ${ANDROID_ROOT}/system/core/libsysutils)

set(SOURCE_FILES
        ${SYSUTILS_ROOT}/src/SocketListener.cpp
        ${SYSUTILS_ROOT}/src/FrameworkListener.cpp
        ${SYSUTILS_ROOT}/src/NetlinkListener.cpp
        ${SYSUTILS_ROOT}/src/NetlinkEvent.cpp
        ${SYSUTILS_ROOT}/src/FrameworkCommand.cpp
        ${SYSUTILS_ROOT}/src/SocketClient.cpp
        ${SYSUTILS_ROOT}/src/ServiceManager.cpp
        )


add_library(libsysutils SHARED ${SOURCE_FILES})
target_include_directories(libsysutils PUBLIC
        ${SYSUTILS_ROOT}/include
        )
target_compile_options(libsysutils PRIVATE
        -Werror
        )
target_link_libraries(libsysutils
        libbase
        libcutils
        liblog
        libnl
        )