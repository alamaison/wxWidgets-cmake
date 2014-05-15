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


# Find main 3rd party libraries and set defaults accordingly 
# (always prefer system libs over wxWidget's)

find_package(ZLIB QUIET)
option(WXBUILD_SYSTEM_ZLIB "Use system zlib" ${ZLIB_FOUND})

find_package(PNG QUIET)
option(WXBUILD_SYSTEM_PNG "Use system PNG" ${PNG_FOUND})

find_package(JPEG QUIET)
option(WXBUILD_SYSTEM_JPEG "Use system JPEG" ${JPEG_FOUND})

find_package(TIFF QUIET)
option(WXBUILD_SYSTEM_TIFF "Use system TIFF" ${TIFF_FOUND})

