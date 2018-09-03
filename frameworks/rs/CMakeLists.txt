project(libRS)

set(RS_ROOT ${ANDROID_ROOT}/frameworks/rs)

set(SOURCE_FILES
        ${RS_ROOT}/driver/rsdAllocation.cpp
        ${RS_ROOT}/driver/rsdBcc.cpp
        ${RS_ROOT}/driver/rsdCore.cpp
        ${RS_ROOT}/driver/rsdElement.cpp
        ${RS_ROOT}/driver/rsdFrameBuffer.cpp
        ${RS_ROOT}/driver/rsdFrameBufferObj.cpp
        ${RS_ROOT}/driver/rsdGL.cpp
        ${RS_ROOT}/driver/rsdMesh.cpp
        ${RS_ROOT}/driver/rsdMeshObj.cpp
        ${RS_ROOT}/driver/rsdProgram.cpp
        ${RS_ROOT}/driver/rsdProgramRaster.cpp
        ${RS_ROOT}/driver/rsdProgramStore.cpp
        ${RS_ROOT}/driver/rsdRuntimeStubs.cpp
        ${RS_ROOT}/driver/rsdSampler.cpp
        ${RS_ROOT}/driver/rsdScriptGroup.cpp
        ${RS_ROOT}/driver/rsdShader.cpp
        ${RS_ROOT}/driver/rsdShaderCache.cpp
        ${RS_ROOT}/driver/rsdType.cpp
        ${RS_ROOT}/driver/rsdVertexArray.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native)

add_library(libRSDriver SHARED ${SOURCE_FILES})
target_link_libraries(libRSDriver
        libRS_internal
        libRSCpuRef
        liblog
        libEGL
        libGLESv1_CM
        libGLESv2
        libnativewindow
        libbcinfo
        )


set(SOURCE_FILES
        ${RS_ROOT}/rsApiAllocation.cpp
        ${RS_ROOT}/rsApiContext.cpp
        ${RS_ROOT}/rsApiDevice.cpp
        ${RS_ROOT}/rsApiElement.cpp
        ${RS_ROOT}/rsApiFileA3D.cpp
        ${RS_ROOT}/rsApiMesh.cpp
        ${RS_ROOT}/rsApiType.cpp
        ${RS_ROOT}/rsAllocation.cpp
        ${RS_ROOT}/rsAnimation.cpp
        ${RS_ROOT}/rsComponent.cpp
        ${RS_ROOT}/rsContext.cpp
        ${RS_ROOT}/rsClosure.cpp
        ${RS_ROOT}/rsCppUtils.cpp
        ${RS_ROOT}/rsDevice.cpp
        ${RS_ROOT}/rsDriverLoader.cpp
        ${RS_ROOT}/rsElement.cpp
        ${RS_ROOT}/rsFBOCache.cpp
        ${RS_ROOT}/rsFifoSocket.cpp
        ${RS_ROOT}/rsFileA3D.cpp
        ${RS_ROOT}/rsFont.cpp
        ${RS_ROOT}/rsGrallocConsumer.cpp
        ${RS_ROOT}/rsObjectBase.cpp
        ${RS_ROOT}/rsMatrix2x2.cpp
        ${RS_ROOT}/rsMatrix3x3.cpp
        ${RS_ROOT}/rsMatrix4x4.cpp
        ${RS_ROOT}/rsMesh.cpp
        ${RS_ROOT}/rsMutex.cpp
        ${RS_ROOT}/rsProgram.cpp
        ${RS_ROOT}/rsProgramFragment.cpp
        ${RS_ROOT}/rsProgramStore.cpp
        ${RS_ROOT}/rsProgramRaster.cpp
        ${RS_ROOT}/rsProgramVertex.cpp
        ${RS_ROOT}/rsSampler.cpp
        ${RS_ROOT}/rsScript.cpp
        ${RS_ROOT}/rsScriptC.cpp
        ${RS_ROOT}/rsScriptC_Lib.cpp
        ${RS_ROOT}/rsScriptC_LibGL.cpp
        ${RS_ROOT}/rsScriptGroup.cpp
        ${RS_ROOT}/rsScriptGroup2.cpp
        ${RS_ROOT}/rsScriptIntrinsic.cpp
        ${RS_ROOT}/rsSignal.cpp
        ${RS_ROOT}/rsStream.cpp
        ${RS_ROOT}/rsThreadIO.cpp
        ${RS_ROOT}/rsType.cpp

        ${INTERMEDIATES_ROOT}/frameworks/rs/rs_generated_sources/gen/frameworks/rs/rsgApi.cpp
        ${INTERMEDIATES_ROOT}/frameworks/rs/rs_generated_sources/gen/frameworks/rs/rsgApiReplay.cpp
        )

add_library(libRS_interanl SHARED ${SOURCE_FILES})
target_include_directories(libRS_interanl PUBLIC
        ${RS_ROOT}
        ${INTERMEDIATES_ROOT}/frameworks/rs/rs_generated_headers/gen/frameworks/rs
        )
target_compile_options(libRS_interanl PRIVATE
        -Werror
        -Wall
        -Wextra
        -Wno-unused-parameter
        -Wno-unused-variable
        )
target_link_libraries(libRS_interanl
        liblog
        libutils
        libEGL
        libGLESv1_CM
        libGLESv2
        libnativewindow
        libft2
        libbcinfo
        libmediandk
        )

set(SOURCE_FILES
        ${RS_ROOT}/rsApiStubs.cpp
        ${RS_ROOT}/rsHidlAdaptation.cpp
        ${RS_ROOT}/rsFallbackAdaptation.cpp
        )

add_library(libRS SHARED ${SOURCE_FILES})
target_compile_options(libRS PRIVATE
        -Werror
        -Wall
        -Wextra
        -Wno-unused-parameter
        -Wno-unused-variable
        )
target_link_libraries(libRS
        libhidlbase
        libhidltransport
        libhwbinder
        libutils
        liblog
        libcutils

        libRSDispatch
        libRS_internal
        android.hardware.renderscript-1.0
        )