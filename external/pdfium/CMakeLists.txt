project(libpdfium)

set(PDFIUM_ROOT ${ANDROID_ROOT}/external/pdfium)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstrict-aliasing")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprefetch-loop-arrays")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fexceptions")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-non-virtual-dtor")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

include_directories(${PDFIUM_ROOT})
include_directories(${ANDROID_ROOT}/external/freetype/include)

set(SOURCE_FILES
        ${PDFIUM_ROOT}/fpdfsdk/formfiller/cba_fontmap.cpp
        ${PDFIUM_ROOT}/fpdfsdk/formfiller/cffl_checkbox.cpp
        ${PDFIUM_ROOT}/fpdfsdk/formfiller/cffl_combobox.cpp
        ${PDFIUM_ROOT}/fpdfsdk/formfiller/cffl_formfiller.cpp
        ${PDFIUM_ROOT}/fpdfsdk/formfiller/cffl_interactiveformfiller.cpp
        ${PDFIUM_ROOT}/fpdfsdk/formfiller/cffl_listbox.cpp
        ${PDFIUM_ROOT}/fpdfsdk/formfiller/cffl_pushbutton.cpp
        ${PDFIUM_ROOT}/fpdfsdk/formfiller/cffl_radiobutton.cpp
        ${PDFIUM_ROOT}/fpdfsdk/formfiller/cffl_textfield.cpp
        )

add_library(libpdfiumformfiller STATIC ${SOURCE_FILES})
target_compile_definitions(libpdfiumformfiller PRIVATE
        -DOPJ_STATIC
        -DV8_DEPRECATION_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        )
target_compile_options(libpdfiumformfiller PRIVATE
        -Wno-sign-compare
        -Wno-unused-parameter
        )

set(SOURCE_FILES
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/PWL_Button.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/PWL_Caret.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/PWL_ComboBox.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/PWL_Edit.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/PWL_EditCtrl.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/PWL_FontMap.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/PWL_Icon.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/PWL_ListBox.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/PWL_ScrollBar.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/PWL_SpecialButton.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/PWL_Utils.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/PWL_Wnd.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfwindow/cpwl_color.cpp
        )

add_library(libpdfiumpdfwindow STATIC ${SOURCE_FILES})
target_compile_definitions(libpdfiumpdfwindow PRIVATE
        -DOPJ_STATIC
        -DV8_DEPRECATION_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        )
target_compile_options(libpdfiumpdfwindow PRIVATE
        -Wno-sign-compare
        -Wno-unused-parameter
        )

add_library(libpdfiumjavascript STATIC ${PDFIUM_ROOT}/fpdfsdk/javascript/JS_Runtime_Stub.cpp)
target_compile_definitions(libpdfiumjavascript PRIVATE
        -DOPJ_STATIC
        -DV8_DEPRECATION_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        )
target_compile_options(libpdfiumjavascript PRIVATE
        -Wno-sign-compare
        -Wno-unused-parameter
        )

