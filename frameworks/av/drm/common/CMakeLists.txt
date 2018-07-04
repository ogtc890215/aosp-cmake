project(libdrmframeworkcommon)

set(DRMFRAMEWORKCOMMON_ROOT ${ANDROID_ROOT}/frameworks/av/drm/common)

set(SOURCE_FILES
        ${DRMFRAMEWORKCOMMON_ROOT}/DrmConstraints.cpp
        ${DRMFRAMEWORKCOMMON_ROOT}/DrmMetadata.cpp
        ${DRMFRAMEWORKCOMMON_ROOT}/DrmConvertedStatus.cpp
        ${DRMFRAMEWORKCOMMON_ROOT}/DrmEngineBase.cpp
        ${DRMFRAMEWORKCOMMON_ROOT}/DrmInfo.cpp
        ${DRMFRAMEWORKCOMMON_ROOT}/DrmInfoRequest.cpp
        ${DRMFRAMEWORKCOMMON_ROOT}/DrmInfoStatus.cpp
        ${DRMFRAMEWORKCOMMON_ROOT}/DrmRights.cpp
        ${DRMFRAMEWORKCOMMON_ROOT}/DrmSupportInfo.cpp
        ${DRMFRAMEWORKCOMMON_ROOT}/IDrmManagerService.cpp
        ${DRMFRAMEWORKCOMMON_ROOT}/IDrmServiceListener.cpp
        ${DRMFRAMEWORKCOMMON_ROOT}/DrmInfoEvent.cpp
        ${DRMFRAMEWORKCOMMON_ROOT}/ReadWriteUtils.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_library(libdrmframeworkcommon STATIC ${SOURCE_FILES})
target_include_directories(libdrmframeworkcommon PUBLIC
        ${DRMFRAMEWORKCOMMON_ROOT}/include
        )
target_link_libraries(libdrmframeworkcommon
        libbinder
        )