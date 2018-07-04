set(LOCAL_PATH ${KERNEL_ROOT}/security/integrity/ima)

set(SOURCE_FILES "")

add_c_source(SOURCE_FILES ${LOCAL_PATH} ima_fs)
add_c_source(SOURCE_FILES ${LOCAL_PATH} ima_queue)
add_c_source(SOURCE_FILES ${LOCAL_PATH} ima_init)
add_c_source(SOURCE_FILES ${LOCAL_PATH} ima_main)
add_c_source(SOURCE_FILES ${LOCAL_PATH} ima_crypto)
add_c_source(SOURCE_FILES ${LOCAL_PATH} ima_api)
add_c_source(SOURCE_FILES ${LOCAL_PATH} ima_policy)

if (${CONFIG_IMA_AUDIT})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} ima_audit)
endif ()
if (${CONFIG_IMA_APPRAISE})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} ima_appraise)
endif ()

add_library(security-integrity-ima STATIC ${SOURCE_FILES})