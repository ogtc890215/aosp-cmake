project(libvorbisidec)

set(TREMOLO_ROOT ${ANDROID_ROOT}/external/tremolo)

set(SOURCE_FILES
        ${TREMOLO_ROOT}/Tremolo/bitwise.c
        ${TREMOLO_ROOT}/Tremolo/codebook.c
        ${TREMOLO_ROOT}/Tremolo/dsp.c
        ${TREMOLO_ROOT}/Tremolo/floor0.c
        ${TREMOLO_ROOT}/Tremolo/floor1.c
        ${TREMOLO_ROOT}/Tremolo/floor_lookup.c
        ${TREMOLO_ROOT}/Tremolo/framing.c
        ${TREMOLO_ROOT}/Tremolo/mapping0.c
        ${TREMOLO_ROOT}/Tremolo/mdct.c
        ${TREMOLO_ROOT}/Tremolo/misc.c
        ${TREMOLO_ROOT}/Tremolo/res012.c
        ${TREMOLO_ROOT}/Tremolo/treminfo.c
        ${TREMOLO_ROOT}/Tremolo/vorbisfile.c
        )

include_directories(${TREMOLO_ROOT}/Tremolo)


add_library(libvorbisidec SHARED ${SOURCE_FILES})
target_include_directories(libvorbisidec PUBLIC
        ${TREMOLO_ROOT}
        )
target_compile_definitions(libvorbisidec PRIVATE
        -DONLY_C
        -D_GNU_SOURCE
        )
target_compile_options(libvorbisidec PRIVATE
        -O2
        -funsigned-char
        )
target_link_libraries(libvorbisidec
        liblog
        )