# Set the base flags for the GTK port
add_definitions(-D__WXGTK__)

# Try to find the various versions of the GTK SDK, so as 
# to let the user choose between the available ones.
find_package(GTK3 QUIET)
find_package(GTK2 QUIET)
if (NOT GTK3_FOUND AND NOT GTK2_FOUND)
	# Re-start the package search without the QUIET option so that the
	# user can see what's wrong in details	
	find_package(GTK3)
	find_package(GKT2)
	# And stop since there's not much we can do without GTK anyway
	# TODO: continue if we're building only wxBase (wxUSE_GUI=0)
	message(FATAL_ERROR "Could not find any usable GTK 2/3 installations")
elseif (GTK3_FOUND AND GTK2_FOUND)
	# We found both versions. Default to the "safest" version (GTK2)
	# but add a user option to override.
	option(WXBUILD_USE_GTK3 "Use GTK3 instead of GTK2" OFF)
endif ()

if (WXBUILD_USE_GTK3)
	set(WXBUILD_USE_GTK3 1)
	set(WXBUILD_USE_GTK2 0)
else ()
	set(WXBUILD_USE_GTK3 0)
	set(WXBUILD_USE_GTK2 1)
endif ()
# From now on, assuming we're building for GTK2 xor GTK3
# and that this choice is compatible with system capabilities

if (WXBUILD_USE_GTK2)
	set(WXBUILD_SUBPORT "gtk2")
	if (GTK2_VERSION VERSION_GREATER "2.0")
		add_definitions(-D__WXGTK20__)
	endif ()
	if (GTK2_VERSION VERSION_GREATER "2.4")
		add_definitions(-D__WXGTK24__)
	endif ()
	if (GTK2_VERSION VERSION_GREATER "2.0")
		add_definitions(-D__WXGTK26__)
	endif ()
	if (GTK2_VERSION VERSION_GREATER "2.10")
		add_definitions(-D__WXGTK210__)
	endif ()
	if (GTK2_VERSION VERSION_GREATER "2.18")
		add_definitions(-D__WXGTK218__)
	endif ()
	# Set appropriate include dirs and input libraries for future use
	set(WXGTK_INCLUDE_DIRS ${GTK2_INCLUDE_DIRS})
	set(WXGTK_LIBRARIES ${GTK2_LIBRARIES})
else ()
	set(WXBUILD_SUBPORT "gtk3")
	add_definitions(-D__WXGTK3__ -D__WXGTK20__ -D__WXGTK24__ -D__WXGTK26__ -D__WXGTK210__ -D__WXGTK218__)
	# Set appropriate include dirs and input libraries for future use
	set(WXGTK_INCLUDE_DIRS ${GTK3_INCLUDE_DIRS})
	set(WXGTK_LIBRARIES ${GTK3_LIBRARIES})
	# GTK3 requires wxGraphicsContext, so override that (note that the option
	# is not configurable directly in the setup.h template, so we add it
	# to WXBUILD_ALL_OPTIONS_EXT, whose values will be appended at the end of
	# the file.
	list(APPEND WXBUILD_ALL_OPTIONS_EXT "wxUSE_GRAPHICS_CONTEXT") 
	set(WXSETUP_wxUSE_GRAPHICS_CONTEXT 1)
	# For the same reason as above, wxUSE_CAIRO is implied
	list(APPEND WXBUILD_ALL_OPTIONS_EXT "wxUSE_CAIRO")
	set(WXSETUP_wxUSE_CAIRO 1)
endif ()

# Set common variables to hold the includes and libs for GTK
# regardless of the version
set(WXBUILD_PORT_INCLUDE_DIRS ${WXGTK_INCLUDE_DIRS})
set(WXBUILD_PORT_LIBRARIES ${WXGTK_LIBRARIES} ${X11_LIBRARIES})

# Check if we have webkitgtk
# Note that for GTK2, the only available option is the legacy
# webkit-1.x. For GTK3, we should use webkitgtk-3.x. Versions 1.x
# are based on WebKit 1, while versions 3.x can be built with the
# two WebKit backends (1 and 2). 
# based on versions 1 and 2, respectively (and quite confusingly)
# So:
# - if we're using GTK2, we have no choice: use WebKit 1
# - for GTK3, we choose WebKit 2 if we have it, or fall back
#   to 1 otherwise. Note that I do not offer the option to
#   change that for the time being.
# - WebKit does not have a GTK1 port AFAIK
pkg_check_modules(WEBKIT1 QUIET webkit-1.0)
pkg_check_modules(WEBKIT2 QUIET webkitgtk-3.0)
if (WXBUILD_USE_GTK2)
	if (NOT WEBKIT1_FOUND)
		set(HAVE_WEBKIT 0)
	else()
		set(HAVE_WEBKIT 1)
		set(WEBKIT_API_VERSION 1)
	endif ()
elseif (WXBUILD_USE_GTK3)
	if (WEBKIT2_FOUND)
		set(HAVE_WEBKIT 1)
		set(WEBKIT_API_VERSION 2)
	elseif (WEBKIT1_FOUND)
		set(HAVE_WEBKIT 1)
		set(WEBKIT_API_VERSION 1)
	else ()
		set(HAVE_WEBKIT 0)
	endif ()
else ()
	set(HAVE_WEBKIT 0)
endif ()

# Prepare variables containing includes and libs for WebKit (do not
# add them right now as they would otherwise clutter all modules'
# include and libs - this will be done in the webview module)
if (HAVE_WEBKIT)
	set(_incl_var "WEBKIT${WEBKIT_API_VERSION}_INCLUDE_DIRS")
	set(_libs_var "WEBKIT${WEBKIT_API_VERSION}_LIBRARIES")
	set(WEBKIT_INCLUDE_DIRS ${${_incl_var}})
	set(WEBKIT_LIBRARIES ${${_libs_var}})
endif ()

# GTK port uses the configuration system
include("${CMAKE_CURRENT_LIST_DIR}/wxconfigure.cmake")

