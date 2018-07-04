project(drmserver)

set(DRMSERVER_ROOT ${ANDROID_ROOT}/frameworks/av/drm/drmserver)

set(SOURCE_FILES
        ${DRMSERVER_ROOT}/main_drmserver.cpp
        ${DRMSERVER_ROOT}/DrmManager.cpp
        ${DRMSERVER_ROOT}/DrmManagerService.cpp
        )

include_directories(${DRMSERVER_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_executable(drmserver ${SOURCE_FILES})
target_compile_options(drmserver PRIVATE
        -Werror
        -Wall
        -Wextra
        )
target_link_libraries(drmserver
        libmedia
        libutils
        liblog
        libbinder
        libselinux

        libdrmframeworkcommon
        )