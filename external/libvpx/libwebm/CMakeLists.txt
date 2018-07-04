project(libwebm)

set(WEBM_ROOT ${ANDROID_ROOT}/external/libvpx/libwebm)


add_library(libwebm STATIC ${WEBM_ROOT}/mkvparser/mkvparser.cc)
target_include_directories(libwebm PUBLIC
        ${WEBM_ROOT}
        )