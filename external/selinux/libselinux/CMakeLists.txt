project(libselinux)

set(SELINUX_ROOT ${ANDROID_ROOT}/external/selinux/libselinux)

set(SOURCE_FILES
        ${SELINUX_ROOT}/src/booleans.c
        ${SELINUX_ROOT}/src/callbacks.c
        ${SELINUX_ROOT}/src/freecon.c
        ${SELINUX_ROOT}/src/label_backends_android.c
        ${SELINUX_ROOT}/src/label.c
        ${SELINUX_ROOT}/src/label_support.c
        ${SELINUX_ROOT}/src/matchpathcon.c
        ${SELINUX_ROOT}/src/setrans_client.c
        ${SELINUX_ROOT}/src/sha1.c

        ${SELINUX_ROOT}/src/android/android.c
        ${SELINUX_ROOT}/src/avc.c
        ${SELINUX_ROOT}/src/avc_internal.c
        ${SELINUX_ROOT}/src/avc_sidtab.c
        ${SELINUX_ROOT}/src/canonicalize_context.c
        ${SELINUX_ROOT}/src/checkAccess.c
        ${SELINUX_ROOT}/src/check_context.c
        ${SELINUX_ROOT}/src/compute_av.c
        ${SELINUX_ROOT}/src/compute_create.c
        ${SELINUX_ROOT}/src/compute_member.c
        ${SELINUX_ROOT}/src/context.c
        ${SELINUX_ROOT}/src/deny_unknown.c
        ${SELINUX_ROOT}/src/disable.c
        ${SELINUX_ROOT}/src/enabled.c
        ${SELINUX_ROOT}/src/fgetfilecon.c
        ${SELINUX_ROOT}/src/fsetfilecon.c
        ${SELINUX_ROOT}/src/getenforce.c
        ${SELINUX_ROOT}/src/getfilecon.c
        ${SELINUX_ROOT}/src/get_initial_context.c
        ${SELINUX_ROOT}/src/getpeercon.c
        ${SELINUX_ROOT}/src/init.c
        ${SELINUX_ROOT}/src/lgetfilecon.c
        ${SELINUX_ROOT}/src/load_policy.c
        ${SELINUX_ROOT}/src/lsetfilecon.c
        ${SELINUX_ROOT}/src/mapping.c
        ${SELINUX_ROOT}/src/policyvers.c
        ${SELINUX_ROOT}/src/procattr.c
        ${SELINUX_ROOT}/src/sestatus.c
        ${SELINUX_ROOT}/src/setenforce.c
        ${SELINUX_ROOT}/src/setfilecon.c
        ${SELINUX_ROOT}/src/stringrep.c

        ${SELINUX_ROOT}/src/label_file.c
        ${SELINUX_ROOT}/src/regex.c
        ${SELINUX_ROOT}/src/android/android_platform.c
        )

include_directories(${SELINUX_ROOT}/src)


add_library(libselinux SHARED ${SOURCE_FILES})
target_include_directories(libselinux PUBLIC
        ${SELINUX_ROOT}/include
        )
target_compile_definitions(libselinux PRIVATE
        -DNO_PERSISTENTLY_STORED_PATTERNS
        -DDISABLE_SETRANS
        -DDISABLE_BOOL
        -D_GNU_SOURCE
        -DNO_MEDIA_BACKEND
        -DNO_X_BACKEND
        -DNO_DB_BACKEND
        -DAUDITD_LOG_TAG=1003
        -DUSE_PCRE2
        )
target_compile_options(libselinux PRIVATE
        -Wno-pointer-bool-conversion
        )
target_link_libraries(libselinux
        libcrypto
        liblog
        libpackagelistparser
        libpcre2
        )