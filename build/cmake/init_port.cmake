# List of all available ports
set(WXBUILD_PORTS "osx" "gtk" "motif" "msw" "os2" "univ")
set(WXBUILD_PORTS_NAMES "osx, gtk, motif, msw, os2, univ")

# Helper macro
macro (wx_guess_port outvarname)
	if (${WXBUILD_PORT})
		message(FATAL_ERROR "Cannot call wx_guess_port() when a port is already selected")
	endif ()
	set(${outvarname} "")
	if (MSVC OR MINGW OR MSYS)
		set(${outvarname} msw)
	elseif (UNIX)
		set(${outvarname} gtk)
	endif ()
endmacro(wx_guess_port)


# Select the port to build, or bail out with an error if we can't. There's not much
# we can do if we don't select one, is it?
if (NOT WXBUILD_PORT)
	set(_helpstr "The wxWidgets port to build. Can be one of ${WXBUILD_PORTS_NAMES}")
	set(WXBUILD_PORT "" CACHE STRING ${_helpstr})
	set_property(CACHE WXBUILD_PORT PROPERTY STRINGS ${WXBUILD_PORTS})
	set(_guess "")
	wx_guess_port(_guess)
	if (NOT _guess)
		message(FATAL_ERROR "You need to specify a wxWidgets port in WXBUILD_PORT (one of ${WXBUILD_PORTS_NAMES})")
	else ()
		message("The wxWidgets port '${_guess}' was automatically selected based on your compiler/platform. Please check that it is what you want (other choices are ${WXBUILD_PORTS_NAMES}).")
	endif ()
	set(WXBUILD_PORT ${_guess} CACHE STRING ${_helpstr} FORCE)
else ()
	list(FIND WXBUILD_PORTS ${WXBUILD_PORT} check)
	if (check LESS 0)
		message(FATAL_ERROR "Unknown wxWidgets port name: ${WXBUILD_PORT}. Please choose one of ${WXBUILD_PORTS_NAMES}.")
	endif ()
endif ()
