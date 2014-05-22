
add_definitions(-D__WXMSW__)

set(WXBUILD_SUBPORT)


set(WXBUILD_PORT_INCLUDE_DIRS "")
set(WXBUILD_PORT_LIBRARIES Rpcrt4 Comctl32)

if (CYGWIN)
	# Cygwin platform uses the configuration system
	# FIXME: this is a broken approach
	include("${CMAKE_CURRENT_LIST_DIR}/wxconfigure.cmake")
	list(APPEND CONFIGURATION_DIRECTIVES "#define wxUSE_LIBMSPACK 0")
endif ()

