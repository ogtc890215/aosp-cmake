project(libvintf)

set(VINTF_ROOT ${ANDROID_ROOT}/system/libvintf)

set(SOURCE_FILES
        ${VINTF_ROOT}/parse_string.cpp
        ${VINTF_ROOT}/parse_xml.cpp
        ${VINTF_ROOT}/CompatibilityMatrix.cpp
        ${VINTF_ROOT}/HalManifest.cpp
        ${VINTF_ROOT}/HalInterface.cpp
        ${VINTF_ROOT}/KernelConfigParser.cpp
        ${VINTF_ROOT}/KernelConfigTypedValue.cpp
        ${VINTF_ROOT}/RuntimeInfo.cpp
        ${VINTF_ROOT}/ManifestHal.cpp
        ${VINTF_ROOT}/MatrixHal.cpp
        ${VINTF_ROOT}/MatrixKernel.cpp
        ${VINTF_ROOT}/TransportArch.cpp
        ${VINTF_ROOT}/VintfObject.cpp
        ${VINTF_ROOT}/XmlFile.cpp
        ${VINTF_ROOT}/utils.cpp

        ${VINTF_ROOT}/RuntimeInfo-target.cpp
        )

include_directories(${VINTF_ROOT}/include/vintf)


add_library(libvintf SHARED ${SOURCE_FILES})
target_include_directories(libvintf PUBLIC
        ${VINTF_ROOT}/include
        )
target_compile_definitions(libvintf PRIVATE
        -DLIBVINTF_TARGET
        )
target_compile_options(libvintf PRIVATE
        -Wall
        -Werror
        )
target_link_libraries(libvintf
        libbase
        liblog
        libselinux
        libtinyxml2

        libcutils
        libutils
        libz
        )