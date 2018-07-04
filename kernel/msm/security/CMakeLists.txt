set(LOCAL_PATH ${KERNEL_ROOT}/security)

set(SOURCE_FILES "")

add_c_source(SOURCE_FILES ${LOCAL_PATH} commoncap)
if (${CONFIG_MMU})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} min_addr)
endif ()
if (${CONFIG_SECURITY})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} security)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} capability)
endif ()
if (${CONFIG_SECURITYFS})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} inode)
endif ()
if (${CONFIG_AUDIT})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} lsm_audit)
endif ()
if (${CONFIG_CGROUP_DEVICE})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} device_cgroup)
endif ()

add_library(security STATIC ${SOURCE_FILES})

if (${CONFIG_KEYS})
    add_subdirectory(keys)
endif ()
if (${CONFIG_SECURITY_SELINUX})
    add_subdirectory(selinux)
    target_link_libraries(security
            security-selinux
            )
endif ()
if (${CONFIG_SECURITY_SMACK})
    add_subdirectory(smack)
    target_link_libraries(security
            security-smack
            )
endif ()
if (${CONFIG_SECURITY_TOMOYO})
    add_subdirectory(tomoyo)
    target_link_libraries(security
            security-tomoyo
            )
endif ()
if (${CONFIG_SECURITY_APPARMOR})
    add_subdirectory(apparmor)
    target_link_libraries(security
            security-apparmor
            )
endif ()
if (${CONFIG_SECURITY_YAMA})
    add_subdirectory(yama)
    target_link_libraries(security
            security-yama
            )
endif ()
if (${CONFIG_INTEGRITY})
    add_subdirectory(integrity)
    target_link_libraries(security
            security-integrity
            )
endif ()