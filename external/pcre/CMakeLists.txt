project(libpcre2)

set(PCRE_ROOT ${ANDROID_ROOT}/external/pcre)

set(SOURCE_FILES
        ${PCRE_ROOT}/dist2/src/pcre2_auto_possess.c
        ${PCRE_ROOT}/dist2/src/pcre2_compile.c
        ${PCRE_ROOT}/dist2/src/pcre2_config.c
        ${PCRE_ROOT}/dist2/src/pcre2_context.c
        ${PCRE_ROOT}/dist2/src/pcre2_dfa_match.c
        ${PCRE_ROOT}/dist2/src/pcre2_error.c
        ${PCRE_ROOT}/dist2/src/pcre2_find_bracket.c
        ${PCRE_ROOT}/dist2/src/pcre2_maketables.c
        ${PCRE_ROOT}/dist2/src/pcre2_match.c
        ${PCRE_ROOT}/dist2/src/pcre2_match_data.c
        ${PCRE_ROOT}/dist2/src/pcre2_jit_compile.c
        ${PCRE_ROOT}/dist2/src/pcre2_newline.c
        ${PCRE_ROOT}/dist2/src/pcre2_ord2utf.c
        ${PCRE_ROOT}/dist2/src/pcre2_pattern_info.c
        ${PCRE_ROOT}/dist2/src/pcre2_serialize.c
        ${PCRE_ROOT}/dist2/src/pcre2_string_utils.c
        ${PCRE_ROOT}/dist2/src/pcre2_study.c
        ${PCRE_ROOT}/dist2/src/pcre2_substitute.c
        ${PCRE_ROOT}/dist2/src/pcre2_substring.c
        ${PCRE_ROOT}/dist2/src/pcre2_tables.c
        ${PCRE_ROOT}/dist2/src/pcre2_ucd.c
        ${PCRE_ROOT}/dist2/src/pcre2_valid_utf.c
        ${PCRE_ROOT}/dist2/src/pcre2_xclass.c
        ${PCRE_ROOT}/dist2/src/pcre2_chartables.c
        )

include_directories(${PCRE_ROOT}/include_internal)


add_library(libpcre2 SHARED ${SOURCE_FILES})
target_include_directories(libpcre2 PUBLIC
        ${PCRE_ROOT}/include
        )
target_compile_definitions(libpcre2 PRIVATE
        -DHAVE_CONFIG_H
        )