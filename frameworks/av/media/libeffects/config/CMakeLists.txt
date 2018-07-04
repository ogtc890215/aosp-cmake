project(libeffectsconfig)

set(EFFECTSCONFIG_ROOT ${ANDROID_ROOT}/frameworks/av/media/libeffects/config)

include_directories(${ANDROID_ROOT}/frameworks/av/include)

set(SOURCE_FILES
        ${EFFECTSCONFIG_ROOT}/src/EffectsConfig.cpp
        )

add_library(libeffectsconfig SHARED ${SOURCE_FILES})
target_include_directories(libeffectsconfig PUBLIC
        ${EFFECTSCONFIG_ROOT}/include
        ${ANDROID_ROOT}/system/media/audio/include
        )
target_link_libraries(libeffectsconfig
        liblog
        libtinyxml2
        )