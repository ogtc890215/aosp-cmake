project(libicuandroid_utils)

set(ICUANDROID_UTILS_ROOT ${ANDROID_ROOT}/external/icu/android_utils)

add_library(libicuandroid_utils STATIC ${ICUANDROID_UTILS_ROOT}/IcuUtils.cpp)
target_include_directories(libicuandroid_utils PUBLIC
        ${ICUANDROID_UTILS_ROOT}/include
        )
target_link_libraries(libicuandroid_utils
        libicuuc
        liblog
        )