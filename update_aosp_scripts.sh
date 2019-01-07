#!/bin/bash
FORCE_COPY=false
ANDROID_ROOT=/Volumes/android
ROOT_CMAKE_SCRIPT=${ANDROID_ROOT}/CMakeLists.txt

function copyIfUpdated()
{
    if [ $# -ne 2 ]; then exit 1; fi
    if [[ ( $FORCE_COPY = "true" ) || ( ! -e "$2" ) || "$1" -nt "$2" ]]; then
        cp "$1" "$2"
        echo "$2"
    fi
}

cd `dirname $0`
if [ -f ${ROOT_CMAKE_SCRIPT} ];
then
    copyIfUpdated ${ROOT_CMAKE_SCRIPT} CMakeLists.txt
else
    echo "Cannot find root cmake script file!!!"
    return
fi

for dir in `awk -F '[()]' '$1=="add_subdirectory" {print $2}' CMakeLists.txt`; do
    if [ ! -d "$dir" ];
    then
        mkdir -p "$dir"
    fi

    copyIfUpdated "${ANDROID_ROOT}/$dir/CMakeLists.txt" "${dir}/CMakeLists.txt"
done

for file in `awk -F '[()]' '$1=="include" {print $2}' CMakeLists.txt`; do
    dir=`dirname $file`
    if [ ! -d "$dir" ];
    then
        mkdir -p "$dir"
    fi

    copyIfUpdated "${ANDROID_ROOT}/${file}" "${file}"
done
unset dir

# if [ -f "${ANDROID_ROOT}/.idea/misc.xml" ]; then
    # if [ ! -d "idea_aosp" ]; then mkdir idea_aosp; fi
    # copyIfUpdated ${ANDROID_ROOT}/.idea/misc.xml idea_aosp/misc.xml
# fi

KERNEL_ROOT=${ANDROID_ROOT}/kernel

# if [ -f "${KERNEL_ROOT}/.idea/misc.xml" ]; then
    # if [ ! -d "idea_kernel" ]; then mkdir idea_kernel; fi
    # copyIfUpdated ${KERNEL_ROOT}/.idea/misc.xml idea_kernel/misc.xml
# fi

for file in `find ${KERNEL_ROOT} -type f -name CMakeLists.txt`; do
    dir=`dirname $file`
    dir=${dir#*${ANDROID_ROOT}/}
    if [ ! -d "$dir" ]; then
        mkdir -p "${dir}"
    fi

    copyIfUpdated "$file" "${file#*${ANDROID_ROOT}/}"
done
unset dir


