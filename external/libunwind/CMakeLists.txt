project(libunwind)

set(UNWIND_ROOT ${ANDROID_ROOT}/external/libunwind)

set(SOURCE_FILES
        ${UNWIND_ROOT}/src/mi/init.c
        ${UNWIND_ROOT}/src/mi/flush_cache.c
        ${UNWIND_ROOT}/src/mi/mempool.c
        ${UNWIND_ROOT}/src/mi/strerror.c
        ${UNWIND_ROOT}/src/mi/backtrace.c
        ${UNWIND_ROOT}/src/mi/dyn-cancel.c
        ${UNWIND_ROOT}/src/mi/dyn-info-list.c
        ${UNWIND_ROOT}/src/mi/dyn-register.c
        ${UNWIND_ROOT}/src/mi/map.c
        ${UNWIND_ROOT}/src/mi/Lmap.c
        ${UNWIND_ROOT}/src/mi/Ldyn-extract.c
        ${UNWIND_ROOT}/src/mi/Lfind_dynamic_proc_info.c
        ${UNWIND_ROOT}/src/mi/Lget_proc_info_by_ip.c
        ${UNWIND_ROOT}/src/mi/Lget_proc_name.c
        ${UNWIND_ROOT}/src/mi/Lput_dynamic_unwind_info.c
        ${UNWIND_ROOT}/src/mi/Ldestroy_addr_space.c
        ${UNWIND_ROOT}/src/mi/Lget_reg.c
        ${UNWIND_ROOT}/src/mi/Lset_reg.c
        ${UNWIND_ROOT}/src/mi/Lget_fpreg.c
        ${UNWIND_ROOT}/src/mi/Lset_fpreg.c
        ${UNWIND_ROOT}/src/mi/Lset_caching_policy.c
        ${UNWIND_ROOT}/src/mi/Gdyn-extract.c
        ${UNWIND_ROOT}/src/mi/Gdyn-remote.c
        ${UNWIND_ROOT}/src/mi/Gfind_dynamic_proc_info.c
        ${UNWIND_ROOT}/src/mi/Gget_accessors.c
        ${UNWIND_ROOT}/src/mi/Gget_proc_info_by_ip.c
        ${UNWIND_ROOT}/src/mi/Gget_proc_name.c
        ${UNWIND_ROOT}/src/mi/Gput_dynamic_unwind_info.c
        ${UNWIND_ROOT}/src/mi/Gdestroy_addr_space.c
        ${UNWIND_ROOT}/src/mi/Gget_reg.c
        ${UNWIND_ROOT}/src/mi/Gset_reg.c
        ${UNWIND_ROOT}/src/mi/Gget_fpreg.c
        ${UNWIND_ROOT}/src/mi/Gset_fpreg.c
        ${UNWIND_ROOT}/src/mi/Gset_caching_policy.c
        ${UNWIND_ROOT}/src/dwarf/Lexpr.c
        ${UNWIND_ROOT}/src/dwarf/Lfde.c
        ${UNWIND_ROOT}/src/dwarf/Lparser.c
        ${UNWIND_ROOT}/src/dwarf/Lpe.c
        ${UNWIND_ROOT}/src/dwarf/Lstep_dwarf.c
        ${UNWIND_ROOT}/src/dwarf/Lfind_proc_info-lsb.c
        ${UNWIND_ROOT}/src/dwarf/Lfind_unwind_table.c
        ${UNWIND_ROOT}/src/dwarf/Gexpr.c
        ${UNWIND_ROOT}/src/dwarf/Gfde.c
        ${UNWIND_ROOT}/src/dwarf/Gfind_proc_info-lsb.c
        ${UNWIND_ROOT}/src/dwarf/Gfind_unwind_table.c
        ${UNWIND_ROOT}/src/dwarf/Gparser.c
        ${UNWIND_ROOT}/src/dwarf/Gpe.c
        ${UNWIND_ROOT}/src/dwarf/Gstep_dwarf.c
        ${UNWIND_ROOT}/src/dwarf/global.c
        ${UNWIND_ROOT}/src/os-common.c
        ${UNWIND_ROOT}/src/os-linux.c
        ${UNWIND_ROOT}/src/Los-common.c

        ${UNWIND_ROOT}/src/ptrace/_UPT_accessors.c
        ${UNWIND_ROOT}/src/ptrace/_UPT_access_fpreg.c
        ${UNWIND_ROOT}/src/ptrace/_UPT_access_mem.c
        ${UNWIND_ROOT}/src/ptrace/_UPT_access_reg.c
        ${UNWIND_ROOT}/src/ptrace/_UPT_create.c
        ${UNWIND_ROOT}/src/ptrace/_UPT_destroy.c
        ${UNWIND_ROOT}/src/ptrace/_UPT_find_proc_info.c
        ${UNWIND_ROOT}/src/ptrace/_UPT_get_dyn_info_list_addr.c
        ${UNWIND_ROOT}/src/ptrace/_UPT_put_unwind_info.c
        ${UNWIND_ROOT}/src/ptrace/_UPT_get_proc_name.c
        ${UNWIND_ROOT}/src/ptrace/_UPT_reg_offset.c
        ${UNWIND_ROOT}/src/ptrace/_UPT_resume.c

        ${UNWIND_ROOT}/src/aarch64/is_fpreg.c
        ${UNWIND_ROOT}/src/aarch64/regname.c
        ${UNWIND_ROOT}/src/aarch64/Gcreate_addr_space.c
        ${UNWIND_ROOT}/src/aarch64/Gget_proc_info.c
        ${UNWIND_ROOT}/src/aarch64/Gget_save_loc.c
        ${UNWIND_ROOT}/src/aarch64/Gglobal.c
        ${UNWIND_ROOT}/src/aarch64/Ginit.c
        ${UNWIND_ROOT}/src/aarch64/Ginit_local.c
        ${UNWIND_ROOT}/src/aarch64/Ginit_remote.c
        ${UNWIND_ROOT}/src/aarch64/Gregs.c
        ${UNWIND_ROOT}/src/aarch64/Gresume.c
        ${UNWIND_ROOT}/src/aarch64/Gstep.c
        ${UNWIND_ROOT}/src/aarch64/Lcreate_addr_space.c
        ${UNWIND_ROOT}/src/aarch64/Lget_proc_info.c
        ${UNWIND_ROOT}/src/aarch64/Lget_save_loc.c
        ${UNWIND_ROOT}/src/aarch64/Lglobal.c
        ${UNWIND_ROOT}/src/aarch64/Linit.c
        ${UNWIND_ROOT}/src/aarch64/Linit_local.c
        ${UNWIND_ROOT}/src/aarch64/Linit_remote.c
        ${UNWIND_ROOT}/src/aarch64/Lregs.c
        ${UNWIND_ROOT}/src/aarch64/Lresume.c
        ${UNWIND_ROOT}/src/aarch64/Lstep.c

        ${UNWIND_ROOT}/src/aarch64/Gis_signal_frame.c
        ${UNWIND_ROOT}/src/aarch64/Lis_signal_frame.c


        ${UNWIND_ROOT}/src/elf64.c
        )

include_directories(${UNWIND_ROOT}/src)
include_directories(BEFORE ${UNWIND_ROOT}/include/tdep-aarch64)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-old-style-cast")

add_library(libunwind SHARED ${SOURCE_FILES})
target_include_directories(libunwind BEFORE PUBLIC
        ${UNWIND_ROOT}/include
        )
target_compile_definitions(libunwind PRIVATE
        -DHAVE_CONFIG_H
        -D_GNU_SOURCE
        -DNDEBUG
        -DDEBUG
        )
target_compile_options(libunwind PRIVATE
        -Werror
        "-Wno-#pragma-messages"
        -Wno-unused-parameter
        -Wno-header-guard
        -Wno-absolute-value
        -Wno-inline-asm
        -U_FORTIFY_SOURCE
        )
target_link_libraries(libunwind
        liblog
        liblzma
        )