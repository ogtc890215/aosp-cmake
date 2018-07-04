project(libimg_utils)

set(IMG_UTILS_ROOT ${ANDROID_ROOT}/frameworks/av/media/img_utils)

set(SOURCE_FILES
        ${IMG_UTILS_ROOT}/src/EndianUtils.cpp
        ${IMG_UTILS_ROOT}/src/FileInput.cpp
        ${IMG_UTILS_ROOT}/src/FileOutput.cpp
        ${IMG_UTILS_ROOT}/src/SortedEntryVector.cpp
        ${IMG_UTILS_ROOT}/src/Input.cpp
        ${IMG_UTILS_ROOT}/src/Output.cpp
        ${IMG_UTILS_ROOT}/src/Orderable.cpp
        ${IMG_UTILS_ROOT}/src/TiffIfd.cpp
        ${IMG_UTILS_ROOT}/src/TiffWritable.cpp
        ${IMG_UTILS_ROOT}/src/TiffWriter.cpp
        ${IMG_UTILS_ROOT}/src/TiffEntry.cpp
        ${IMG_UTILS_ROOT}/src/TiffEntryImpl.cpp
        ${IMG_UTILS_ROOT}/src/ByteArrayOutput.cpp
        ${IMG_UTILS_ROOT}/src/DngUtils.cpp
        ${IMG_UTILS_ROOT}/src/StripSource.cpp
        )


add_library(libimg_utils SHARED ${SOURCE_FILES})
target_include_directories(libimg_utils PUBLIC
        ${IMG_UTILS_ROOT}/include
        )
target_compile_definitions(libimg_utils PRIVATE
        -DLOG_NDEBUG=1
        )
target_compile_options(libimg_utils PRIVATE
        -Wall
        -Wextra
        -Werror
        -fvisibility=hidden
        )
target_link_libraries(libimg_utils
        liblog
        libutils
        libcutils
        )