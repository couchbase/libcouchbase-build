CMAKE_MINIMUM_REQUIRED (VERSION 3.1)
CMAKE_POLICY (VERSION 3.1)

# Top-level CMakeLists for libcouchbase
PROJECT (libcouchbase-build)

# Provide reasonable default for CMAKE_INSTALL_PREFIX
IF (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  SET(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/install" CACHE STRING
      "The install location" FORCE)
  LIST(APPEND CMAKE_PREFIX_PATH "${CMAKE_INSTALL_PREFIX}")
ENDIF (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)

# Save CMAKE_INSTALL_PREFIX to temp variable, then set for deps
SET(TempCMakeInstall "${CMAKE_INSTALL_PREFIX}")
SET(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/depbuild" CACHE STRING
    "Temp install location" FORCE)
LIST(APPEND CMAKE_PREFIX_PATH "${CMAKE_BINARY_DIR}/depbuild")

# Configure tlm the way it wants to be configured
SET (CB_DOWNLOAD_DEPS 1)
SET (CB_DOWNLOAD_DEPS_DEFAULT_MANIFEST
  "${PROJECT_SOURCE_DIR}/libcouchbase-build/manifest.cmake")
LIST (APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/tlm/cmake/Modules")
ADD_SUBDIRECTORY (tlm/deps)

# Set CMAKE_INSTALL_PREFIX back to normal location
SET(CMAKE_INSTALL_PREFIX "${TempCMakeInstall}" CACHE STRING "Install location" FORCE)

# Some necessary settings for finding libevent and libuv
SET (LIBEVENT_ROOT "${CMAKE_BINARY_DIR}/tlm/deps/libevent.exploded" CACHE STRING
     "libevent location" FORCE)
SET (LIBUV_ROOT "${CMAKE_BINARY_DIR}/tlm/deps/libuv.exploded" CACHE STRING
     "libuv location" FORCE)

ADD_SUBDIRECTORY (libcouchbase)
