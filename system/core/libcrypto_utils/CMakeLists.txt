project(libcrypto_utils)

set(CRYPTO_UTILS_ROOT ${ANDROID_ROOT}/system/core/libcrypto_utils)

set(SOURCE_FILES
        ${CRYPTO_UTILS_ROOT}/android_pubkey.c
        )


add_library(libcrypto_utils SHARED ${SOURCE_FILES})
target_include_directories(libcrypto_utils PUBLIC
        ${CRYPTO_UTILS_ROOT}/include
        )
target_compile_options(libcrypto_utils PRIVATE
        -Wall
        -Wextra
        -Werror
        )
target_link_libraries(libcrypto_utils
        libcrypto
        )