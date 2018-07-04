set(LOCAL_PATH ${KERNEL_ROOT}/kernel/cpu)

set(SOURCE_FILES "")

add_c_source(SOURCE_FILES ${LOCAL_PATH} idle)

add_library(kernel-cpu STATIC ${SOURCE_FILES})