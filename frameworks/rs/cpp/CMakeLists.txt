project(libRScpp)

set(RSCPP_ROOT ${ANDROID_ROOT}/frameworks/rs/cpp)

include_directories(${ANDROID_ROOT}/frameworks/rs)
include_directories(${ANDROID_ROOT}/libnativehelper/include_jni)

add_library(libRSDispatch STATIC ${RSCPP_ROOT}/rsDispatch.cpp)
target_compile_definitions(libRSDispatch PRIVATE
        -DRS_COMPATIBILITY_LIB
        )
target_compile_options(libRSDispatch PRIVATE
        -Wno-unused-parameter
        -std=c++11
        )
target_link_libraries(libRSDispatch
        liblog
        )

set(SOURCE_FILES
        ${RSCPP_ROOT}/RenderScript.cpp
        ${RSCPP_ROOT}/BaseObj.cpp
        ${RSCPP_ROOT}/Element.cpp
        ${RSCPP_ROOT}/Type.cpp
        ${RSCPP_ROOT}/Allocation.cpp
        ${RSCPP_ROOT}/Script.cpp
        ${RSCPP_ROOT}/ScriptC.cpp
        ${RSCPP_ROOT}/ScriptIntrinsics.cpp
        ${RSCPP_ROOT}/ScriptIntrinsicBLAS.cpp
        ${RSCPP_ROOT}/Sampler.cpp

        ${ANDROID_ROOT}/frameworks/rs/rsCppUtils.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libRScpp SHARED ${SOURCE_FILES})
target_include_directories(libRScpp PUBLIC
        ${RSCPP_ROOT}
        ${ANDROID_ROOT}/frameworks/rs
        )
target_compile_definitions(libRScpp PRIVATE
        -DRS_VERSION=24
        )
target_compile_options(libRScpp PRIVATE
        -Werror
        -Wall
        -Wextra
        -Wno-unused-parameter
        -Wno-unused-variable
        )
target_link_libraries(libRScpp
        liblog
        libz
        libgui
        libutils

        libRSDispatch
        )