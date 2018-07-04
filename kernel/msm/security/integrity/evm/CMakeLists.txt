set(LOCAL_PATH ${KERNEL_ROOT}/security/integrity/evm)

set(SOURCE_FILES "")

add_c_source(SOURCE_FILES ${LOCAL_PATH} evm_main) 
add_c_source(SOURCE_FILES ${LOCAL_PATH} evm_crypto) 
add_c_source(SOURCE_FILES ${LOCAL_PATH} evm_secfs)

if (${CONFIG_FS_POSIX_ACL})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} evm_posix_acl)
endif ()

add_library(security-integrity-evm STATIC ${SOURCE_FILES})