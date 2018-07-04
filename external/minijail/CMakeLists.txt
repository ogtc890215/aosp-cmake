project(minijail)

set(MINIJAIL_ROOT ${ANDROID_ROOT}/external/minijail)

set(SOURCE_FILES
        ${ANDROID_ROOT}/out/target/product/bullhead/gen/STATIC_LIBRARIES/libminijail_generated_intermediates/arm64/libconstants.c
        ${ANDROID_ROOT}/out/target/product/bullhead/gen/STATIC_LIBRARIES/libminijail_generated_intermediates/arm64/libsyscalls.c
        )

include_directories(${MINIJAIL_ROOT})

add_library(libminijail_generated STATIC ${SOURCE_FILES})
target_compile_definitions(libminijail_generated PRIVATE
        -DHAVE_SECUREBITS_H
        )
target_compile_options(libminijail_generated PRIVATE
        -Wall
        -Werror
        )

set(SOURCE_FILES
        ${MINIJAIL_ROOT}/bpf.c
        ${MINIJAIL_ROOT}/libminijail.c
        ${MINIJAIL_ROOT}/signal_handler.c
        ${MINIJAIL_ROOT}/syscall_filter.c
        ${MINIJAIL_ROOT}/syscall_wrapper.c
        ${MINIJAIL_ROOT}/system.c
        ${MINIJAIL_ROOT}/util.c
        )

add_library(libminijail SHARED ${SOURCE_FILES})
target_include_directories(libminijail PUBLIC
        ${MINIJAIL_ROOT}
        )
target_compile_definitions(libminijail PRIVATE
        -DHAVE_SECUREBITS_H
        )
target_compile_options(libminijail PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libminijail
        libminijail_generated

        libcap
        )