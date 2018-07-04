project(mediaextractor)

set(MEDIAEXTRACTOR_ROOT ${ANDROID_ROOT}/frameworks/av/services/mediaextractor)

include_directories(${MEDIAEXTRACTOR_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)


add_library(libmediaextractorservice SHARED ${MEDIAEXTRACTOR_ROOT}/MediaExtractorService.cpp)
target_link_libraries(libmediaextractorservice
        libmedia
        libstagefright
        libbinder
        libutils
        liblog
        )

include_directories(${ANDROID_ROOT}/frameworks/av/media/libmedia)


add_executable(mediaextractor ${MEDIAEXTRACTOR_ROOT}/main_extractorservice.cpp)
target_link_libraries(mediaextractor
        libmedia
        libmediaextractorservice
        libbinder
        libutils
        liblog
        libbase
        libicuuc
        libavservices_minijail

        libicuandroid_utils
        )