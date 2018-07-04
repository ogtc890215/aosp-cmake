#project(libpng)

set(PNG_ROOT ${ANDROID_ROOT}/external/libpng)

set(SOURCE_FILES
        ${PNG_ROOT}/png.c
        ${PNG_ROOT}/pngerror.c
        ${PNG_ROOT}/pngget.c
        ${PNG_ROOT}/pngmem.c
        ${PNG_ROOT}/pngpread.c
        ${PNG_ROOT}/pngread.c
        ${PNG_ROOT}/pngrio.c
        ${PNG_ROOT}/pngrtran.c
        ${PNG_ROOT}/pngrutil.c
        ${PNG_ROOT}/pngset.c
        ${PNG_ROOT}/pngtrans.c
        ${PNG_ROOT}/pngwio.c
        ${PNG_ROOT}/pngwrite.c
        ${PNG_ROOT}/pngwtran.c
        ${PNG_ROOT}/pngwutil.c

        ${PNG_ROOT}/arm/arm_init.c
        ${PNG_ROOT}/arm/filter_neon.S
        ${PNG_ROOT}/arm/filter_neon_intrinsics.c
        )
set_property(SOURCE ${PNG_ROOT}/arm/filter_neon.S PROPERTY LANGUAGE C)

add_library(libpng SHARED ${SOURCE_FILES})
target_include_directories(libpng PUBLIC
        ${PNG_ROOT}
        )
target_compile_options(libpng PRIVATE
        -std=gnu89
        -Wno-unused-parameter
        )
target_link_libraries(libpng
        libz
        )