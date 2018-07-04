project(libxml2)

set(XML2_ROOT ${ANDROID_ROOT}/external/libxml2)

set(SOURCE_FILES
        ${XML2_ROOT}/SAX.c
        ${XML2_ROOT}/entities.c
        ${XML2_ROOT}/encoding.c
        ${XML2_ROOT}/error.c
        ${XML2_ROOT}/parserInternals.c
        ${XML2_ROOT}/parser.c
        ${XML2_ROOT}/tree.c
        ${XML2_ROOT}/hash.c
        ${XML2_ROOT}/list.c
        ${XML2_ROOT}/xmlIO.c
        ${XML2_ROOT}/xmlmemory.c
        ${XML2_ROOT}/uri.c
        ${XML2_ROOT}/valid.c
        ${XML2_ROOT}/xlink.c
        ${XML2_ROOT}/debugXML.c
        ${XML2_ROOT}/xpath.c
        ${XML2_ROOT}/xpointer.c
        ${XML2_ROOT}/xinclude.c
        ${XML2_ROOT}/DOCBparser.c
        ${XML2_ROOT}/catalog.c
        ${XML2_ROOT}/globals.c
        ${XML2_ROOT}/threads.c
        ${XML2_ROOT}/c14n.c
        ${XML2_ROOT}/xmlstring.c
        ${XML2_ROOT}/buf.c
        ${XML2_ROOT}/xmlregexp.c
        ${XML2_ROOT}/xmlschemas.c
        ${XML2_ROOT}/xmlschemastypes.c
        ${XML2_ROOT}/xmlunicode.c
        ${XML2_ROOT}/xmlreader.c
        ${XML2_ROOT}/relaxng.c
        ${XML2_ROOT}/dict.c
        ${XML2_ROOT}/SAX2.c
        ${XML2_ROOT}/xmlwriter.c
        ${XML2_ROOT}/legacy.c
        ${XML2_ROOT}/chvalid.c
        ${XML2_ROOT}/pattern.c
        ${XML2_ROOT}/xmlsave.c
        ${XML2_ROOT}/xmlmodule.c
        ${XML2_ROOT}/schematron.c
        )

add_library(libxml2 SHARED ${SOURCE_FILES})
target_include_directories(libxml2 PUBLIC
        ${XML2_ROOT}/include
        ${ANDROID_ROOT}/external/icu/icu4c/source
        )
target_compile_definitions(libxml2 PRIVATE
        -DLIBXML_THREAD_ENABLED=1
        )
target_compile_options(libxml2 PRIVATE
        -Wno-missing-field-initializers
        -Wno-self-assign
        -Wno-sign-compare
        -Wno-tautological-pointer-compare
        -Wno-unused-parameter
#        -fvisibility=hidden
        )
target_link_libraries(libxml2
        libicuuc
        )