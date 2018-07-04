project(libavservices_minijail)

set(AVSERVICES_MINIJAIL_ROOT ${ANDROID_ROOT}/frameworks/av/services/minijail)

add_library(libavservices_minijail SHARED ${AVSERVICES_MINIJAIL_ROOT}/minijail.cpp)
target_include_directories(libavservices_minijail PUBLIC
        ${AVSERVICES_MINIJAIL_ROOT}
        )
target_link_libraries(libavservices_minijail
        libbase
        libminijail
        )
