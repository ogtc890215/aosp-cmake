set(LOCAL_PATH ${KERNEL_ROOT}/security/integrity)

set(SOURCE_FILES "")

if (${CONFIG_INTEGRITY})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} iint)
endif ()
if (${CONFIG_INTEGRITY_SIGNATURE})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} digsig)
endif ()
if (${CONFIG_INTEGRITY_ASYMMETRIC_KEYS})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} digsig_asymmetric)
endif ()

add_library(security-integrity STATIC ${SOURCE_FILES})

if (${CONFIG_IMA})
    add_subdirectory(ima)
    target_link_libraries(security-integrity
            security-integrity-ima
            )
endif ()
if (CONFIG_EVM)
    add_subdirectory(evm)
    target_link_libraries(security-integrity
            security-integrity-evm
            )
endif ()