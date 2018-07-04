project(mediaserver)

set(MEDIASERVER_ROOT ${ANDROID_ROOT}/frameworks/av/media/mediaserver)

set(SOURCE_FILES
        ${MEDIASERVER_ROOT}/register.cpp
        ${MEDIASERVER_ROOT}/main_mediaserver.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_executable(mediaserver ${SOURCE_FILES})
target_include_directories(mediaserver PRIVATE
        ${ANDROID_ROOT}/frameworks/av/media/libmediaplayerservice
        ${ANDROID_ROOT}/frameworks/av/services/mediaresourcemanager
        )
target_compile_options(mediaserver PRIVATE
        -Werror
        -Wall
        )
target_link_libraries(mediaserver
        libicuandroid_utils

        libresourcemanagerservice
        liblog
        libmediaplayerservice
        libutils
        libbinder
        libicuuc
        android.hardware.media.omx-1.0
        )