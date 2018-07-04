project(libgui)

set(GUI_ROOT ${ANDROID_ROOT}/frameworks/native/libs/gui)

set(SOURCE_FILES
        ${GUI_ROOT}/BitTube.cpp
        ${GUI_ROOT}/BufferItem.cpp
        ${GUI_ROOT}/BufferItemConsumer.cpp
        ${GUI_ROOT}/BufferQueue.cpp
        ${GUI_ROOT}/BufferQueueConsumer.cpp
        ${GUI_ROOT}/BufferQueueCore.cpp
        ${GUI_ROOT}/BufferQueueProducer.cpp
        ${GUI_ROOT}/BufferSlot.cpp
        ${GUI_ROOT}/ConsumerBase.cpp
        ${GUI_ROOT}/CpuConsumer.cpp
        ${GUI_ROOT}/DisplayEventReceiver.cpp
        ${GUI_ROOT}/FrameTimestamps.cpp
        ${GUI_ROOT}/GLConsumer.cpp
        ${GUI_ROOT}/GuiConfig.cpp
        ${GUI_ROOT}/IDisplayEventConnection.cpp
        ${GUI_ROOT}/IConsumerListener.cpp
        ${GUI_ROOT}/IGraphicBufferConsumer.cpp
        ${GUI_ROOT}/IGraphicBufferProducer.cpp
        ${GUI_ROOT}/IProducerListener.cpp
        ${GUI_ROOT}/ISurfaceComposer.cpp
        ${GUI_ROOT}/ISurfaceComposerClient.cpp
        ${GUI_ROOT}/LayerState.cpp
        ${GUI_ROOT}/OccupancyTracker.cpp
        ${GUI_ROOT}/StreamSplitter.cpp
        ${GUI_ROOT}/Surface.cpp
        ${GUI_ROOT}/SurfaceControl.cpp
        ${GUI_ROOT}/SurfaceComposerClient.cpp
        ${GUI_ROOT}/SyncFeatures.cpp
        ${GUI_ROOT}/view/Surface.cpp
        ${GUI_ROOT}/bufferqueue/1.0/B2HProducerListener.cpp
        ${GUI_ROOT}/bufferqueue/1.0/H2BGraphicBufferProducer.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libgui SHARED ${SOURCE_FILES})
target_include_directories(libgui PUBLIC
        ${GUI_ROOT}/include

        ${ANDROID_ROOT}/hardware/libhardware/include
        ${ANDROID_ROOT}/frameworks/native/libs/ui/include
        ${ANDROID_ROOT}/frameworks/native/libs/math/include
        ${ANDROID_ROOT}/frameworks/native/libs/nativebase/include
        ${ANDROID_ROOT}/frameworks/native/libs/nativewindow/include
        ${ANDROID_ROOT}/frameworks/native/libs/arect/include
        ${ANDROID_ROOT}/frameworks/native/libs/binder/include
        ${ANDROID_ROOT}/frameworks/native/opengl/include
        ${INTERMEDIATES_ROOT}/system/libhidl/transport/token/1.0/android.hidl.token@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers/gen
        ${INTERMEDIATES_ROOT}/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers/gen
        )
target_compile_definitions(libgui PRIVATE
        -DDEBUG_ONLY_CODE=0
        )
target_compile_options(libgui PRIVATE
        -Weverything
        -Werror
        -Wno-exit-time-destructors
        -Wno-global-constructors
        -Wno-c++98-compat-pedantic
        -Wno-switch-enum
        -Wno-gnu-zero-variadic-macro-arguments
        -Wno-padded
        -Wno-float-equal
        -Wno-weak-vtables
        -Wno-four-char-constants
        -Wno-documentation
        )
target_link_libraries(libgui
        libsync
        libbinder
        libcutils
        libEGL
        libGLESv2
        libui
        libutils
        libnativewindow
        liblog
        libhidlbase
        libhidltransport

        android.hardware.configstore-1.0
        android.hardware.configstore-utils
        android.hardware.graphics.bufferqueue-1.0
        android.hidl.token-1.0-utils
        )