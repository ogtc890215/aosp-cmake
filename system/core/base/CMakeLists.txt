project(libbase)

set(BASE_ROOT ${ANDROID_ROOT}/system/core/base)

set(SOURCE_FILES
        ${BASE_ROOT}/file.cpp
        ${BASE_ROOT}/logging.cpp
        ${BASE_ROOT}/parsenetaddress.cpp
        ${BASE_ROOT}/quick_exit.cpp
        ${BASE_ROOT}/stringprintf.cpp
        ${BASE_ROOT}/strings.cpp
        ${BASE_ROOT}/test_utils.cpp
        ${BASE_ROOT}/errors_unix.cpp
        ${BASE_ROOT}/properties.cpp
        ${BASE_ROOT}/chrono_utils.cpp
        )

add_library(libbase SHARED ${SOURCE_FILES})
target_include_directories(libbase PUBLIC
        ${BASE_ROOT}/include
        )
target_compile_options(libbase PRIVATE
        -Wall
        -Wextra
        -Werror
        -Wexit-time-destructors
        -fsanitize=integer
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libbase
        liblog
        )