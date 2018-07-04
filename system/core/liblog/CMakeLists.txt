project(liblog)

set(LOG_ROOT ${ANDROID_ROOT}/system/core/liblog)

set(SOURCE_FILES
        ${LOG_ROOT}/config_read.c
        ${LOG_ROOT}/config_write.c
        ${LOG_ROOT}/local_logger.c
        ${LOG_ROOT}/log_event_list.c
        ${LOG_ROOT}/log_event_write.c
        ${LOG_ROOT}/log_ratelimit.cpp
        ${LOG_ROOT}/logger_lock.c
        ${LOG_ROOT}/logger_name.c
        ${LOG_ROOT}/logger_read.c
        ${LOG_ROOT}/logger_write.c
        ${LOG_ROOT}/logprint.c
        ${LOG_ROOT}/stderr_write.c)

set(HOST_SOURCE_FILES
        ${LOG_ROOT}/fake_log_device.c
        ${LOG_ROOT}/fake_writer.c)

set(TARGET_SOURCE_FILES
        ${LOG_ROOT}/event_tag_map.cpp
        ${LOG_ROOT}/log_time.cpp
        ${LOG_ROOT}/properties.c
        ${LOG_ROOT}/pmsg_reader.c
        ${LOG_ROOT}/pmsg_writer.c
        ${LOG_ROOT}/logd_reader.c
        ${LOG_ROOT}/logd_writer.c)

set(NOT_WINDOWS_SOURCE_FILES
        ${LOG_ROOT}/event_tag_map.cpp)

list(APPEND SOURCE_FILES ${TARGET_SOURCE_FILES})
list(APPEND SOURCE_FILES ${NOT_WINDOWS_SOURCE_FILES})

include_directories(BEFORE ${LOG_ROOT}/include)

add_library(liblog SHARED ${SOURCE_FILES})
target_compile_definitions(liblog PRIVATE
        -DLIBLOG_LOG_TAG=1006
        -DSNET_EVENT_LOG_TAG=1397638484
        )
target_compile_options(liblog PRIVATE
        -Werror
        -fvisibility=hidden
        )