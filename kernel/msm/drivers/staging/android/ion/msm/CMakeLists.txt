set(LOCAL_PATH ${KERNEL_ROOT}/drivers/staging/android/ion/msm)

set(SOURCE_FILES "")

add_c_source(SOURCE_FILES ${LOCAL_PATH} msm_ion)
add_c_source(SOURCE_FILES ${LOCAL_PATH} secure_buffer)

if (${CONFIG_COMPAT})
    add_c_source(SOURCE_FILES ${LOCAL_PATH} compat_msm_ion)
endif ()

add_library(drivers-staging-android-ion-msm STATIC ${SOURCE_FILES})