# utils.cmake
# Various helpers and utilities for the wxWidgets CMake-based build

# Maintain the setup.h configuration file up to date
macro(wx_regen_setup_h)
	# The process is the following:
	# - generate the file in a temporary location, so that we can compare it to the current
	#   version and update it only if needed (this will avoid triggering a complete rebuild
	#   if CMake runs again but nothing changes in the WXSETUP_XXX options)
	# - inject autoconf-like defines at the beginning of the file (e.g. HAVE_X, SIZEOF_Y, etc.)
	# - place port/platform-specific overrides at the end of the file
	# - copy the file in its final location
	# The generation itself is not 100% straightforward, because the wxUSE_XYZ options do not
	# appear as such here in CMake - they are prefixed with WXSETUP_ (everything configurable
	# in setup is, so it's the case for wxUSE_XYZ but also for WXWIN_XYZ defines). To be able
	# to use the configure_file() command, we need to have matching names. Therefore, we
	# temporarily define appropriate variables out of the WXSETUP_ ones, run configure_file()
	# and unset these temporaries.
	set(setup_include_dir "${CMAKE_BINARY_DIR}/include")
	set(setup_in "${WX_CMAKE_DIR}/setups/${WXBUILD_PORT}/setup0.cmake.h")
	set(setup_temp "${CMAKE_BINARY_DIR}/setup.h.last")
	set(setup_out "${setup_include_dir}/wx/setup.h")
	foreach (real_opt ${WXBUILD_ALL_OPTIONS})
		set(cmake_opt "WXSETUP_${real_opt}")
		set(${real_opt} ${${cmake_opt}})
	endforeach()
	configure_file(${setup_in} ${setup_temp})
	foreach (real_opt ${WXBUILD_ALL_OPTIONS})
		unset(${real_opt})
	endforeach()
	
	# Builds that use autoconf-like configure steps require the injection of the
	# output into the setup.h file
	if (WXBUILD_USE_CONFIGURE)
		string(REPLACE ";" "\n" WXBUILD_CONFIGURE_H "${CONFIGURATION_DIRECTIVES}")
		wx_file_inject_before(${setup_temp} "/* --- start common options --- */" "/* Start of injected configuration */\n\n${WXBUILD_CONFIGURE_H}\n\n/* End of injected configuration */\n\n")
	endif ()
	
	# Additional options that are not in the setup.h template are contained
	# in the WXBUILD_ALL_OPTIONS_EXT list. These are added "manually" at the
	# end of the output file. The caveat is that we can't just append them -
	# we also need to remove the first definition, otherwise the compiler
	# will be going crazy (with warnings, but still).
	if (WXBUILD_ALL_OPTIONS_EXT)
		# Remove all definitions of the variables we will be appending
		# by loading the file, performing regex replaces and saving
		# it back.
		file(READ ${setup_temp} _contents)
		foreach (real_opt ${WXBUILD_ALL_OPTIONS_EXT})
			string(REGEX REPLACE "#([ \t]*)define([ \t]*)(${real_opt})([ \t]*)([1|0])" "/* #define \\3 \\5 (overriden at the end of the file) */" _contents ${_contents})
		endforeach ()
		file(WRITE ${setup_temp} ${_contents})
		# Prepare the lines to be appended
		set(_inj "\n")
		foreach (real_opt ${WXBUILD_ALL_OPTIONS_EXT})
			set(cmake_opt "WXSETUP_${real_opt}")
			if (${cmake_opt})
				set(_inj "${_inj}#define ${real_opt} 1\n")
			else ()
				set(_inj "${_inj}#define ${real_opt} 0\n")
			endif ()
		endforeach ()
		# And add them just before the file ends
		wx_file_inject_before(${setup_temp} "#endif // _WX_SETUP_H_" "${_inj}\n")
	endif ()

	# Check if we need to update setup.h (only if our temp file differs)
	execute_process(COMMAND ${CMAKE_COMMAND} -E compare_files ${setup_temp} ${setup_out} RESULT_VARIABLE out_of_date)
	if (${out_of_date})
		message("Build configuration file 'setup.h' is out of date, recreating")
		# A copy_if_different without the compare_files above would work, but I'd like to 
		# notify the user when the copy occurs - this is not possible to know using only
		# copy_if_different
		execute_process(COMMAND ${CMAKE_COMMAND} -E copy_if_different ${setup_temp} ${setup_out})
	endif()

	# Don't forget to make this newly crafted setup.h file accessible to the build
	include_directories("${setup_include_dir}")
