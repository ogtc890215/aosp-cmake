project(libexif)

set(EXIF_ROOT ${ANDROID_ROOT}/external/libexif)

set(SOURCE_FILES
        ${EXIF_ROOT}/libexif/exif-byte-order.c
        ${EXIF_ROOT}/libexif/exif-content.c
        ${EXIF_ROOT}/libexif/exif-data.c
        ${EXIF_ROOT}/libexif/exif-entry.c
        ${EXIF_ROOT}/libexif/exif-format.c
        ${EXIF_ROOT}/libexif/exif-ifd.c
        ${EXIF_ROOT}/libexif/exif-loader.c
        ${EXIF_ROOT}/libexif/exif-log.c
        ${EXIF_ROOT}/libexif/exif-mem.c
        ${EXIF_ROOT}/libexif/exif-mnote-data.c
        ${EXIF_ROOT}/libexif/exif-tag.c
        ${EXIF_ROOT}/libexif/exif-utils.c
        ${EXIF_ROOT}/libexif/canon/exif-mnote-data-canon.c
        ${EXIF_ROOT}/libexif/canon/mnote-canon-entry.c
        ${EXIF_ROOT}/libexif/canon/mnote-canon-tag.c
        ${EXIF_ROOT}/libexif/olympus/exif-mnote-data-olympus.c
        ${EXIF_ROOT}/libexif/olympus/mnote-olympus-tag.c
        ${EXIF_ROOT}/libexif/olympus/mnote-olympus-entry.c
        ${EXIF_ROOT}/libexif/fuji/exif-mnote-data-fuji.c
        ${EXIF_ROOT}/libexif/fuji/mnote-fuji-entry.c
        ${EXIF_ROOT}/libexif/fuji/mnote-fuji-tag.c
        ${EXIF_ROOT}/libexif/pentax/exif-mnote-data-pentax.c
        ${EXIF_ROOT}/libexif/pentax/mnote-pentax-entry.c
        ${EXIF_ROOT}/libexif/pentax/mnote-pentax-tag.c
        )


add_library(libexif SHARED ${SOURCE_FILES})
target_include_directories(libexif PUBLIC
        ${EXIF_ROOT}
        )
target_compile_options(libexif PRIVATE
        -ftrapv
        -Wno-conversion
        -Wno-unused-parameter
        -Wno-missing-field-initializers
        -Wno-switch
        -Wno-absolute-value
        -Werror
        )