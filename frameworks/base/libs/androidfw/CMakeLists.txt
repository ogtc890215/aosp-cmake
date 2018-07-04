project(libandroidfw)

set(ANDROIDFW_ROOT ${ANDROID_ROOT}/frameworks/base/libs/androidfw)

set(SOURCE_FILES
        ${ANDROIDFW_ROOT}/ApkAssets.cpp
        ${ANDROIDFW_ROOT}/Asset.cpp
        ${ANDROIDFW_ROOT}/AssetDir.cpp
        ${ANDROIDFW_ROOT}/AssetManager.cpp
        ${ANDROIDFW_ROOT}/AssetManager2.cpp
        ${ANDROIDFW_ROOT}/AttributeResolution.cpp
        ${ANDROIDFW_ROOT}/ChunkIterator.cpp
        ${ANDROIDFW_ROOT}/LoadedArsc.cpp
        ${ANDROIDFW_ROOT}/LocaleData.cpp
        ${ANDROIDFW_ROOT}/misc.cpp
        ${ANDROIDFW_ROOT}/ObbFile.cpp
        ${ANDROIDFW_ROOT}/ResourceTypes.cpp
        ${ANDROIDFW_ROOT}/ResourceUtils.cpp
        ${ANDROIDFW_ROOT}/StreamingZipInflater.cpp
        ${ANDROIDFW_ROOT}/TypeWrappers.cpp
        ${ANDROIDFW_ROOT}/Util.cpp
        ${ANDROIDFW_ROOT}/ZipFileRO.cpp
        ${ANDROIDFW_ROOT}/ZipUtils.cpp

        ${ANDROIDFW_ROOT}/BackupData.cpp
        ${ANDROIDFW_ROOT}/BackupHelpers.cpp
        ${ANDROIDFW_ROOT}/CursorWindow.cpp
        ${ANDROIDFW_ROOT}/DisplayEventDispatcher.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libandroidfw SHARED ${SOURCE_FILES})
target_include_directories(libandroidfw PUBLIC
        ${ANDROIDFW_ROOT}/include
        )
target_compile_options(libandroidfw PRIVATE
        -Wall
        -Werror
        -Wunused
        -Wunreachable-code
        )
target_link_libraries(libandroidfw
        libziparchive
        libbase
        libbinder
        liblog
        libcutils
        libgui
        libutils
        libz
        )