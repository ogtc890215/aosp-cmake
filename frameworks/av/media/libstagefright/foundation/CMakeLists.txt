project(libstagefright_foundation)

set(STAGEFRIGHT_FOUNDATION_ROOT ${ANDROID_ROOT}/frameworks/av/media/libstagefright/foundation)

set(SOURCE_FILES
        ${STAGEFRIGHT_FOUNDATION_ROOT}/AAtomizer.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/ABitReader.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/ABuffer.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/ADebug.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/AHandler.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/AHierarchicalStateMachine.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/ALooper.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/ALooperRoster.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/AMessage.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/ANetworkSession.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/AString.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/AStringUtils.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/AWakeLock.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/ColorUtils.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/MediaBuffer.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/MediaBufferGroup.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/MetaData.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/ParsedMessage.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/base64.cpp
        ${STAGEFRIGHT_FOUNDATION_ROOT}/hexdump.cpp
        )

include_directories(${STAGEFRIGHT_FOUNDATION_ROOT}/include/media/stagefright/foundation)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/frameworks/av/include)


add_library(libstagefright_foundation SHARED ${SOURCE_FILES})
target_include_directories(libstagefright_foundation PUBLIC
        ${STAGEFRIGHT_FOUNDATION_ROOT}/include
        ${ANDROID_ROOT}/frameworks/native/libs/arect/include
        ${ANDROID_ROOT}/frameworks/native/libs/nativebase/include
        ${ANDROID_ROOT}/hardware/libhardware/include
        ${ANDROID_ROOT}/frameworks/native/libs/ui/include
        )
target_compile_options(libstagefright_foundation PRIVATE
        -Wno-multichar
        -Werror
        -Wall
        -fsanitize=unsigned-integer-overflow,signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libstagefright_foundation
        libbinder
        libutils
        libui
        libcutils
        liblog
        libpowermanager
        )