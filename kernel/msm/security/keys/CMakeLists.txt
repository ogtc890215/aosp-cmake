set(LOCAL_PATH ${KERNEL_ROOT}/security/keys)

set(SOURCE_FILES "")

add_c_source(SOURCE_FILES ${LOCAL_PATH} gc)
add_c_source(SOURCE_FILES ${LOCAL_PATH} key)
add_c_source(SOURCE_FILES ${LOCAL_PATH} keyring)
add_c_source(SOURCE_FILES ${LOCAL_PATH} keyctl)
add_c_source(SOURCE_FILES ${LOCAL_PATH} permission)
add_c_source(SOURCE_FILES ${LOCAL_PATH} process_keys)
add_c_source(SOURCE_FILES ${LOCAL_PATH} request_key)
add_c_source(SOURCE_FILES ${LOCAL_PATH} request_key_auth)
add_c_source(SOURCE_FILES ${LOCAL_PATH} user_defined)
if (${CONFIG_KEYS_COMPAT})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} compat)
endif ()
if (${CONFIG_PROC_FS})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} proc)
endif ()
if (${CONFIG_SYSCTL})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} sysctl)
endif ()
if (${CONFIG_TRUSTED_KEYS})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} trusted)
endif ()

add_library(security-keys STATIC ${SOURCE_FILES})

if (${CONFIG_ENCRYPTED_KEYS})
    add_subdirectory(encrypted-keys)
    target_link_libraries(security-keys
            security-keys-encrypted-keys
            )
endif ()