set(SOURCE_FILES
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/Adobe-CNS1-UCS2_5.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/B5pc-H_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/B5pc-V_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/CNS-EUC-H_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/CNS-EUC-V_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/ETen-B5-H_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/ETen-B5-V_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/ETenms-B5-H_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/ETenms-B5-V_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/HKscs-B5-H_5.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/HKscs-B5-V_5.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/UniCNS-UCS2-H_3.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/UniCNS-UCS2-V_3.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/UniCNS-UTF16-H_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/CNS1/cmaps_cns1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/Adobe-GB1-UCS2_5.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/GB-EUC-H_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/GB-EUC-V_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/GBK-EUC-H_2.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/GBK-EUC-V_2.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/GBK2K-H_5.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/GBK2K-V_5.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/GBKp-EUC-H_2.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/GBKp-EUC-V_2.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/GBpc-EUC-H_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/GBpc-EUC-V_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/UniGB-UCS2-H_4.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/UniGB-UCS2-V_4.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/GB1/cmaps_gb1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/83pv-RKSJ-H_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/90ms-RKSJ-H_2.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/90ms-RKSJ-V_2.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/90msp-RKSJ-H_2.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/90msp-RKSJ-V_2.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/90pv-RKSJ-H_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/Add-RKSJ-H_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/Add-RKSJ-V_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/Adobe-Japan1-UCS2_4.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/EUC-H_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/EUC-V_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/Ext-RKSJ-H_2.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/Ext-RKSJ-V_2.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/H_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/UniJIS-UCS2-HW-H_4.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/UniJIS-UCS2-HW-V_4.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/UniJIS-UCS2-H_4.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/UniJIS-UCS2-V_4.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/V_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Japan1/cmaps_japan1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Korea1/Adobe-Korea1-UCS2_2.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Korea1/KSC-EUC-H_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Korea1/KSC-EUC-V_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Korea1/KSCms-UHC-HW-H_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Korea1/KSCms-UHC-HW-V_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Korea1/KSCms-UHC-H_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Korea1/KSCms-UHC-V_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Korea1/KSCpc-EUC-H_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Korea1/UniKS-UCS2-H_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Korea1/UniKS-UCS2-V_1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Korea1/UniKS-UTF16-H_0.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/Korea1/cmaps_korea1.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cmaps/fpdf_cmaps.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cpdf_modulemgr.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/cpdf_pagerendercontext.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/edit/cpdf_pagecontentgenerator.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/edit/fpdf_edit_create.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/font/cpdf_cidfont.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/font/cpdf_font.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/font/cpdf_fontencoding.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/font/cpdf_simplefont.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/font/cpdf_truetypefont.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/font/cpdf_type1font.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/font/cpdf_type3char.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/font/cpdf_type3font.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/font/fpdf_font.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/font/fpdf_font_cid.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/font/ttgsubtable.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_allstates.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_clippath.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_color.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_colorspace.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_colorstate.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_contentmark.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_contentmarkitem.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_contentparser.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_docpagedata.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_form.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_formobject.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_generalstate.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_graphicstates.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_image.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_imageobject.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_meshstream.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_page.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_pagemodule.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_pageobject.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_pageobjectholder.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_pageobjectlist.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_path.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_pathobject.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_pattern.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_shadingobject.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_shadingpattern.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_streamcontentparser.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_streamparser.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_textobject.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_textstate.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/cpdf_tilingpattern.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/fpdf_page_colors.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/page/fpdf_page_func.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cfdf_document.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_array.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_boolean.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_crypto_handler.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_data_avail.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_dictionary.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_document.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_hint_tables.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_indirect_object_holder.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_linearized_header.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_name.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_null.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_number.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_object.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_parser.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_reference.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_security_handler.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_simple_parser.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_stream.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_stream_acc.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_string.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/cpdf_syntax_parser.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/fpdf_parser_decode.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/parser/fpdf_parser_utility.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_charposlist.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_devicebuffer.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_dibsource.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_dibtransferfunc.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_docrenderdata.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_imagecacheentry.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_imageloader.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_imagerenderer.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_pagerendercache.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_progressiverenderer.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_rendercontext.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_renderoptions.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_renderstatus.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_scaledrenderbuffer.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_textrenderer.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_transferfunc.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_type3cache.cpp
        ${PDFIUM_ROOT}/core/fpdfapi/render/cpdf_type3glyphs.cpp
        )

add_library(libpdfiumfpdfapi STATIC ${SOURCE_FILES})
target_compile_definitions(libpdfiumfpdfapi PRIVATE
        -DOPJ_STATIC
        -DV8_DEPRECATION_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        )
target_compile_options(libpdfiumfpdfapi PRIVATE
        -Wno-sign-compare
        -Wno-unused-parameter
        -Wno-missing-field-initializers
        )


