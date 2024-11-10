set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86)

# Specify the cross compiler
set(CMAKE_C_COMPILER i386-elf-gcc)
set(CMAKE_CXX_COMPILER i386-elf-g++)

# Specify the target environment
set(CMAKE_FIND_ROOT_PATH /usr/local/i386-elf)

# Adjust the default behavior of the FIND_XXX() commands:
# Search for programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# Search for libraries and headers in the target environment
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)