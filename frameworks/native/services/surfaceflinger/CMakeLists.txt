project(surfaceflinger)

set(SURFACEFLINGER_ROOT ${ANDROID_ROOT}/frameworks/native/services/surfaceflinger)

set(SOURCE_FILES
        ${SURFACEFLINGER_ROOT}/Client.cpp
        ${SURFACEFLINGER_ROOT}/DisplayDevice.cpp
        ${SURFACEFLINGER_ROOT}/DispSync.cpp
        ${SURFACEFLINGER_ROOT}/EventControlThread.cpp
        ${SURFACEFLINGER_ROOT}/StartPropertySetThread.cpp
        ${SURFACEFLINGER_ROOT}/EventThread.cpp
        ${SURFACEFLINGER_ROOT}/FrameTracker.cpp
        ${SURFACEFLINGER_ROOT}/GpuService.cpp
        ${SURFACEFLINGER_ROOT}/Layer.cpp
        ${SURFACEFLINGER_ROOT}/LayerDim.cpp
        ${SURFACEFLINGER_ROOT}/LayerRejecter.cpp
        ${SURFACEFLINGER_ROOT}/LayerVector.cpp
        ${SURFACEFLINGER_ROOT}/MessageQueue.cpp
        ${SURFACEFLINGER_ROOT}/MonitoredProducer.cpp
        ${SURFACEFLINGER_ROOT}/SurfaceFlingerConsumer.cpp
        ${SURFACEFLINGER_ROOT}/SurfaceInterceptor.cpp
        ${SURFACEFLINGER_ROOT}/Transform.cpp
        ${SURFACEFLINGER_ROOT}/DisplayHardware/ComposerHal.cpp
        ${SURFACEFLINGER_ROOT}/DisplayHardware/FramebufferSurface.cpp
        ${SURFACEFLINGER_ROOT}/DisplayHardware/HWC2.cpp
        ${SURFACEFLINGER_ROOT}/DisplayHardware/HWComposerBufferCache.cpp
        ${SURFACEFLINGER_ROOT}/DisplayHardware/PowerHAL.cpp
        ${SURFACEFLINGER_ROOT}/DisplayHardware/VirtualDisplaySurface.cpp
        ${SURFACEFLINGER_ROOT}/Effects/Daltonizer.cpp
        ${SURFACEFLINGER_ROOT}/EventLog/EventLogTags.logtags
        ${SURFACEFLINGER_ROOT}/EventLog/EventLog.cpp
        ${SURFACEFLINGER_ROOT}/RenderEngine/Description.cpp
        ${SURFACEFLINGER_ROOT}/RenderEngine/Mesh.cpp
        ${SURFACEFLINGER_ROOT}/RenderEngine/Program.cpp
        ${SURFACEFLINGER_ROOT}/RenderEngine/ProgramCache.cpp
        ${SURFACEFLINGER_ROOT}/RenderEngine/GLExtensions.cpp
        ${SURFACEFLINGER_ROOT}/RenderEngine/RenderEngine.cpp
        ${SURFACEFLINGER_ROOT}/RenderEngine/Texture.cpp
        ${SURFACEFLINGER_ROOT}/RenderEngine/GLES20RenderEngine.cpp

        ${INTERMEDIATES_ROOT}/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_arm64_armv8-a_cortex-a53_static_core/gen/proto/frameworks/native/cmds/surfacereplayer/proto/src/trace.pb.cc
        )

set(USE_HWC2 1)

if (USE_HWC2)
    list(APPEND SOURCE_FILES ${SURFACEFLINGER_ROOT}/SurfaceFlinger.cpp)
    list(APPEND SOURCE_FILES ${SURFACEFLINGER_ROOT}/DisplayHardware/HWComposer.cpp)
else ()
    list(APPEND SOURCE_FILES ${SURFACEFLINGER_ROOT}/SurfaceFlinger_hwc1.cpp)
    list(APPEND SOURCE_FILES ${SURFACEFLINGER_ROOT}/DisplayHardware/HWComposer_hwc1.cpp)
endif ()

include_directories(${SURFACEFLINGER_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/native/vulkan/include)
include_directories(${ANDROID_ROOT}/external/vulkan-validation-layers/libs/vkjson)
include_directories(${ANDROID_ROOT}/system/libhwbinder/fast_msgq/include)
include_directories(${INTERMEDIATES_ROOT}/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_arm64_armv8-a_cortex-a53_static_core/gen/proto)
include_directories(${ANDROID_ROOT}/frameworks/native/include)
include_directories(${ANDROID_ROOT}/hardware/interfaces/graphics/composer/2.1/default)


add_library(libsurfaceflinger SHARED ${SOURCE_FILES})
target_include_directories(libsurfaceflinger PUBLIC
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++_headers/gen
        ${ANDROID_ROOT}/system/libhidl/base/include
        ${ANDROID_ROOT}/system/libhwbinder/include
        ${ANDROID_ROOT}/system/libhidl/transport/include
        )
if (USE_HWC2)
    target_compile_definitions(libsurfaceflinger PRIVATE
            -DUSE_HWC2
            )
endif ()
target_compile_definitions(libsurfaceflinger PRIVATE
        -DLOG_TAG=\"SurfaceFlinger\"
        -DGL_GLEXT_PROTOTYPES
        -DEGL_EGLEXT_PROTOTYPES
        )
target_compile_options(libsurfaceflinger PRIVATE
        -fvisibility=hidden
        -Werror=format
        -Wall
        -Werror
        -Wunused
        -Wunreachable-code
        -std=c++1z
        )
target_link_libraries(libsurfaceflinger
        android.frameworks.vr.composer-1.0
        android.hardware.graphics.allocator-2.0
        android.hardware.graphics.composer-2.1
        android.hardware.configstore-1.0
        android.hardware.configstore-utils
        android.hardware.power-1.0

        libcutils
        liblog
        libfmq
        libhardware
        libhidlbase
        libhidltransport
        libhwbinder
        libutils
        libEGL
        libGLESv1_CM
        libGLESv2
        libbinder
        libui
        libgui
        libpowermanager
        libvulkan
        libsync
        libprotobuf-cpp-lite
        libbase

        libvkjson
        libvr_manager
        libvrflinger
        )


add_executable(surfaceflinger
        ${SURFACEFLINGER_ROOT}/main_surfaceflinger.cpp
        ${INTERMEDIATES_ROOT}/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto/android_arm64_armv8-a_cortex-a53_static_core/gen/proto/frameworks/native/cmds/surfacereplayer/proto/src/trace.pb.cc
        )
target_compile_definitions(surfaceflinger PRIVATE
        -DLOG_TAG=\"SurfaceFlinger\"
        )
target_link_libraries(surfaceflinger
        -Wl,--version-script,${ANDROID_ROOT}/art/sigchainlib/version-script64.txt
        -Wl,--export-dynamic
        )
target_link_libraries(surfaceflinger
        libsurfaceflinger
        libcutils
        libdisplayservicehidl
        liblog
        libbinder
        libhidlbase
        libhidltransport
        libutils
        libui
        libgui

        android.hardware.configstore-1.0
        android.hardware.configstore-utils
        android.hardware.graphics.allocator-2.0
        android.frameworks.displayservice-1.0
        )

#add_library(libsurfaceflinger_ddmconnection SHARED ${SURFACEFLINGER_ROOT}/DdmConnection.cpp)