cmake_minimum_required(VERSION 3.6.0)

if(AARCH64_LINUX_TOOLCHAIN_INCLUDED)
  return()
endif(AARCH64_LINUX_TOOLCHAIN_INCLUDED)


SET(CMAKE_SYSTEM_NAME "Linux")
SET(CMAKE_SYSTEM_PROCESSOR aarch64)
SET(CMAKE_CROSS_COMPILING TRUE)

if(NOT AARCH64_LINUX_TOOLCHAIN_ROOT)
  set(AARCH64_LINUX_TOOLCHAIN_ROOT $ENV{AARCH64_LINUX_TOOLCHAIN_ROOT})
endif()
if(NOT AARCH64_LINUX_SYSROOT)
  set(AARCH64_LINUX_SYSROOT $ENV{AARCH64_LINUX_SYSROOT})
endif()

# Specify cross compiler
SET(_CMAKE_TOOLCHAIN_LOCATION ${AARCH64_LINUX_TOOLCHAIN_ROOT}/bin)
SET(_CMAKE_TOOLCHAIN_PREFIX aarch64-linux-gnu)
SET(CMAKE_C_COMPILER ${_CMAKE_TOOLCHAIN_LOCATION}/${_CMAKE_TOOLCHAIN_PREFIX}-gcc)
SET(CMAKE_CXX_COMPILER ${_CMAKE_TOOLCHAIN_LOCATION}/${_CMAKE_TOOLCHAIN_PREFIX}-g++)
SET(CMAKE_AR ${_CMAKE_TOOLCHAIN_LOCATION}/${_CMAKE_TOOLCHAIN_PREFIX}-ar CACHE FILEPATH "Archiver")
SET(CMAKE_RANLIB ${_CMAKE_TOOLCHAIN_LOCATION}/${_CMAKE_TOOLCHAIN_PREFIX}-ranlib CACHE FILEPATH "Ranlib")
SET(CMAKE_STRIP ${_CMAKE_TOOLCHAIN_LOCATION}/${_CMAKE_TOOLCHAIN_PREFIX}-strip CACHE FILEPATH "Strip")
SET(CMAKE_LINKER ${_CMAKE_TOOLCHAIN_LOCATION}/${_CMAKE_TOOLCHAIN_PREFIX}-ld CACHE FILEPATH "Linker")
SET(CMAKE_SYSROOT ${AARCH64_LINUX_SYSROOT})

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3")

set(ASTRA_AARCH64_LINUX TRUE)

# Specify searching libraries and includes only in target directory
SET(CMAKE_FIND_ROOT_PATH ${AARCH64_LINUX_SYSROOT}/usr/lib)
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
#SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)