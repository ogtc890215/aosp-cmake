project(libresourcemanagerservice)

set(RESOURCEMANAGERSERVICE_ROOT ${ANDROID_ROOT}/frameworks/av/services/mediaresourcemanager)

include_directories(${RESOURCEMANAGERSERVICE_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)

set(SOURCE_FILES
        ${RESOURCEMANAGERSERVICE_ROOT}/ResourceManagerService.cpp
        ${RESOURCEMANAGERSERVICE_ROOT}/ServiceLog.cpp
        )

add_library(libresourcemanagerservice SHARED ${SOURCE_FILES})
target_compile_options(libresourcemanagerservice PRIVATE
        -Werror
        -Wall
        )
target_link_libraries(libresourcemanagerservice
        libmedia
        libmediautils
        libbinder
        libutils
        liblog
        )