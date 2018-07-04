project(libhidlbase)

set(HIDLBASE_ROOT ${ANDROID_ROOT}/system/libhidl/base)

set(SOURCE_FILES
        ${HIDLBASE_ROOT}/HidlInternal.cpp
        ${HIDLBASE_ROOT}/HidlSupport.cpp
        ${HIDLBASE_ROOT}/Status.cpp
        ${HIDLBASE_ROOT}/TaskRunner.cpp
        )


add_library(libhidlbase SHARED ${SOURCE_FILES})
target_include_directories(libhidlbase PUBLIC
        ${HIDLBASE_ROOT}/include
        )
target_compile_definitions(libhidlbase PRIVATE
        -DLIBHIDL_TARGET_DEBUGGABLE
        )
target_compile_options(libhidlbase PRIVATE
        -Wall
        -Werror
        -fsanitize=integer
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libhidlbase
        libbase
        libcutils
        liblog
        libutils)
