project(mediadrmserver)

set(MEDIADRMSERVER_ROOT ${ANDROID_ROOT}/frameworks/av/services/mediadrm)

set(SOURCE_FILES
        ${MEDIADRMSERVER_ROOT}/MediaDrmService.cpp
        ${MEDIADRMSERVER_ROOT}/main_mediadrmserver.cpp
        )

include_directories(${MEDIADRMSERVER_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)

add_executable(mediadrmserver ${SOURCE_FILES})
target_compile_options(mediadrmserver PRIVATE
        -Wall
        -Wextra
        -Werror
        )
target_link_libraries(mediadrmserver
        libbinder
        liblog
        libmediadrm
        libutils
        libhidlbase
        libhidlmemory
        libhidltransport
        android.hardware.drm-1.0
        )