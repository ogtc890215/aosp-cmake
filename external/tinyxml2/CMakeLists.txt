project(libtinyxml2)

set(TINYXML2_ROOT ${ANDROID_ROOT}/external/tinyxml2)


add_library(libtinyxml2 SHARED ${TINYXML2_ROOT}/tinyxml2.cpp)
target_include_directories(libtinyxml2 PUBLIC
        ${TINYXML2_ROOT}
        )
target_compile_definitions(libtinyxml2 PRIVATE
        -DDEBUG
        -DANDROID_NDK
        )
target_link_libraries(libtinyxml2
        liblog
        )