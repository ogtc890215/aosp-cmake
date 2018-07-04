project(libnbaio)

set(NBAIO_ROOT ${ANDROID_ROOT}/frameworks/av/media/libnbaio)

set(SOURCE_FILES
        ${NBAIO_ROOT}/MonoPipe.cpp
        ${NBAIO_ROOT}/MonoPipeReader.cpp
        ${NBAIO_ROOT}/NBAIO.cpp

        ${NBAIO_ROOT}/AudioBufferProviderSource.cpp
        ${NBAIO_ROOT}/AudioStreamInSource.cpp
        ${NBAIO_ROOT}/AudioStreamOutSink.cpp
        ${NBAIO_ROOT}/NBLog.cpp
        ${NBAIO_ROOT}/PerformanceAnalysis.cpp
        ${NBAIO_ROOT}/Pipe.cpp
        ${NBAIO_ROOT}/PipeReader.cpp
        ${NBAIO_ROOT}/ReportPerformance.cpp
        ${NBAIO_ROOT}/SourceAudioBufferProvider.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/system/media/audio_utils/include)
include_directories(${ANDROID_ROOT}/system/media/audio/include)
include_directories(${NBAIO_ROOT}/include/media/nbaio)

add_library(libnbaio SHARED ${SOURCE_FILES})
target_include_directories(libnbaio PUBLIC
        ${NBAIO_ROOT}/include
        ${NBAIO_ROOT}/include_mono
        ${ANDROID_ROOT}/frameworks/av/media/libaudioclient/include
        ${ANDROID_ROOT}/frameworks/av/media/libmedia/include
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/include
        ${ANDROID_ROOT}/frameworks/av/media/libstagefright/foundation/include
        ${ANDROID_ROOT}/frameworks/native/headers/media_plugin
        ${ANDROID_ROOT}/frameworks/native/headers/media_plugin/media/openmax
        )
target_compile_options(libnbaio PRIVATE
        -Werror
        -Wall
        )
target_link_libraries(libnbaio
        libaudioutils
        liblog
        libutils
        libbinder
        libcutils
        )
