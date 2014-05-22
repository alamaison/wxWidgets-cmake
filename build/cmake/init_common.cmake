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
# let user choose the library

option(WX_USE_EXT_ZIP "Set ON to use system zlib" ON)
set(WXBUILD_SYSTEM_ZLIB OFF)
if(WX_USE_EXT_ZIP)
    find_package(ZLIB REQUIRED)
    if(ZLIB_FOUND)
        set(WXBUILD_SYSTEM_ZLIB ON)
    endif(ZLIB_FOUND)
endif (WX_USE_EXT_ZIP)

option(WX_USE_EXT_EXPAT "Set ON to use system expat" ON)
set(WXBUILD_SYSTEM_EXPAT OFF)
if(WX_USE_EXT_EXPAT)
    find_package(EXPAT REQUIRED)
    if(EXPAT_FOUND)
        set(WXBUILD_SYSTEM_EXPAT ON)
    endif(EXPAT_FOUND)
endif (WX_USE_EXT_EXPAT)

option(WX_USE_EXT_PNG "Set ON to use system libPNG" ON)
set(WXBUILD_SYSTEM_PNG OFF)
if(WX_USE_EXT_PNG)
    find_package(PNG REQUIRED)
    if(PNG_FOUND)
        set(WXBUILD_SYSTEM_PNG ON)
    endif(PNG_FOUND)
endif (WX_USE_EXT_PNG)

option(WX_USE_EXT_JPEG "Set ON to use system libJPEG" ON)
set(WXBUILD_SYSTEM_JPEG OFF)
if(WX_USE_EXT_JPEG)
    find_package(JPEG REQUIRED)
    if(JPEG_FOUND)
        set(WXBUILD_SYSTEM_JPEG ON)
    endif(JPEG_FOUND)
endif (WX_USE_EXT_JPEG)

option(WX_USE_EXT_TIFF "Set ON to use system libTIFF" ON)
set(WXBUILD_SYSTEM_TIFF OFF)
if(WX_USE_EXT_TIFF)
    find_package(TIFF REQUIRED)
    if(TIFF_FOUND)
        set(WXBUILD_SYSTEM_TIFF ON)
    endif(TIFF_FOUND)
endif (WX_USE_EXT_TIFF)

