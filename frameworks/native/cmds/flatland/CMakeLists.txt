project(flatland)

set(FLATLAND_ROOT ${ANDROID_ROOT}/frameworks/native/cmds/flatland)

set(SOURCE_FILES
        ${FLATLAND_ROOT}/Composers.cpp
        ${FLATLAND_ROOT}/GLHelper.cpp
        ${FLATLAND_ROOT}/Renderers.cpp
        ${FLATLAND_ROOT}/Main.cpp
        )

include_directories(${FLATLAND_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/native/include)

add_executable(flatland ${SOURCE_FILES})
target_link_libraries(flatland
        libEGL
        libGLESv2
        libcutils
        libgui
        libui
        libutils
        )