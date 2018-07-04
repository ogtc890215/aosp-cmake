project(libharfbuzz_ng)

set(HARFBUZZ_NG_ROOT ${ANDROID_ROOT}/external/harfbuzz_ng)

set(SOURCE_FILES
        ${HARFBUZZ_NG_ROOT}/src/hb-blob.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-buffer-serialize.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-buffer.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-common.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-face.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-font.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-tag.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-set.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-shape.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-shape-plan.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-shaper.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-unicode.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-warning.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-font.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-layout.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-map.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-math.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-complex-arabic.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-complex-default.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-complex-hangul.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-complex-hebrew.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-complex-indic.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-complex-indic-table.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-complex-myanmar.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-complex-thai.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-complex-tibetan.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-complex-use.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-complex-use-table.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-normalize.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-shape-fallback.cc
        ${HARFBUZZ_NG_ROOT}/src/hb-ot-var.cc

        ${HARFBUZZ_NG_ROOT}/src/hb-icu.cc
        )


add_library(libharfbuzz_ng SHARED ${SOURCE_FILES})
target_include_directories(libharfbuzz_ng PUBLIC
        ${HARFBUZZ_NG_ROOT}/src
        )
target_compile_definitions(libharfbuzz_ng PRIVATE
        -DHB_NO_MT
        -DHAVE_OT
        -DHAVE_ICU
        -DHAVE_ICU_BUILTIN
        )
target_compile_options(libharfbuzz_ng PRIVATE
        -Werror
        -Wno-unused-parameter
        -Wno-missing-field-initializers
        )
target_link_libraries(libharfbuzz_ng
        libcutils
        libicuuc
        libicui18n
        libutils
        liblog
        )