set(SOURCE_FILES
        ${PDFIUM_ROOT}/core/fxge/android/cfpf_skiadevicemodule.cpp
        ${PDFIUM_ROOT}/core/fxge/android/cfpf_skiafont.cpp
        ${PDFIUM_ROOT}/core/fxge/android/cfpf_skiafontmgr.cpp
        ${PDFIUM_ROOT}/core/fxge/android/cfx_androidfontinfo.cpp
        ${PDFIUM_ROOT}/core/fxge/android/fx_android_imp.cpp
        ${PDFIUM_ROOT}/core/fxge/dib/fx_dib_composite.cpp
        ${PDFIUM_ROOT}/core/fxge/dib/fx_dib_convert.cpp
        ${PDFIUM_ROOT}/core/fxge/dib/fx_dib_engine.cpp
        ${PDFIUM_ROOT}/core/fxge/dib/fx_dib_main.cpp
        ${PDFIUM_ROOT}/core/fxge/dib/fx_dib_transform.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitDingbats.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitFixed.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitFixedBold.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitFixedBoldItalic.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitFixedItalic.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitSans.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitSansBold.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitSansBoldItalic.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitSansItalic.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitSansMM.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitSerif.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitSerifBold.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitSerifBoldItalic.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitSerifItalic.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitSerifMM.cpp
        ${PDFIUM_ROOT}/core/fxge/fontdata/chromefontdata/FoxitSymbol.cpp
        ${PDFIUM_ROOT}/core/fxge/freetype/fx_freetype.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_cliprgn.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_facecache.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_folderfontinfo.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_font.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_fontcache.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_fontmapper.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_fontmgr.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_gemodule.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_graphstate.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_graphstatedata.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_pathdata.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_renderdevice.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_substfont.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cfx_unicodeencoding.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/cttfontdesc.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/fx_ge_fontmap.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/fx_ge_linux.cpp
        ${PDFIUM_ROOT}/core/fxge/ge/fx_ge_text.cpp
        ${PDFIUM_ROOT}/core/fxge/ifx_renderdevicedriver.cpp
        ${PDFIUM_ROOT}/core/fxge/agg/fx_agg_driver.cpp
        )

add_library(libpdfiumfxge STATIC ${SOURCE_FILES})
target_compile_definitions(libpdfiumfxge PRIVATE
        -DOPJ_STATIC
        -DV8_DEPRECATION_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        )
target_compile_options(libpdfiumfxge PRIVATE
        -Wno-sign-compare
        -Wno-unused-parameter
        -Wno-switch
        )

set(SOURCE_FILES
        ${PDFIUM_ROOT}/fpdfsdk/fxedit/fxet_ap.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fxedit/fxet_edit.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fxedit/fxet_list.cpp
        )

add_library(libpdfiumfxedit STATIC ${SOURCE_FILES})
target_compile_definitions(libpdfiumfxedit PRIVATE
        -DOPJ_STATIC
        -DV8_DEPRECATION_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        )
target_compile_options(libpdfiumfxedit PRIVATE
        -Wno-sign-compare
        -Wno-unused-parameter
        )


set(SOURCE_FILES
        ${PDFIUM_ROOT}/core/fpdftext/cpdf_linkextract.cpp
        ${PDFIUM_ROOT}/core/fpdftext/cpdf_textpage.cpp
        ${PDFIUM_ROOT}/core/fpdftext/cpdf_textpagefind.cpp
        ${PDFIUM_ROOT}/core/fpdftext/unicodenormalizationdata.cpp
        )

add_library(libpdfiumfpdftext STATIC ${SOURCE_FILES})
target_compile_definitions(libpdfiumfpdftext PRIVATE
        -DOPJ_STATIC
        -DV8_DEPRECATION_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        )
target_compile_options(libpdfiumfpdftext PRIVATE
        -Wno-sign-compare
        -Wno-unused-parameter
        )


