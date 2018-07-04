project(libhwbinder)

set(HWBINDER_ROOT ${ANDROID_ROOT}/system/libhwbinder)

set(SOURCE_FILES
        ${HWBINDER_ROOT}/Binder.cpp
        ${HWBINDER_ROOT}/BpHwBinder.cpp
        ${HWBINDER_ROOT}/BufferedTextOutput.cpp
        ${HWBINDER_ROOT}/Debug.cpp
        ${HWBINDER_ROOT}/IInterface.cpp
        ${HWBINDER_ROOT}/IPCThreadState.cpp
        ${HWBINDER_ROOT}/Parcel.cpp
        ${HWBINDER_ROOT}/ProcessState.cpp
        ${HWBINDER_ROOT}/Static.cpp
        ${HWBINDER_ROOT}/TextOutput.cpp
        )


include_directories(${ANDROID_ROOT}/frameworks/native/include)


add_library(libhwbinder SHARED ${SOURCE_FILES})
target_include_directories(libhwbinder PUBLIC
        ${HWBINDER_ROOT}/include
        )
target_compile_options(libhwbinder PRIVATE
        -Werror
        -fsanitize=integer
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libhwbinder
        libbase
        liblog
        libcutils
        libutils
        )
