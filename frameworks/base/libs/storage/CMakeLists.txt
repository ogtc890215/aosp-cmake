project(libstorage)

set(STORAGE_ROOT ${ANDROID_ROOT}/frameworks/base/libs/storage)

set(SOURCE_FILES
        ${STORAGE_ROOT}/IMountServiceListener.cpp
        ${STORAGE_ROOT}/IMountShutdownObserver.cpp
        ${STORAGE_ROOT}/IObbActionListener.cpp
        ${STORAGE_ROOT}/IMountService.cpp
        )


add_library(libstorage STATIC ${SOURCE_FILES})
target_include_directories(libstorage PUBLIC
        ${STORAGE_ROOT}/include
        )
target_compile_options(libstorage PRIVATE
        -Werror
        -Wall
        )
target_link_libraries(libstorage
        libbinder
        )