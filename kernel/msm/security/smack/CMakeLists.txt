set(LOCAL_PATH ${KERNEL_ROOT}/security/smack)

set(SOURCE_FILES "")

add_c_source(SOURCE_FILES ${LOCAL_PATH} smack_lsm) 
add_c_source(SOURCE_FILES ${LOCAL_PATH} smack_access) 
add_c_source(SOURCE_FILES ${LOCAL_PATH} smackfs)

add_library(security-smack STATIC ${SOURCE_FILES})