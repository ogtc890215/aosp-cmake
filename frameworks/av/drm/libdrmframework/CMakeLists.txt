project(libdrmframework)

set(DRMFRAMEWORK_ROOT ${ANDROID_ROOT}/frameworks/av/drm/libdrmframework)

set(SOURCE_FILES
        ${DRMFRAMEWORK_ROOT}/DrmManagerClientImpl.cpp
        ${DRMFRAMEWORK_ROOT}/DrmManagerClient.cpp
        ${DRMFRAMEWORK_ROOT}/NoOpDrmManagerClientImpl.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)


add_library(libdrmframework SHARED ${SOURCE_FILES})
target_include_directories(libdrmframework PUBLIC
        ${DRMFRAMEWORK_ROOT}/include
        ${ANDROID_ROOT}/frameworks/av/drm/common/include
        )
target_compile_options(libdrmframework PRIVATE
        -Werror
        )
target_link_libraries(libdrmframework
        libutils
        libcutils
        liblog
        libbinder

        libdrmframeworkcommon
        )