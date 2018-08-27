project(gralloc)

set(GRALLOC_ROOT ${ANDROID_ROOT}/hardware/libhardware/modules/gralloc)

set(SOURCE_FILES
        ${GRALLOC_ROOT}/gralloc.cpp
        ${GRALLOC_ROOT}/framebuffer.cpp
        ${GRALLOC_ROOT}/mapper.cpp
        )

include_directories(${GRALLOC_ROOT})
include_directories(${ANDROID_ROOT}/hardware/libhardware/include)
include_directories(${ANDROID_ROOT}/system/media/audio/include)
include_directories(${ANDROID_ROOT}/system/core/libsystem/include)

add_library(gralloc.default SHARED ${SOURCE_FILES})
target_compile_definitions(gralloc.default PRIVATE
        LOG_TAG=\"gralloc\"
        )
target_compile_options(gralloc.default PRIVATE
        -Wno-missing-field-initializers
        )
target_link_libraries(gralloc.default
        liblog libcutils
        )