endmacro()



# Add precompiled headers to the current project. Needs a reference
# to the *name* of the variable holding the source files - not its
# value.
#
# There are 2 forms of invocation:
# 1) wx_set_pch(varname [prefix=pch])
# 2) wx_set_pch(varname pch_impl pch_header [pch_header_fullpath=pch_header])
# See their full description below. Form 1) should be used for regular projects
# where the pch .h/.cpp files are "private" to the project being compiled, and
# have the same prefix name (e.g. pch.h, pch.cpp).
# Form 2) should be used when the header file is public (or otherwise does not sit 
# next to the source file); this is the case for wxWidgets.
#
# Example (2nd form):
# set(LIB_SRC foo.cpp bar.cpp)
# wx_set_pch(LIB_SRC stdafx) # notice the absence of the expansion operator ${}: we pass the *name* of the variable
# add_library(mylib ${LIB_SRC}) # ${LIB_SRC} is now foo.cpp;bar.cpp;stdafx.h;stdafx.cpp
function(wx_set_pch src_files_varname)	
	
	set(_SRC_FILES ${${src_files_varname}})
	if (${ARGC} GREATER 2)
		# If called in the form wx_set_pch(varname arg2 arg3 [arg4]):
		# arg2 is the name of the PCH "implementation" file (e.g. dummy.cpp)
		# arg3 is the name of the PCH header file (e.g. wx/wxprec.h)
		if (${ARGC} GREATER 3)
			# Optionnaly, arg4 is the full path to the header file, if different
			# from its "reachable" name in arg3. E.g. for wxWidgets (especially)
			# the wxprec.h files sits in the public include dir so arg3 is 'wx/wxprec.h'
			# but the file to be added to the project (arg4) is 'full/path/to/include/wx/wxprec.h'
			set(_PCH_REAL_H ${ARGV3})
		else ()
			set(_PCH_REAL_H ${ARGV3})
		endif ()
		set(_PCH_CPP ${ARGV1})
		set(_PCH_USE_H ${ARGV2})
	else ()
		if (${ARGC} GREATER 1)
			# If called in the form wx_set_pch(varname arg2):
			# arg2 is a prefix that is used to name both the PCH header and
			# implementation, e.g. stdafx -> stdafx.h and stdafx.cpp
			set(_PCH_PREFIX ${ARGV1})
		else ()
			# If called wx_set_pch(varname), the prefix defaults to 'pch'
			set(_PCH_PREFIX "pch")
		endif ()
		set(_PCH_REAL_H ${_PCH_PREFIX}.h)
		set(_PCH_USE_H ${_PCH_PREFIX}.h)
		set(_PCH_CPP ${_PCH_PREFIX}.cpp)
	endif ()

	if (MSVC)
		set_source_files_properties(
			${_PCH_CPP}
			PROPERTIES
			COMPILE_FLAGS "/Yc${_PCH_USE_H}"
			)
		foreach( src_file ${_SRC_FILES} )
			if ( ${src_file} MATCHES "^.*\\.h$" )
				set_source_files_properties(${src_file} PROPERTIES HEADER_FILE_ONLY TRUE) 
			else ( ${src_file} MATCHES "^.*\\.h$" )
				if ( ${src_file} MATCHES "^.*\\.cpp$" )
					set_source_files_properties(
						${src_file}
						PROPERTIES
						COMPILE_FLAGS "/Yu${_PCH_USE_H}"
						)
				endif ( ${src_file} MATCHES "^.*\\.cpp$" )
			endif ( ${src_file} MATCHES "^.*\\.h$" )
		endforeach( src_file ${_SRC_FILES} )
		list(APPEND _SRC_FILES ${_PCH_CPP})
		list(APPEND _SRC_FILES ${_PCH_REAL_H})
	endif ()
	
	set(${src_files_varname} ${_SRC_FILES} PARENT_SCOPE)
	
