project(libaudioeffect_jni)

set(AUDIOEFFECT_JNI_ROOT ${ANDROID_ROOT}/frameworks/base/media/jni/audioeffect)

set(SOURCE_FILES
        ${AUDIOEFFECT_JNI_ROOT}/android_media_AudioEffect.cpp
        ${AUDIOEFFECT_JNI_ROOT}/android_media_Visualizer.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_library(libaudioeffect_jni SHARED ${SOURCE_FILES})
target_compile_options(libaudioeffect_jni PRIVATE
        -Wall
        -Werror
        -Wunused
        -Wunreachable-code
        )
target_link_libraries(libaudioeffect_jni
        liblog
        libcutils
        libutils
        libandroid_runtime
        libnativehelper
        libmedia
        libaudioclient
        )