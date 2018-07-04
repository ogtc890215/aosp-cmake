project(libaudiopolicyengineconfigurable)

set(AUDIOPOLICYENGINECONFIGURABLE_ROOT ${ANDROID_ROOT}/frameworks/av/services/audiopolicy/engineconfigurable)

set(SOURCE_FILES
        ${AUDIOPOLICYENGINECONFIGURABLE_ROOT}/src/Engine.cpp
        ${AUDIOPOLICYENGINECONFIGURABLE_ROOT}/src/EngineInstance.cpp
        ${AUDIOPOLICYENGINECONFIGURABLE_ROOT}/src/Stream.cpp
        ${AUDIOPOLICYENGINECONFIGURABLE_ROOT}/src/Strategy.cpp
        ${AUDIOPOLICYENGINECONFIGURABLE_ROOT}/src/Usage.cpp
        ${AUDIOPOLICYENGINECONFIGURABLE_ROOT}/src/InputSource.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/system/media/audio_utils/include)
include_directories(${ANDROID_ROOT}/frameworks/av/services/audiopolicy/common/include)

add_library(libaudiopolicyengineconfigurable SHARED ${SOURCE_FILES})
target_include_directories(libaudiopolicyengineconfigurable PUBLIC
        ${ANDROID_ROOT}/frameworks/av/services/audiopolicy/engineconfigurable/include
        ${ANDROID_ROOT}/frameworks/av/services/audiopolicy/engineconfigurable/interface
        ${ANDROID_ROOT}/frameworks/av/services/audiopolicy/engine/interface
        )
target_compile_options(libaudiopolicyengineconfigurable PRIVATE
        -Wall
        -Werror
        -Wextra
        )
target_link_libraries(libaudiopolicyengineconfigurable
        liblog
        libcutils
        libutils
        liblog
        libaudioutils
        libparameter
        libmedia_helper
        libxml2

        libaudiopolicypfwwrapper
        libaudiopolicycomponents
        )