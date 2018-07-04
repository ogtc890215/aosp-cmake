project(libaudiopolicypfwwrapper)

set(AUDIOPOLICYPFWWRAPPER_ROOT ${ANDROID_ROOT}/frameworks/av/services/audiopolicy/engineconfigurable/wrapper)

include_directories(${AUDIOPOLICYPFWWRAPPER_ROOT})
include_directories(${ANDROID_ROOT}/frameworks/av/include)
include_directories(${ANDROID_ROOT}/frameworks/av/services/audiopolicy/engineconfigurable/include)
include_directories(${ANDROID_ROOT}/frameworks/av/services/audiopolicy/engineconfigurable/interface)
include_directories(${ANDROID_ROOT}/frameworks/av/services/audiopolicy/utilities/convert)

add_library(libaudiopolicypfwwrapper STATIC ${AUDIOPOLICYPFWWRAPPER_ROOT}/ParameterManagerWrapper.cpp)
target_include_directories(libaudiopolicypfwwrapper PUBLIC
        ${AUDIOPOLICYPFWWRAPPER_ROOT}/include
        )
target_compile_options(libaudiopolicypfwwrapper PRIVATE
        -Wall
        -Werror
        -Wextra
        )
target_link_libraries(libaudiopolicypfwwrapper
        libparameter
        libmedia_helper
        )
