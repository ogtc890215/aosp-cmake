project(libperformance)

set(PERFORMANCE_ROOT ${ANDROID_ROOT}/frameworks/native/libs/vr/libperformance)

set(SOURCE_FILES
        ${PERFORMANCE_ROOT}/performance_client.cpp
        ${PERFORMANCE_ROOT}/performance_rpc.cpp
        )


add_library(libperformance SHARED ${SOURCE_FILES})
target_include_directories(libperformance PUBLIC
        ${PERFORMANCE_ROOT}/include
        )
target_compile_definitions(libperformance PRIVATE
        -DLOG_TAG=\"libperformance\"
        -DTRACE=0
        )
target_link_libraries(libperformance
        libbase
        libcutils
        liblog
        libutils

        libbufferhubqueue
        )
