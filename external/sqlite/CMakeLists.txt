project(libsqlite)

set(SQLITE_ROOT ${ANDROID_ROOT}/external/sqlite)

set(SOURCE_FILES
        ${SQLITE_ROOT}/android/PhoneNumberUtils.cpp
        ${SQLITE_ROOT}/android/OldPhoneNumberUtils.cpp
        ${SQLITE_ROOT}/android/sqlite3_android.cpp
        )


add_library(libsqlite3_android STATIC ${SOURCE_FILES})
target_include_directories(libsqlite3_android
        PRIVATE ${SQLITE_ROOT}/dist
        PUBLIC ${SQLITE_ROOT}/android
)
target_compile_definitions(libsqlite3_android PRIVATE
        -DSQLITE_ENABLE_ICU
        )
target_link_libraries(libsqlite3_android
        liblog
        libicuuc
        libicui18n
        )


add_library(libsqlite SHARED ${SQLITE_ROOT}/dist/sqlite3.c)
target_include_directories(libsqlite PUBLIC
        ${SQLITE_ROOT}/dist
        )
target_compile_definitions(libsqlite PRIVATE
        -DNDEBUG=1
        -DHAVE_USLEEP=1
        -DSQLITE_HAVE_ISNAN
        -DSQLITE_DEFAULT_JOURNAL_SIZE_LIMIT=1048576
        -DSQLITE_THREADSAFE=2
        -DSQLITE_TEMP_STORE=3
        -DSQLITE_POWERSAFE_OVERWRITE=1
        -DSQLITE_DEFAULT_FILE_FORMAT=4
        -DSQLITE_DEFAULT_AUTOVACUUM=1
        -DSQLITE_ENABLE_MEMORY_MANAGEMENT=1
        -DSQLITE_ENABLE_FTS3
        -DSQLITE_ENABLE_FTS3_BACKWARDS
        -DSQLITE_ENABLE_FTS4
        -DSQLITE_OMIT_BUILTIN_TEST
        -DSQLITE_OMIT_COMPILEOPTION_DIAGS
        -DSQLITE_OMIT_LOAD_EXTENSION
        -DSQLITE_DEFAULT_FILE_PERMISSIONS=0600
        -DSQLITE_SECURE_DELETE
        -DSQLITE_ENABLE_BATCH_ATOMIC_WRITE

        -DUSE_PREAD64
        -Dfdatasync=fdatasync
        -DHAVE_MALLOC_H=1
        -DHAVE_MALLOC_USABLE_SIZE
        -DSQLITE_ENABLE_ICU
        )
target_compile_options(libsqlite PRIVATE
        -Wno-unused-parameter
        -Werror
        )
target_link_libraries(libsqlite
        liblog
        libutils
        libicuuc
        libicui18n

        libsqlite3_android
        )
