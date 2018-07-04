project(audiopolicy)

set(AUDIOPOLICY_ROOT ${ANDROID_ROOT}/frameworks/av/services/audiopolicy)

include_directories(${AUDIOPOLICY_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/av/services/audiopolicy/engineconfigurable/include)
include_directories(${ANDROID_ROOT}/frameworks/av/services/audiopolicy/common/include)
include_directories(${ANDROID_ROOT}/frameworks/av/services/audiopolicy/engine/interface)
include_directories(${ANDROID_ROOT}/frameworks/av/services/audiopolicy/utilities)

add_library(libaudiopolicymanagerdefault SHARED ${AUDIOPOLICY_ROOT}/managerdefault/AudioPolicyManager.cpp)
target_compile_definitions(libaudiopolicymanagerdefault PRIVATE
        -DUSE_XML_AUDIO_POLICY_CONF
        )
target_compile_options(libaudiopolicymanagerdefault PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libaudiopolicymanagerdefault
        libcutils
        libutils
        liblog
        libsoundtrigger
        libmedia_helper
        libicuuc
        libxml2

        libaudiopolicyengineconfigurable
        libaudiopolicycomponents
        )

add_library(libaudiopolicymanager SHARED ${AUDIOPOLICY_ROOT}/manager/AudioPolicyFactory.cpp)
target_compile_options(libaudiopolicymanager PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libaudiopolicymanager
        libaudiopolicymanagerdefault
        libaudiopolicycomponents
        )

set(SOURCE_FILES
        ${AUDIOPOLICY_ROOT}/service/AudioPolicyService.cpp
        ${AUDIOPOLICY_ROOT}/service/AudioPolicyEffects.cpp
        ${AUDIOPOLICY_ROOT}/service/AudioPolicyInterfaceImpl.cpp
        ${AUDIOPOLICY_ROOT}/service/AudioPolicyClientImpl.cpp
        )

include_directories(${ANDROID_ROOT}/system/media/audio_utils/include)
include_directories(${ANDROID_ROOT}/frameworks/av/services/audioflinger)

add_library(libaudiopolicyservice SHARED ${SOURCE_FILES})
target_compile_options(libaudiopolicyservice PRIVATE
        -fvisibility=hidden
        -Werror
        -Wall
        )
target_link_libraries(libaudiopolicyservice
        libcutils
        libutils
        liblog
        libbinder
        libaudioclient
        libhardware_legacy
        libserviceutility
        libaudiopolicymanager
        libmedia_helper
        libeffectsconfig

        libaudiopolicycomponents
        )
