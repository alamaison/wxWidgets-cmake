# Common definitions for the wxWidgets CMake-based build

include_directories(${WX_SOURCE_DIR}/include)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_definitions("-DWXBUILDING")

# By default we're assuming no autoconf-like steps are used
# Ports that require these override this definition in their
# own build/cmake/wx<PORT-NAME>.cmake files
set(WXBUILD_USE_CONFIGURE 0)

option(WXBUILD_USE_GUI "Build GUI classes" ON)
option(WXBUILD_UNIVERSAL "Build the wxUniversal port (instead of this platform's native port)" OFF)
if (WXBUILD_UNIVERSAL)
	add_definitions(-DwxUNIV=1 -D__WXUNIVERSAL__)
endif ()

# Setup the add_library lib type depending on option WXBUILD_SHARED_LIBS
if (WXBUILD_SHARED_LIBS)
	set(WXBUILD_SHARED_OR_STATIC "SHARED")
else ()
	set(WXBUILD_SHARED_OR_STATIC "STATIC")
endif ()


# Find main 3rd party libraries and set defaults accordingly 
# (always prefer system libs over wxWidget's). Probe the system
# lib on first run (WXBUILD_SYSTEM_ZLIB not defined) and
# require the lib if it's defined and ON.
if (WXBUILD_SYSTEM_ZLIB)
	find_package(ZLIB REQUIRED)
else ()
	find_package(ZLIB QUIET)
endif ()
option(WXBUILD_SYSTEM_ZLIB "Use system zlib" ${ZLIB_FOUND})

if (WXBUILD_SYSTEM_PNG)
	find_package(PNG REQUIRED)
else ()
	find_package(PNG QUIET)
endif ()
option(WXBUILD_SYSTEM_PNG "Use system PNG" ${PNG_FOUND})

if (WXBUILD_SYSTEM_JPEG)
	find_package(JPEG REQUIRED)
else ()
	find_package(JPEG QUIET)
endif ()
option(WXBUILD_SYSTEM_JPEG "Use system JPEG" ${JPEG_FOUND})

if (WXBUILD_SYSTEM_TIFF)
	find_package(TIFF REQUIRED)
else ()
	find_package(TIFF QUIET)
endif ()
option(WXBUILD_SYSTEM_TIFF "Use system TIFF" ${TIFF_FOUND})

if (WXBUILD_SYSTEM_EXPAT)
	find_package(EXPAT REQUIRED)
else ()
	find_package(EXPAT QUIET)
endif ()
option(WXBUILD_SYSTEM_EXPAT "Use system EXPAT" ${EXPAT_FOUND})
