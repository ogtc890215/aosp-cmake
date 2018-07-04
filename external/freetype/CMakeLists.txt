project(libft2)

set(FT2_ROOT ${ANDROID_ROOT}/external/freetype)

set(SOURCE_FILES
        ${FT2_ROOT}/src/base/ftbbox.c
        ${FT2_ROOT}/src/base/ftbitmap.c
        ${FT2_ROOT}/src/base/ftfntfmt.c
        ${FT2_ROOT}/src/base/ftfstype.c
        ${FT2_ROOT}/src/base/ftglyph.c
        ${FT2_ROOT}/src/base/ftlcdfil.c
        ${FT2_ROOT}/src/base/ftstroke.c
        ${FT2_ROOT}/src/base/fttype1.c
        ${FT2_ROOT}/src/base/ftbase.c
        ${FT2_ROOT}/src/base/ftsystem.c
        ${FT2_ROOT}/src/base/ftinit.c
        ${FT2_ROOT}/src/base/ftgasp.c
        ${FT2_ROOT}/src/base/ftmm.c
        ${FT2_ROOT}/src/gzip/ftgzip.c
        ${FT2_ROOT}/src/raster/raster.c
        ${FT2_ROOT}/src/sfnt/sfnt.c
        ${FT2_ROOT}/src/smooth/smooth.c
        ${FT2_ROOT}/src/autofit/autofit.c
        ${FT2_ROOT}/src/truetype/truetype.c
        ${FT2_ROOT}/src/cff/cff.c
        ${FT2_ROOT}/src/psnames/psnames.c
        ${FT2_ROOT}/src/pshinter/pshinter.c
        )


add_library(libft2 SHARED ${SOURCE_FILES})
target_include_directories(libft2 PUBLIC
        ${FT2_ROOT}/include
        )
target_compile_definitions(libft2 PRIVATE
        -DPIC
        -DDARWIN_NO_CARBON
        -DFT2_BUILD_LIBRARY
        )
target_compile_options(libft2 PRIVATE
        -W
        -Wall
        -fPIC
        -O2
        )
target_link_libraries(libft2
        libpng
        libz
        )