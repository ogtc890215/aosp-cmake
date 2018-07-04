set(LOCAL_PATH ${KERNEL_ROOT}/kernel/events)

set(SOURCE_FILES "")

add_c_source(SOURCE_FILES ${LOCAL_PATH} core)
add_c_source(SOURCE_FILES ${LOCAL_PATH} ring_buffer)
add_c_source(SOURCE_FILES ${LOCAL_PATH} callchain)

if (${CONFIG_HAVE_HW_BREAKPOINT})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} hw_breakpoint)
endif ()
if (${CONFIG_UPROBES})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} uprobes)
endif ()

add_library(kernel-events STATIC ${SOURCE_FILES})