project(libminikin)

set(MINIKIN_ROOT ${ANDROID_ROOT}/frameworks/minikin/libs/minikin)

set(SOURCE_FILES
        ${MINIKIN_ROOT}/Hyphenator.cpp

        ${MINIKIN_ROOT}/CmapCoverage.cpp
        ${MINIKIN_ROOT}/Emoji.cpp
        ${MINIKIN_ROOT}/FontCollection.cpp
        ${MINIKIN_ROOT}/FontFamily.cpp
        ${MINIKIN_ROOT}/FontLanguage.cpp
        ${MINIKIN_ROOT}/FontLanguageListCache.cpp
        ${MINIKIN_ROOT}/FontUtils.cpp
        ${MINIKIN_ROOT}/GraphemeBreak.cpp
        ${MINIKIN_ROOT}/HbFontCache.cpp
        ${MINIKIN_ROOT}/Layout.cpp
        ${MINIKIN_ROOT}/LayoutUtils.cpp
        ${MINIKIN_ROOT}/LineBreaker.cpp
        ${MINIKIN_ROOT}/Measurement.cpp
        ${MINIKIN_ROOT}/MinikinInternal.cpp
        ${MINIKIN_ROOT}/MinikinFont.cpp
        ${MINIKIN_ROOT}/SparseBitSet.cpp
        ${MINIKIN_ROOT}/WordBreaker.cpp
        )


add_library(libminikin SHARED ${SOURCE_FILES})
target_include_directories(libminikin PUBLIC
        ${MINIKIN_ROOT}
        ${ANDROID_ROOT}/external/freetype/include
        ${ANDROID_ROOT}/frameworks/minikin/include
        ${ANDROID_ROOT}/external/icu/icu4c/source/common
        ${ANDROID_ROOT}/external/googletest/googletest/include
        )
target_compile_definitions(libminikin PRIVATE
        -DENABLE_RACE_DETECTION
        )
target_compile_options(libminikin PRIVATE
        -Werror
        -Wall
        -Wextra

        -fsanitize=signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libminikin
        libharfbuzz_ng
        libft2
        libz
        libutils
        liblog
        libicuuc
        )