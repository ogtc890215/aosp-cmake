project(libmtp)

set(MTP_ROOT ${ANDROID_ROOT}/frameworks/av/media/mtp)

set(SOURCE_FILES
        ${MTP_ROOT}/AsyncIO.cpp
        ${MTP_ROOT}/MtpDataPacket.cpp
        ${MTP_ROOT}/MtpDebug.cpp
        ${MTP_ROOT}/MtpDevHandle.cpp
        ${MTP_ROOT}/MtpDevice.cpp
        ${MTP_ROOT}/MtpDeviceInfo.cpp
        ${MTP_ROOT}/MtpEventPacket.cpp
        ${MTP_ROOT}/MtpFfsHandle.cpp
        ${MTP_ROOT}/MtpObjectInfo.cpp
        ${MTP_ROOT}/MtpPacket.cpp
        ${MTP_ROOT}/MtpProperty.cpp
        ${MTP_ROOT}/MtpRequestPacket.cpp
        ${MTP_ROOT}/MtpResponsePacket.cpp
        ${MTP_ROOT}/MtpServer.cpp
        ${MTP_ROOT}/MtpStorage.cpp
        ${MTP_ROOT}/MtpStorageInfo.cpp
        ${MTP_ROOT}/MtpStringBuffer.cpp
        ${MTP_ROOT}/MtpUtils.cpp
        )


add_library(libmtp SHARED ${SOURCE_FILES})
target_include_directories(libmtp PUBLIC
        ${MTP_ROOT}
        )
target_compile_definitions(libmtp PRIVATE
        -DMTP_DEVICE
        -DMTP_HOST
        )
target_compile_options(libmtp PRIVATE
        -Wextra
        -Werror
        -Wall
        )
target_link_libraries(libmtp
        libbase
        libutils
        liblog
        libusbhost
        )