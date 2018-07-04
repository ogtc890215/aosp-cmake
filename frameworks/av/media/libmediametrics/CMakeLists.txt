project(libmediametrics)

set(MEDIAMETRICS_ROOT ${ANDROID_ROOT}/frameworks/av/media/libmediametrics)

set(SOURCE_FILES
        ${MEDIAMETRICS_ROOT}/IMediaAnalyticsService.cpp
        ${MEDIAMETRICS_ROOT}/MediaAnalyticsItem.cpp
        )

include_directories(${ANDROID_ROOT}/frameworks/av/include)


add_library(libmediametrics SHARED ${SOURCE_FILES})
target_include_directories(libmediametrics PUBLIC
        ${MEDIAMETRICS_ROOT}/include
        )
target_compile_options(libmediametrics PRIVATE
        -Werror
        -Wno-error=deprecated-declarations
        -Wall
        -fsanitize=unsigned-integer-overflow,signed-integer-overflow
        -fsanitize-trap=all
        -ftrap-function=abort
        )
target_link_libraries(libmediametrics
        liblog
        libcutils
        libutils
        libbinder
        libstagefright_foundation
        libbase
        )