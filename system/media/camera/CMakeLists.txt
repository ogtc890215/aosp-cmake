project(libcamera_metadata)

set(CAMERA_METADATA_ROOT ${ANDROID_ROOT}/system/media/camera)

set(SOURCE_FILES
        ${CAMERA_METADATA_ROOT}/src/camera_metadata.c
        )

include_directories(${ANDROID_ROOT}/system/media/private/camera/include)


add_library(libcamera_metadata SHARED ${SOURCE_FILES})
target_include_directories(libcamera_metadata PUBLIC
        ${CAMERA_METADATA_ROOT}/include
        )
target_compile_definitions(libcamera_metadata PRIVATE
        -DLOG_NDEBUG=1
        )
target_compile_options(libcamera_metadata PRIVATE
        -Wall
        -Werror
        -Wextra
        -fvisibility=hidden
        -std=c11
        )
target_link_libraries(libcamera_metadata
        liblog
        libcutils
        )