set(SOURCE_FILES
        ${PDFIUM_ROOT}/core/fxcrt/fx_basic_array.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_basic_bstring.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_basic_buffer.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_basic_coords.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_basic_gcc.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_basic_memmgr.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_basic_utf.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_basic_util.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_basic_wstring.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_bidi.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_extension.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_ucddata.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_unicode.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_xml_composer.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fx_xml_parser.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fxcrt_posix.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fxcrt_stream.cpp
        ${PDFIUM_ROOT}/core/fxcrt/fxcrt_windows.cpp
        )

add_library(libpdfiumfxcrt STATIC ${SOURCE_FILES})
target_compile_definitions(libpdfiumfxcrt PRIVATE
        -DOPJ_STATIC
        -DV8_DEPRECATION_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        -D_FX_CPU_=_FX_X64_
        )
target_compile_options(libpdfiumfxcrt PRIVATE
        -Wno-sign-compare
        -Wno-unused-parameter
        -fPIC
        )


set(SOURCE_FILES
        ${PDFIUM_ROOT}/core/fxcodec/codec/fx_codec.cpp
        ${PDFIUM_ROOT}/core/fxcodec/codec/fx_codec_fax.cpp
        ${PDFIUM_ROOT}/core/fxcodec/codec/fx_codec_flate.cpp
        ${PDFIUM_ROOT}/core/fxcodec/codec/fx_codec_icc.cpp
        ${PDFIUM_ROOT}/core/fxcodec/codec/fx_codec_jbig.cpp
        ${PDFIUM_ROOT}/core/fxcodec/codec/fx_codec_jpeg.cpp
        ${PDFIUM_ROOT}/core/fxcodec/codec/fx_codec_jpx_opj.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_ArithDecoder.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_ArithIntDecoder.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_BitStream.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_Context.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_GrdProc.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_GrrdProc.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_GsidProc.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_HtrdProc.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_HuffmanDecoder.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_HuffmanTable.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_HuffmanTable_Standard.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_Image.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_PatternDict.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_PddProc.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_SddProc.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_Segment.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_SymbolDict.cpp
        ${PDFIUM_ROOT}/core/fxcodec/jbig2/JBig2_TrdProc.cpp
        )

include_directories(${ANDROID_ROOT}/external/zlib)

add_library(libpdfiumfxcodec STATIC ${SOURCE_FILES})
target_compile_definitions(libpdfiumfxcodec PRIVATE
        -DOPJ_STATIC
        -DV8_DEPRECATION_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        )
target_compile_options(libpdfiumfxcodec PRIVATE
        -Wno-sign-compare
        -Wno-pointer-to-int-cast
        -Wno-unused-parameter
        )
target_link_libraries(libpdfiumfxcodec
        libz
        )


set(SOURCE_FILES
        ${PDFIUM_ROOT}/core/fpdfdoc/cline.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/clines.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_aaction.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_action.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_actionfields.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_annot.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_annotlist.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_apsettings.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_bookmark.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_bookmarktree.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_defaultappearance.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_dest.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_docjsactions.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_filespec.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_formcontrol.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_formfield.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_iconfit.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_interform.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_link.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_linklist.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_metadata.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_nametree.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_numbertree.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_occontext.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_pagelabel.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_variabletext.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpdf_viewerpreferences.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpvt_color.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpvt_fontmap.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpvt_generateap.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpvt_sectioninfo.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/cpvt_wordinfo.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/csection.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/ctypeset.cpp
        ${PDFIUM_ROOT}/core/fpdfdoc/doc_tagged.cpp
        )

add_library(libpdfiumfpdfdoc STATIC ${SOURCE_FILES})
target_compile_definitions(libpdfiumfpdfdoc PRIVATE
        -DOPJ_STATIC
        -DV8_DEPRECATION_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        )
target_compile_options(libpdfiumfpdfdoc PRIVATE
        -Wno-sign-compare
        -Wno-unused-parameter
        )


