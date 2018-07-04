project(protobuf)

set(PROTOBUF_ROOT ${ANDROID_ROOT}/external/protobuf)

set(SOURCE_FILES
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/atomicops_internals_x86_gcc.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/atomicops_internals_x86_msvc.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/bytestream.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/common.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/int128.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/once.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/status.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/statusor.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/stringpiece.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/stringprintf.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/structurally_valid.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/strutil.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/stubs/time.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/arena.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/arenastring.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/extension_set.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/generated_message_util.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/message_lite.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/repeated_field.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/wire_format_lite.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/io/coded_stream.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/io/zero_copy_stream.cc
        ${PROTOBUF_ROOT}/src/google/protobuf/io/zero_copy_stream_impl_lite.cc
        )

include_directories(${PROTOBUF_ROOT}/android)


add_library(libprotobuf-cpp-lite SHARED ${SOURCE_FILES})
target_include_directories(libprotobuf-cpp-lite PUBLIC
        ${PROTOBUF_ROOT}/src
        )
target_compile_definitions(libprotobuf-cpp-lite PRIVATE
        -DGOOGLE_PROTOBUF_NO_RTTI
        )
target_compile_options(libprotobuf-cpp-lite PRIVATE
        -Wno-sign-compare
        -Wno-unused-parameter
        -Wno-sign-promo
        -Wno-error=return-type
        )
target_link_libraries(libprotobuf-cpp-lite
        ${INTERMEDIATES_ROOT}/bionic/libc/crtbegin_so/android_arm64_armv8-a_cortex-a53_core/crtbegin_so.o
        )