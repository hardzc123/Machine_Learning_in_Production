To cross-compile a C++ project from your MacBook M1 (ARM architecture) to target Linux x86 and Windows x86 platforms, you’ll need to set up appropriate toolchains and configure your project accordingly. Here’s a step-by-step guide:

1. Install Cross-Compilation Toolchains

	•	For Linux x86:
	•	Install a cross-compiler that targets x86 architecture. On macOS, you can use Homebrew to install the i686-elf-gcc cross-compiler:

brew tap nativeos/i386-elf-toolchain
brew install i386-elf-gcc


	•	This compiler will allow you to build binaries for Linux x86 on your MacBook M1.

	•	For Windows x86:
	•	Install the MinGW-w64 cross-compiler, which targets Windows:

brew install mingw-w64


	•	This will provide you with the x86_64-w64-mingw32-gcc compiler for building Windows executables.

2. Create Toolchain Files

Toolchain files inform CMake about the compilers and system settings for the target platform.

	•	Linux x86 Toolchain File (linux_x86_toolchain.cmake):

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


	•	Windows x86 Toolchain File (windows_x86_toolchain.cmake):

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86)

# Specify the cross compiler
set(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc)
set(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++)

# Specify the target environment
set(CMAKE_FIND_ROOT_PATH /usr/local/Cellar/mingw-w64)

# Adjust the default behavior of the FIND_XXX() commands:
# Search for programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# Search for libraries and headers in the target environment
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)



Save these files in your project directory.

3. Configure Your CMake Project

Assuming you have a simple C++ project with the following structure:

your_project/
├── CMakeLists.txt
├── main.cpp
├── linux_x86_toolchain.cmake
└── windows_x86_toolchain.cmake

	•	CMakeLists.txt:

cmake_minimum_required(VERSION 3.10)
project(CrossCompileExample)

add_executable(hello main.cpp)


	•	main.cpp:

#include <iostream>

int main() {
    std::cout << "Hello, cross-compilation!" << std::endl;
    return 0;
}



4. Build for Linux x86

Open a terminal in your project directory and run:

mkdir build-linux
cd build-linux
cmake .. -DCMAKE_TOOLCHAIN_FILE=../linux_x86_toolchain.cmake
make

This will generate an executable suitable for Linux x86.

5. Build for Windows x86

Open a terminal in your project directory and run:

mkdir build-windows
cd build-windows
cmake .. -DCMAKE_TOOLCHAIN_FILE=../windows_x86_toolchain.cmake
make

This will generate a Windows executable.

6. Transfer and Test the Binaries

	•	Linux x86:
	•	Transfer the binary to a Linux x86 machine and run it:

./hello


	•	Windows x86:
	•	Transfer the binary to a Windows machine and run it:

hello.exe



Additional Notes:

	•	Ensure that the cross-compilers are correctly installed and accessible in your system’s PATH.
	•	The CMAKE_FIND_ROOT_PATH in the toolchain files should point to the root directory where the cross-compilers and their libraries are installed. Adjust these paths based on your installation.
	•	For more complex projects with dependencies, you may need to provide additional configurations in the toolchain files to locate the necessary libraries and headers for the target platforms.

By following these steps, you can cross-compile your C++ project from a MacBook M1 to both Linux x86 and Windows x86 platforms.