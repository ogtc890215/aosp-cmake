project(libmidi)

set(MIDI_ROOT ${ANDROID_ROOT}/frameworks/base/media/native/midi)

set(SOURCE_FILES
        ${MIDI_ROOT}/midi.cpp
        ${INTERMEDIATES_ROOT}/frameworks/base/media/native/midi/libmidi/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl/frameworks/base/media/java/android/media/midi/IMidiDeviceServer.cpp
        )


add_library(libmidi SHARED ${SOURCE_FILES})
target_include_directories(libmidi PUBLIC
        ${INTERMEDIATES_ROOT}/frameworks/base/media/native/midi/libmidi/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl
        ${MIDI_ROOT}
        )
target_compile_options(libmidi PRIVATE
        -Wall
        -Werror
        -O0
        )
target_link_libraries(libmidi
        liblog
        libbinder
        libutils
        libmedia
        )

