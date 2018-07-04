project(libmediadrm)

set(MEDIADRM_ROOT ${ANDROID_ROOT}/frameworks/av/drm/libmediadrm)

set(SOURCE_FILES
        ${MEDIADRM_ROOT}/DrmPluginPath.cpp
        ${MEDIADRM_ROOT}/DrmSessionManager.cpp
        ${MEDIADRM_ROOT}/ICrypto.cpp
        ${MEDIADRM_ROOT}/IDrm.cpp
        ${MEDIADRM_ROOT}/IDrmClient.cpp
        ${MEDIADRM_ROOT}/IMediaDrmService.cpp
        ${MEDIADRM_ROOT}/PluginMetricsReporting.cpp
        ${MEDIADRM_ROOT}/SharedLibrary.cpp
        ${MEDIADRM_ROOT}/DrmHal.cpp
        ${MEDIADRM_ROOT}/CryptoHal.cpp

        ${INTERMEDIATES_ROOT}/frameworks/av/drm/libmediadrm/libmediadrm/android_arm64_armv8-a_cortex-a53_shared_core/gen/proto/frameworks/av/drm/libmediadrm/protos/plugin_metrics.pb.cc
        )

include_directories(${INTERMEDIATES_ROOT}/frameworks/av/drm/libmediadrm/libmediadrm/android_arm64_armv8-a_cortex-a53_shared_core/gen/proto/)
include_directories(${INTERMEDIATES_ROOT}/frameworks/av/drm/libmediadrm/libmediadrm/android_arm64_armv8-a_cortex-a53_shared_core/gen/proto/frameworks/av/drm/libmediadrm)

include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include)

add_library(libmediadrm SHARED ${SOURCE_FILES})
target_link_libraries(libmediadrm
        libbinder
        libcutils
        liblog
        libmediametrics
        libmediautils
        libstagefright_foundation
        libutils
        libhidlbase
        libhidlmemory
        libhidltransport
        libprotobuf-cpp-lite

        android.hardware.drm-1.0
        )