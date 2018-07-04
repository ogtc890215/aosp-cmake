project(libcamera_client)

set(CAMERA_CLIENT_ROOT ${ANDROID_ROOT}/frameworks/av/camera)

set(SOURCE_FILES
        ${CAMERA_CLIENT_ROOT}/Camera.cpp
        ${CAMERA_CLIENT_ROOT}/CameraMetadata.cpp
        ${CAMERA_CLIENT_ROOT}/CameraParameters.cpp
        ${CAMERA_CLIENT_ROOT}/CaptureResult.cpp
        ${CAMERA_CLIENT_ROOT}/CameraParameters2.cpp
        ${CAMERA_CLIENT_ROOT}/ICamera.cpp
        ${CAMERA_CLIENT_ROOT}/ICameraClient.cpp
        ${CAMERA_CLIENT_ROOT}/ICameraRecordingProxy.cpp
        ${CAMERA_CLIENT_ROOT}/ICameraRecordingProxyListener.cpp
        ${CAMERA_CLIENT_ROOT}/camera2/CaptureRequest.cpp
        ${CAMERA_CLIENT_ROOT}/camera2/OutputConfiguration.cpp
        ${CAMERA_CLIENT_ROOT}/camera2/SubmitInfo.cpp
        ${CAMERA_CLIENT_ROOT}/CameraBase.cpp
        ${CAMERA_CLIENT_ROOT}/CameraUtils.cpp
        ${CAMERA_CLIENT_ROOT}/VendorTagDescriptor.cpp

        ${INTERMEDIATES_ROOT}/frameworks/av/camera/libcamera_client/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl/frameworks/av/camera/aidl/android/hardware/ICameraService.cpp
        ${INTERMEDIATES_ROOT}/frameworks/av/camera/libcamera_client/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl/frameworks/av/camera/aidl/android/hardware/ICameraServiceListener.cpp
        ${INTERMEDIATES_ROOT}/frameworks/av/camera/libcamera_client/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl/frameworks/av/camera/aidl/android/hardware/ICameraServiceProxy.cpp
        ${INTERMEDIATES_ROOT}/frameworks/av/camera/libcamera_client/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl/frameworks/av/camera/aidl/android/hardware/camera2/ICameraDeviceCallbacks.cpp
        ${INTERMEDIATES_ROOT}/frameworks/av/camera/libcamera_client/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl/frameworks/av/camera/aidl/android/hardware/camera2/ICameraDeviceUser.cpp
        )

include_directories(${ANDROID_ROOT}/system/media/private/camera/include)
include_directories(${ANDROID_ROOT}/frameworks/native/include/media/openmax)
include_directories(${ANDROID_ROOT}/frameworks/native/include)



add_library(libcamera_client SHARED ${SOURCE_FILES})
target_include_directories(libcamera_client PUBLIC
        ${CAMERA_CLIENT_ROOT}/include
        ${CAMERA_CLIENT_ROOT}/include/camera
        ${ANDROID_ROOT}/system/media/camera/include
        ${INTERMEDIATES_ROOT}/frameworks/av/camera/libcamera_client/android_arm64_armv8-a_cortex-a53_shared_core/gen/aidl
        )
target_compile_options(libcamera_client PRIVATE
        -Werror
        -Wall
        -Wextra
        )
target_link_libraries(libcamera_client
        libcutils
        libutils
        liblog
        libbinder
        libgui
        libcamera_metadata
        libnativewindow
        )