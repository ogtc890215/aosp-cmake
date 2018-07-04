project(libsfntly)

set(SFNTLY_ROOT ${ANDROID_ROOT}/external/sfntly)

set(SOURCE_FILES
        ${SFNTLY_ROOT}/cpp/src/sfntly/data/byte_array.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/data/font_data.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/data/font_input_stream.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/data/font_output_stream.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/data/growable_memory_byte_array.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/data/memory_byte_array.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/data/readable_font_data.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/data/writable_font_data.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/font.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/font_factory.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/port/file_input_stream.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/port/lock.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/port/memory_input_stream.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/port/memory_output_stream.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/big_glyph_metrics.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/bitmap_glyph.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/bitmap_glyph_info.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/bitmap_size_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/composite_bitmap_glyph.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/ebdt_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/eblc_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/ebsc_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/glyph_metrics.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/index_sub_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/index_sub_table_format1.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/index_sub_table_format2.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/index_sub_table_format3.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/index_sub_table_format4.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/index_sub_table_format5.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/simple_bitmap_glyph.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/bitmap/small_glyph_metrics.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/byte_array_table_builder.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/core/cmap_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/core/font_header_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/core/horizontal_device_metrics_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/core/horizontal_header_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/core/horizontal_metrics_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/core/maximum_profile_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/core/name_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/core/os2_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/font_data_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/generic_table_builder.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/header.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/subtable.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/table_based_table_builder.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/truetype/glyph_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/table/truetype/loca_table.cc
        ${SFNTLY_ROOT}/cpp/src/sfntly/tag.cc
        ${SFNTLY_ROOT}/cpp/src/sample/chromium/font_subsetter.cc
        ${SFNTLY_ROOT}/cpp/src/sample/chromium/subsetter_impl.cc
        )

#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstack-protector")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --param=ssp-buffer-size=4")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-strict-aliasing")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-parameter")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-missing-field-initializers")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-tree-sra")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-psabi")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ffunction-sections")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -funwind-tables")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstack-protector")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-short-enums")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -finline-limit=64")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wa,--noexecstack")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -U_FORTIFY_SOURCE")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-extra")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-ignored-qualifiers")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-type-limits")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Os")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-ident")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdata-sections")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ffunction-sections")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fomit-frame-pointer")


#add_definitions(-DANGLE_DX11)
#add_definitions(-D_FILE_OFFSET_BITS=64)
#add_definitions(-DNO_TCMALLOC)
#add_definitions(-DDISCARDABLE_MEMORY_ALWAYS_SUPPORTED_NATIVELY)
#add_definitions(-DSYSTEM_NATIVELY_SIGNALS_MEMORY_PRESSURE)
#add_definitions(-DDISABLE_NACL)
#add_definitions(-DCHROMIUM_BUILD)
#add_definitions(-DUSE_LIBJPEG_TURBO=1)
#add_definitions(-DUSE_PROPRIETARY_CODECS)
#add_definitions(-DENABLE_CONFIGURATION_POLICY)
#add_definitions(-DENABLE_GPU=1)
#add_definitions(-DUSE_OPENSSL=1)
#add_definitions(-DENABLE_EGLIMAGE=1)
#add_definitions(-DU_USING_ICU_NAMESPACE=0)
#add_definitions(-D__STDC_CONSTANT_MACROS)
#add_definitions(-D__STDC_FORMAT_MACROS)
#add_definitions(-DANDROID)
#add_definitions(-D__GNU_SOURCE=1)
#add_definitions(-D_STLP_USE_PTR_SPECIALIZATIONS=1)
#add_definitions(-DCHROME_BUILD_ID='\"\"')
#add_definitions(-DNDEBUG)
#add_definitions(-DNVALGRIND)
#add_definitions(-DDYNAMIC_ANNOTATIONS_ENABLED=0)
#add_definitions(-D_FORTIFY_SOURCE=2)
#add_definitions(-UNDEBUG)
#add_definitions(-UNVALGRIND)


add_library(libsfntly STATIC ${SOURCE_FILES})
target_include_directories(libsfntly PUBLIC
        ${SFNTLY_ROOT}/cpp/src
        )
target_compile_definitions(libsfntly PRIVATE
        -DSFNTLY_NO_EXCEPTION
        -DDYNAMIC_ANNOTATIONS_ENABLED=1
        -DWTF_USE_DYNAMIC_ANNOTATIONS=1
        -D_DEBUG
        )
target_compile_options(libsfntly PRIVATE
        -fno-threadsafe-statics
        -fvisibility-inlines-hidden
        -Wsign-compare
        -Wno-abi
        -Wno-error=c++0x-compat
        -Wno-non-virtual-dtor
        -Wno-sign-promo
        -Wno-error=user-defined-warnings
        )
target_link_libraries(libsfntly
        libicuuc
        libicui18n
        )