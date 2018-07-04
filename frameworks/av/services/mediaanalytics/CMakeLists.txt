project(mediametrics)

set(MEDIAMETRICS_ROOT ${ANDROID_ROOT}/frameworks/av/services/mediaanalytics)

set(SOURCE_FILES
        ${MEDIAMETRICS_ROOT}/main_mediametrics.cpp
        ${MEDIAMETRICS_ROOT}/MetricsSummarizerCodec.cpp
        ${MEDIAMETRICS_ROOT}/MetricsSummarizerExtractor.cpp
        ${MEDIAMETRICS_ROOT}/MetricsSummarizerPlayer.cpp
        ${MEDIAMETRICS_ROOT}/MetricsSummarizerRecorder.cpp
        ${MEDIAMETRICS_ROOT}/MetricsSummarizer.cpp
        ${MEDIAMETRICS_ROOT}/MediaAnalyticsService.cpp

        ${ANDROID_ROOT}/frameworks/av/media/mediaserver/register.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_executable(mediametrics ${SOURCE_FILES})
target_include_directories(mediametrics PRIVATE
        $(ANDROID_ROOT)/frameworks/av/media/libstagefright/include
        $(ANDROID_ROOT)/frameworks/av/media/libstagefright/rtsp
        $(ANDROID_ROOT)/frameworks/av/media/libstagefright/wifi-display
        $(ANDROID_ROOT)/frameworks/av/media/libstagefright/webm
        $(ANDROID_ROOT)/frameworks/av/include/media
        $(ANDROID_ROOT)/frameworks/av/include/camera
        $(ANDROID_ROOT)/frameworks/native/include/media/openmax
        $(ANDROID_ROOT)/frameworks/native/include/media/hardware
        $(ANDROID_ROOT)/external/tremolo/Tremolo
        $(ANDROID_ROOT)/libcore/include
        )
target_compile_options(mediametrics PRIVATE
        -Werror
        -Wall
        -Wno-error=deprecated-declarations
        )
target_link_libraries(mediametrics
        libcutils
        liblog
        libmedia
        libutils
        libbinder
        libgui
        libmedia
        libmediautils
        libmediametrics
        libstagefright_foundation
        libutils
        )