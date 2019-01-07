# aosp-cmake
Transform aosp build system to cmake, so aosp native code can be imported to CLion

# usage
Copy all the CMakeLists.txt files into aosp project leaving no path changed

- The repository contains two project scripts, aosp and kernel seperated.
- Files under `idea_aosp` and `idea_kernel` are configuration files of CLion projects, the origin is under `.idea` directory

# Transform Kernel Makefile to CMake
```Template
set(LOCAL_PATH ${KERNEL_ROOT}/)

set(SOURCE_FILES "")


add_library(drivers STATIC ${SOURCE_FILES})
target_include_directories(drivers PRIVATE ${LOCAL_PATH})
```
```Regex
// Step 1
obj-\$\((\w+)\)\s+.*=\s+(.+)
if (\${$1})\n$2\nendif()

// Step 2
([\w-]+)\.o\s+
$1\.o\n

// Step 3
([\w-]+)\.o
add_c_source(SOURCE_FILES \${LOCAL_PATH} $1)

```
