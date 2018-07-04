project(libstagefright_mpeg2ts)

set(STAGEFRIGHT_MPEG2TS_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/mpeg2ts)

set(SOURCE_FILES
        ${STAGEFRIGHT_MPEG2TS_ROOT}/AnotherPacketSource.cpp
        ${STAGEFRIGHT_MPEG2TS_ROOT}/ATSParser.cpp
        ${STAGEFRIGHT_MPEG2TS_ROOT}/CasManager.cpp
        ${STAGEFRIGHT_MPEG2TS_ROOT}/ESQueue.cpp
        ${STAGEFRIGHT_MPEG2TS_ROOT}/HlsSampleDecryptor.cpp
        ${STAGEFRIGHT_MPEG2TS_ROOT}/MPEG2PSExtractor.cpp
        ${STAGEFRIGHT_MPEG2TS_ROOT}/MPEG2TSExtractor.cpp
        )

include_directories(${STAGEFRIGHT_MPEG2TS_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/media/libstagefright)
include_directories(${ANDROID_ROOT}/frameworks/native/include/media/openmax)
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libstagefright_mpeg2ts STATIC ${SOURCE_FILES})
target_compile_options(libstagefright_mpeg2ts PRIVATE
        -Werror
        -Wall
        -fsanitize=unsigned-integer-overflow,signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_mpeg2ts
        libcrypto
        libmedia
        libhidlmemory

        android.hardware.cas.native-1.0
        android.hidl.memory-1.0
        )