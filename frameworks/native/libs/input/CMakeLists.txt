project(libinput)

set(INPUT_ROOT ${ANDROID_ROOT}/frameworks/native/libs/input)

set(SOURCE_FILES
        ${INPUT_ROOT}/Input.cpp
        ${INPUT_ROOT}/InputDevice.cpp
        ${INPUT_ROOT}/Keyboard.cpp
        ${INPUT_ROOT}/KeyCharacterMap.cpp
        ${INPUT_ROOT}/KeyLayoutMap.cpp
        ${INPUT_ROOT}/VirtualKeyMap.cpp

        ${INPUT_ROOT}/IInputFlinger.cpp
        ${INPUT_ROOT}/InputTransport.cpp
        ${INPUT_ROOT}/VelocityControl.cpp
        ${INPUT_ROOT}/VelocityTracker.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)

add_library(libinput SHARED ${SOURCE_FILES})
target_compile_options(libinput PRIVATE
        -Wall
        -Werror
        -Wextra
        -fsanitize=integer
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libinput
        libbase
        liblog
        libbinder
        libutils
        libcutils
        )