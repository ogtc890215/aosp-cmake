project(libpdx)

set(PDX_ROOT ${ANDROID_ROOT}/frameworks/native/libs/vr/libpdx)

set(SOURCE_FILES
        ${PDX_ROOT}/client.cpp
        ${PDX_ROOT}/service.cpp
        ${PDX_ROOT}/service_dispatcher.cpp
        ${PDX_ROOT}/status.cpp
        )

add_library(libpdx STATIC ${SOURCE_FILES})
target_include_directories(libpdx PUBLIC
        ${PDX_ROOT}/private
        )
target_compile_definitions(libpdx PRIVATE
        -DLOG_TAG=\"libpdx\"
        -DTRACE=0
        )
target_compile_options(libpdx PRIVATE
        -Wall
        -Wextra
        -Werror
        )
