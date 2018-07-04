project(libgraphicsenv)

set(GRAPHICSENV_ROOT ${ANDROID_ROOT}/frameworks/native/libs/graphicsenv)


add_library(libgraphicsenv SHARED ${GRAPHICSENV_ROOT}/GraphicsEnv.cpp)
target_include_directories(libgraphicsenv PUBLIC
        ${GRAPHICSENV_ROOT}/include
        )
target_link_libraries(libgraphicsenv
        libnativeloader
        liblog
        )