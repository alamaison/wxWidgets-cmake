# wxwidgets.cmake

# Add our custom FindXXX() to the module include path
list(APPEND CMAKE_MODULE_PATH "${WX_CMAKE_DIR}/CMakeModules")

# Include utilities
include("${WX_CMAKE_DIR}/utils.cmake")

# Include shared CMake file (settings that are common to the
# all combinations of OS/compiler/port)
include("${WX_CMAKE_DIR}/init_common.cmake")

# Compatibility chart
#          msvc        win-gcc        unix-gcc
#   msw      *            *
#   gtk      *            *              *
#   osx                                  *
#  univ      *            *              *

# Setup the OS+compiler platform
include("${WX_CMAKE_DIR}/init_platform.cmake")

# Setup the port to build
include("${WX_CMAKE_DIR}/init_port.cmake")

# Include port-specific CMake file
include("${WX_CMAKE_DIR}/wx${WXBUILD_PORT}.cmake")

# Include the port-specific setup.h CMake options. This will define the default
# options in the cache as per the actual defaults in 'setup0.h', and will also
# create the following variables:
# - WXBUILD_ALL_OPTIONS: all the configurable options (e.g. wxUSE_XYZ)
# - [more to come?]
# Include common parts for all ports
include("${WX_CMAKE_DIR}/setups/wxsetup.cmake")
# Include port-specific setup options
include("${WX_CMAKE_DIR}/setups/${WXBUILD_PORT}/wxsetup.cmake")

# Options that were forced off through wx_force_option_off() on the first
# run have been staged - apply them now.
wx_apply_staged_options_off()

# Generate the corresponding 'setup.h' file. Will also add the directory
# where setup.h is located to the compiler's include path.
wx_regen_setup_h()

# Include the source file lists
include("${WX_CMAKE_DIR}/files.cmake")

# ------------------------------------------------------
#                    General build options
# ------------------------------------------------------

# Build shared or static libs ? 
# note: BUILD_SHARED_LIBS is used only to initialize WXBUILD_SHARED_LIBS,
#       the actual switch for the wxWidgets build. This way we don't rely
#       on the shared BUILD_SHARED_LIBS flag, which might be inconsistent
#       between subpackages (e.g. we still compile wxfoobar statically even
#       if we're producing a shared wxWidgets build.
if (NOT DEFINED WXBUILD_SHARED_LIBS)
	if (DEFINED BUILD_SHARED_LIBS)
		set(_default ${BUILD_SHARED_LIBS})
	else ()
		set(_default ON)
	endif ()
	option(WXBUILD_SHARED_LIBS "Build shared libraries" ${_default})
endif ()
option(WXBUILD_SAMPLES "Build the samples" OFF)

# Instruct CMake to handle the FOLDER property on targets
# (why this is needed in the first place I have no idea)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)


# ------------------------------------------------------
#                    Dependencies
# ------------------------------------------------------

# Helper macro to add a library. If the target name does not match
# the directory name, pass the name as 2nd argument
macro (wx_add_dependency DIR_NAME)
	add_subdirectory(${WX_CMAKE_DIR}/CMakeLists/${DIR_NAME})
	if (${ARGC} GREATER 1)
		set(_target ${ARGV1})
	else ()
		set(_target ${DIR_NAME})
	endif ()
	set_target_properties(${_target} PROPERTIES FOLDER "Dependencies")
endmacro ()

if (NOT WXBUILD_SYSTEM_ZLIB)
	wx_add_dependency(wxzlib)
endif()
if (NOT WXBUILD_SYSTEM_PNG)
	wx_add_dependency(wxpng)
endif()
if (NOT WXBUILD_SYSTEM_JPEG)
	wx_add_dependency(wxjpeg)
endif()
if (NOT WXBUILD_SYSTEM_TIFF)
	wx_add_dependency(wxtiff)
endif()
if (NOT WXBUILD_SYSTEM_EXPAT)
	wx_add_dependency(wxexpat expat)
endif()
if (WXSETUP_wxUSE_REGEX)
	wx_add_dependency(wxregex)
endif()

wx_add_dependency(wxscintilla)

# uninstall target
configure_file(
    "${WX_SOURCE_DIR}/build/cmake/cmake_uninstall.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
    IMMEDIATE @ONLY)

# ------------------------------------------------------
#                   Core libraries
# ------------------------------------------------------

set(_core_libs
	adv
	aui
	base
	core
	gl
	html
	media
	net
	propgrid
	qa
	ribbon
	richtext
	stc
	webview
	xml
	xrc
)

foreach (_lib ${_core_libs})
	add_subdirectory(${WX_CMAKE_DIR}/CMakeLists/${_lib})
	set_target_properties(${_lib} PROPERTIES FOLDER "Core libraries")
endforeach ()

# ------------------------------------------------------
#                       Samples
# ------------------------------------------------------

if (WXBUILD_SAMPLES)
	add_subdirectory(${WX_CMAKE_DIR}/CMakeLists/samples)
endif ()


add_custom_target(uninstall
    COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake)
