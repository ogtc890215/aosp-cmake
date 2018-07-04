project(libfmq)

set(FMQ_ROOT ${ANDROID_ROOT}/system/libfmq)

set(SOURCE_FILES
        ${FMQ_ROOT}/EventFlag.cpp
        ${FMQ_ROOT}/FmqInternal.cpp
        )


add_library(libfmq SHARED ${SOURCE_FILES})
target_include_directories(libfmq PUBLIC
        ${FMQ_ROOT}/include
        )
target_compile_options(libfmq PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libfmq
        libbase
        liblog
        libcutils
        libutils
        )