set(SOURCE_FILES
        ${PDFIUM_ROOT}/core/fdrm/crypto/fx_crypt.cpp
        ${PDFIUM_ROOT}/core/fdrm/crypto/fx_crypt_aes.cpp
        ${PDFIUM_ROOT}/core/fdrm/crypto/fx_crypt_sha.cpp
        )

add_library(libpdfiumfdrm STATIC ${SOURCE_FILES})
target_compile_definitions(libpdfiumfdrm PRIVATE
        -DOPJ_STATIC
        -DV8_DEPRECATION_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        )
target_compile_options(libpdfiumfdrm PRIVATE
        -Wno-sign-compare
        -Wno-unused-parameter
        )


set(SOURCE_FILES
        ${PDFIUM_ROOT}/third_party/agg23/agg_curves.cpp
        ${PDFIUM_ROOT}/third_party/agg23/agg_path_storage.cpp
        ${PDFIUM_ROOT}/third_party/agg23/agg_rasterizer_scanline_aa.cpp
        ${PDFIUM_ROOT}/third_party/agg23/agg_vcgen_dash.cpp
        ${PDFIUM_ROOT}/third_party/agg23/agg_vcgen_stroke.cpp
        )

add_library(libpdfiumagg23 STATIC ${SOURCE_FILES})
target_compile_options(libpdfiumagg23 PRIVATE
        -Wno-unused-parameter
        -Wno-unused-function
        )

set(SOURCE_FILES
        ${PDFIUM_ROOT}/third_party/bigint/BigInteger.cc
        ${PDFIUM_ROOT}/third_party/bigint/BigIntegerUtils.cc
        ${PDFIUM_ROOT}/third_party/bigint/BigUnsigned.cc
        ${PDFIUM_ROOT}/third_party/bigint/BigUnsignedInABase.cc
        )

add_library(libpdfiumbigint STATIC ${SOURCE_FILES})


set(SOURCE_FILES
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmscam02.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmscgats.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmscnvrt.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmserr.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsgamma.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsgmt.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmshalf.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsintrp.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsio0.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsio1.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmslut.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsmd5.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsmtrx.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsnamed.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsopt.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmspack.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmspcs.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsplugin.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsps2.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmssamp.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmssm.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmstypes.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsvirt.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmswtpnt.c
        ${PDFIUM_ROOT}/third_party/lcms2-2.6/src/cmsxform.c
        )

add_library(libpdfiumlcms STATIC ${SOURCE_FILES})
target_compile_options(libpdfiumlcms PRIVATE
        -Wno-unused-parameter
        -Wno-unused-function
        -Wno-missing-braces
        )


set(SOURCE_FILES
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jcapimin.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jcapistd.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jccoefct.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jccolor.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jcdctmgr.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jchuff.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jcinit.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jcmainct.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jcmarker.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jcmaster.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jcomapi.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jcparam.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jcphuff.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jcprepct.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jcsample.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jctrans.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdapimin.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdapistd.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdcoefct.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdcolor.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jddctmgr.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdhuff.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdinput.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdmainct.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdmarker.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdmaster.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdmerge.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdphuff.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdpostct.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdsample.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jdtrans.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jerror.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jfdctfst.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jfdctint.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jidctfst.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jidctint.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jidctred.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jmemmgr.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jmemnobs.c
        ${PDFIUM_ROOT}/third_party/libjpeg/fpdfapi_jutils.c
        )

add_library(libpdfiumjpeg STATIC ${SOURCE_FILES})
target_compile_options(libpdfiumjpeg PRIVATE
        -Wno-unused-parameter
        -Wno-shift-negative-value
        )


set(SOURCE_FILES
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/bio.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/cio.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/dwt.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/event.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/function_list.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/image.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/invert.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/j2k.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/jp2.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/mct.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/mqc.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/openjpeg.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/opj_clock.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/pi.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/raw.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/t1.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/t2.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/tcd.c
        ${PDFIUM_ROOT}/third_party/libopenjpeg20/tgt.c
        )

