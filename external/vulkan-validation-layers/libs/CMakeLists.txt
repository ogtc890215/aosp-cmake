project(vklibs)

set(VK_LIBS_ROOT ${ANDROID_ROOT}/external/vulkan-validation-layers/libs)

add_library(cjson STATIC ${VK_LIBS_ROOT}/cjson/cJSON.c)
target_include_directories(cjson PUBLIC
        ${VK_LIBS_ROOT}/cjson/includes
        )

set(SOURCE_FILES
        ${VK_LIBS_ROOT}/vkjson/vkjson.cc
        ${VK_LIBS_ROOT}/vkjson/vkjson_instance.cc
        )

include_directories(${ANDROID_ROOT}/frameworks/native/vulkan/include)

add_library(libvkjson STATIC ${SOURCE_FILES})
target_include_directories(libvkjson PUBLIC
        ${VK_LIBS_ROOT}/vkjson
        )
target_compile_options(libvkjson PRIVATE
        -std=c++11
        -Wno-sign-compare
        )
target_link_libraries(libvkjson
        cjson
        )