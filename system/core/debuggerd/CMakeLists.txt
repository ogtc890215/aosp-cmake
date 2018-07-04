project(debuggerd)

set(DEBUGGERD_ROOT ${ANDROID_ROOT}/system/core/debuggerd)

set(SOURCE_FILES
        ${DEBUGGERD_ROOT}/client/debuggerd_client.cpp
        ${DEBUGGERD_ROOT}/util.cpp
        )

include_directories(${DEBUGGERD_ROOT})

add_library(libdebuggerd_client SHARED ${SOURCE_FILES})
target_include_directories(libdebuggerd_client PUBLIC
        ${DEBUGGERD_ROOT}/include
        ${DEBUGGERD_ROOT}/common/include
        )
target_compile_options(libdebuggerd_client PRIVATE
        -Wall
        -Wextra
        -Werror
        -Wno-nullability-completeness
        -Os
        )
target_link_libraries(libdebuggerd_client
        libbase
        libcutils
        )