add_library(libpdfiumopenjpeg STATIC ${SOURCE_FILES})
target_compile_options(libpdfiumopenjpeg PRIVATE
        -Wno-unused-parameter
        -Wno-sign-compare
        )


set(SOURCE_FILES
        ${PDFIUM_ROOT}/third_party/zlib_v128/adler32.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/compress.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/crc32.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/deflate.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/gzclose.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/gzlib.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/gzread.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/gzwrite.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/infback.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/inffast.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/inflate.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/inftrees.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/trees.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/uncompr.c
        ${PDFIUM_ROOT}/third_party/zlib_v128/zutil.c
        )

add_library(libpdfiumzlib STATIC ${SOURCE_FILES})
target_compile_options(libpdfiumzlib PRIVATE
        -Wno-unused-parameter
        -Wno-shift-negative-value
        )


set(SOURCE_FILES
        ${PDFIUM_ROOT}/fpdfsdk/cba_annotiterator.cpp
        ${PDFIUM_ROOT}/fpdfsdk/cfx_systemhandler.cpp
        ${PDFIUM_ROOT}/fpdfsdk/cpdfsdk_annot.cpp
        ${PDFIUM_ROOT}/fpdfsdk/cpdfsdk_annothandlermgr.cpp
        ${PDFIUM_ROOT}/fpdfsdk/cpdfsdk_annotiteration.cpp
        ${PDFIUM_ROOT}/fpdfsdk/cpdfsdk_baannot.cpp
        ${PDFIUM_ROOT}/fpdfsdk/cpdfsdk_baannothandler.cpp
        ${PDFIUM_ROOT}/fpdfsdk/cpdfsdk_datetime.cpp
        ${PDFIUM_ROOT}/fpdfsdk/cpdfsdk_formfillenvironment.cpp
        ${PDFIUM_ROOT}/fpdfsdk/cpdfsdk_interform.cpp
        ${PDFIUM_ROOT}/fpdfsdk/cpdfsdk_pageview.cpp
        ${PDFIUM_ROOT}/fpdfsdk/cpdfsdk_widget.cpp
        ${PDFIUM_ROOT}/fpdfsdk/cpdfsdk_widgethandler.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdf_dataavail.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdf_ext.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdf_flatten.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdf_progressive.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdf_searchex.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdf_structtree.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdf_sysfontinfo.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdf_transformpage.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdfdoc.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdfeditimg.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdfeditpage.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdfeditpath.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdfedittext.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdfformfill.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdfppo.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdfsave.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdftext.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fpdfview.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fsdk_actionhandler.cpp
        ${PDFIUM_ROOT}/fpdfsdk/fsdk_pauseadapter.cpp
        ${PDFIUM_ROOT}/fpdfsdk/pdfsdk_fieldaction.cpp
        )


add_library(libpdfium SHARED ${SOURCE_FILES})
target_include_directories(libpdfium PUBLIC
        ${PDFIUM_ROOT}/public
        )
target_compile_definitions(libpdfiumfxcodec PRIVATE
        -DV8_DEPRECATION_WARNINGS
        -D_CRT_SECURE_NO_WARNINGS
        )
target_compile_options(libpdfium PRIVATE
        -Wno-sign-compare
        -Wno-unused-parameter
        )
target_link_libraries(libpdfium
        libpdfiumformfiller
        libpdfiumpdfwindow
        libpdfiumjavascript
        libpdfiumfpdfapi
        libpdfiumfxge
        libpdfiumfxedit
        libpdfiumfpdftext
        libpdfiumfxcrt
        libpdfiumfxcodec
        libpdfiumfpdfdoc
        libpdfiumfdrm
        libpdfiumagg23
        libpdfiumbigint
        libpdfiumlcms
        libpdfiumjpeg
        libpdfiumopenjpeg
        libpdfiumzlib

        libft2
        ${ANDROID_ROOT}/out/soong/.intermediates/bionic/libc/crtbegin_so/android_arm64_armv8-a_cortex-a53_core/crtbegin_so.o
        )
