project(servicemanager)

set(SERVICEMANAGER_ROOT ${ANDROID_ROOT}/frameworks/native/cmds/servicemanager)

set(SOURCE_FILES
        ${SERVICEMANAGER_ROOT}/service_manager.c
        ${SERVICEMANAGER_ROOT}/binder.c
        )

include_directories(${SERVICEMANAGER_ROOT})

add_executable(servicemanager ${SOURCE_FILES})
target_compile_options(servicemanager PRIVATE
        -Wall
        -Werror
        -Wextra
        )
target_link_libraries(servicemanager
        libcutils
        libselinux
        liblog
        )