endfunction(wx_set_pch)


macro(wx_add_sample name more_deps)

	set(APP_NAME sample_${name})

	if (WXBUILD_SHARED_LIBS)
		add_definitions("-DWXUSINGDLL")
	endif ()

	if (WIN32)
		set(PLATFORM_SPECIFIC_CONTROL WIN32)
	else ()
		set(PLATFORM_SPECIFIC_CONTROL "") 
	endif ()

	add_executable(${APP_NAME} ${PLATFORM_SPECIFIC_CONTROL}
		${ARGN}
	)

	target_link_libraries(${APP_NAME} base core ${more_deps})
	
	set_target_properties(${APP_NAME} PROPERTIES FOLDER "Samples")

endmacro(wx_add_sample)





macro (wx_file_inject_before FILENAME PATTERN CONTENTS)
	file(READ ${FILENAME} _contents)
	string(FIND "${_contents}" "${PATTERN}" _index)
	if (${_index} LESS 0)
		message(FATAL_ERROR "The pattern '${PATTERN}' was not found in the file ${FILENAME}")
	elseif (${_index} EQUAL 0)	
		set(_before "")
	else ()
		string(SUBSTRING "${_contents}" 0 ${_index} _before)
	endif ()
	string(SUBSTRING "${_contents}" ${_index} -1 _after)
	#message("before")
	#message(${_before})
	#message("after")
	#message(${_after})
	file(WRITE "${FILENAME}" "${_before}")
	file(APPEND "${FILENAME}" "${CONTENTS}")
	file(APPEND "${FILENAME}" "${_after}")
	#message(FATAL_ERROR stop)
endmacro (wx_file_inject_before)

# Force a user-selected wxUSE_XXX option to OFF without updating the cache.
# This is most certainly called because the compile-time requirements for
# a feature were not found - see e.g. wxconfigure.cmake.
# Displays a warning that can be turned off.
macro (wx_force_option_off SHORT_OPT MISSING)
	set(_opt "WXSETUP_${SHORT_OPT}")
	if (${_opt})
		set(${_opt} OFF)
		set(_elems "")
		foreach (i ${MISSING})
			if (_elems)
				set(_elems "${_elems}, ")
			endif ()
			set(_elems "${_elems}${i}")
		endforeach ()
		set(_warnopt "WXBUILDWARNS_${SHORT_OPT}")
		option(${_warnopt} "Turn off the warning because ${SHORT_OPT} was forced to 0" ON)
		if (${_warnopt})
			message(WARNING "${SHORT_OPT} was turned off because none of ${_elems} have been found. Unset the option WXSETUP_${SHORT_OPT}, or alternatively set ${_warnopt} to OFF to turn off this warning.")
		endif ()
	endif ()
endmacro (wx_force_option_off)

# Simple macro to set a variable to an evaluated condition
# http://www.cmake.org/pipermail/cmake/2006-March/008755.html
MACRO(set_eval OUTVAR)
   IF(${ARGN})
     SET(${OUTVAR} 1)
   ELSE(${ARGN})
     SET(${OUTVAR} 0)
   ENDIF(${ARGN})
ENDMACRO(set_eval)


macro (wx_set_source_groups)
	source_group("Common sources" REGULAR_EXPRESSION "/src/")
	source_group("Common headers" REGULAR_EXPRESSION "/include/wx/")
	source_group("Generic sources" REGULAR_EXPRESSION "/src/generic/")
	source_group("Generic headers" REGULAR_EXPRESSION "/include/wx/generic/")
	source_group("MSW sources" REGULAR_EXPRESSION "/src/msw/")
	source_group("MSW headers" REGULAR_EXPRESSION "/include/wx/msw/")
	source_group("Setup headers" REGULAR_EXPRESSION "/include/wx/setup.h$")
endmacro ()
