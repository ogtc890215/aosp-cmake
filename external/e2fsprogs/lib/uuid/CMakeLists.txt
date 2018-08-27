project(libext2_uuid)

set(EXT2_UUID_ROOT ${ANDROID_ROOT}/external/e2fsprogs/lib/uuid)

set(SOURCE_FILES
        ${EXT2_UUID_ROOT}/clear.c
        ${EXT2_UUID_ROOT}/compare.c
        ${EXT2_UUID_ROOT}/copy.c
        ${EXT2_UUID_ROOT}/gen_uuid.c
        ${EXT2_UUID_ROOT}/isnull.c
        ${EXT2_UUID_ROOT}/pack.c
        ${EXT2_UUID_ROOT}/parse.c
        ${EXT2_UUID_ROOT}/unpack.c
        ${EXT2_UUID_ROOT}/unparse.c
        ${EXT2_UUID_ROOT}/uuid_time.c
        )


add_library(libext2_uuid SHARED ${SOURCE_FILES})
target_include_directories(libext2_uuid PUBLIC
        ${ANDROID_ROOT}/external/e2fsprogs/lib
        ${EXT2_UUID_ROOT}
        )
target_compile_options(libext2_uuid PRIVATE
        -W
        -Wall
        -Wno-unused-function
        -Wno-unused-parameter
        )