set(LOCAL_PATH ${KERNEL_ROOT}/security/keys/encrypted-keys)

set(SOURCE_FILES "")

if (${CONFIG_ENCRYPTED_KEYS})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} encrypted)
    add_c_source(SOURCE_FILES ${LOCAL_PATH} ecryptfs_format)
endif ()
if (${CONFIG_TRUSTED_KEYS})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} masterkey_trusted)
else ()
    if ("${CONFIG_TRUSTED_KEYS}" EQUAL "m")
        if ("${CONFIG_ENCRYPTED_KEYS}" EQUAL "m")
            add_c_source(SOURCE_FILES ${LOCAL_PATH} masterkey_trusted)
        endif ()
    endif ()
endif ()

add_library(security-keys-encrypted-keys STATIC ${SOURCE_FILES})