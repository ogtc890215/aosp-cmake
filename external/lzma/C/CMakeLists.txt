project(liblzma)

set(LZMA_ROOT ${ANDROID_ROOT}/external/lzma/C)

set(SOURCE_FILES
        ${LZMA_ROOT}/7zAlloc.c
        ${LZMA_ROOT}/7zArcIn.c
        ${LZMA_ROOT}/7zBuf2.c
        ${LZMA_ROOT}/7zBuf.c
        ${LZMA_ROOT}/7zCrc.c
        ${LZMA_ROOT}/7zCrcOpt.c
        ${LZMA_ROOT}/7zDec.c
        ${LZMA_ROOT}/7zFile.c
        ${LZMA_ROOT}/7zStream.c
        ${LZMA_ROOT}/Aes.c
        ${LZMA_ROOT}/AesOpt.c
        ${LZMA_ROOT}/Alloc.c
        ${LZMA_ROOT}/Bcj2.c
        ${LZMA_ROOT}/Bra86.c
        ${LZMA_ROOT}/Bra.c
        ${LZMA_ROOT}/BraIA64.c
        ${LZMA_ROOT}/CpuArch.c
        ${LZMA_ROOT}/Delta.c
        ${LZMA_ROOT}/LzFind.c
        ${LZMA_ROOT}/Lzma2Dec.c
        ${LZMA_ROOT}/Lzma2Enc.c
        ${LZMA_ROOT}/Lzma86Dec.c
        ${LZMA_ROOT}/Lzma86Enc.c
        ${LZMA_ROOT}/LzmaDec.c
        ${LZMA_ROOT}/LzmaEnc.c
        ${LZMA_ROOT}/LzmaLib.c
        ${LZMA_ROOT}/Ppmd7.c
        ${LZMA_ROOT}/Ppmd7Dec.c
        ${LZMA_ROOT}/Ppmd7Enc.c
        ${LZMA_ROOT}/Sha256.c
        ${LZMA_ROOT}/Sort.c
        ${LZMA_ROOT}/Xz.c
        ${LZMA_ROOT}/XzCrc64.c
        ${LZMA_ROOT}/XzCrc64Opt.c
        ${LZMA_ROOT}/XzDec.c
        ${LZMA_ROOT}/XzEnc.c
        ${LZMA_ROOT}/XzIn.c
        )

add_library(liblzma SHARED ${SOURCE_FILES})
target_include_directories(liblzma PUBLIC
        ${LZMA_ROOT}
        )
target_compile_definitions(liblzma PRIVATE
        -D_7ZIP_ST
        )
target_compile_options(liblzma PRIVATE
        -Wno-empty-body
        -Wno-self-assign
        -Werror
        )