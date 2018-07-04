project(libseccomp_policy)

set(SECCOMP_ROOT ${ANDROID_ROOT}/bionic/libc/seccomp)

set(SOURCE_FILES
        ${SECCOMP_ROOT}/seccomp_policy.cpp
        ${SECCOMP_ROOT}/arm_policy.cpp
        ${SECCOMP_ROOT}/arm64_policy.cpp
        ${SECCOMP_ROOT}/x86_policy.cpp
        ${SECCOMP_ROOT}/x86_64_policy.cpp
        ${SECCOMP_ROOT}/mips_policy.cpp
        ${SECCOMP_ROOT}/mips64_policy.cpp
        )


add_library(libseccomp_policy SHARED ${SOURCE_FILES})
target_include_directories(libseccomp_policy PUBLIC
        ${SECCOMP_ROOT}/include
        )
target_link_libraries(libseccomp_policy
        libbase
        )