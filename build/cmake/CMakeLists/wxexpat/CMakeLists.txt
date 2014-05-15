# Expat already has its own CMake build system, so use that (instead of re-inventing the wheel),
# setting the appropriate options (build static library, without any utils/tests/samples)
# TODO: the build variables for expat are named BUILD_xxx, which is very unfortunate when it
# is embedded - those should really be prefixed by EXPAT_ (or, even better, EXPATBUILD_ since
# we're not using, but building expat).
set(BUILD_examples OFF CACHE BOOL "Build Expat examples")
mark_as_advanced(BUILD_examples)
set(BUILD_shared OFF CACHE BOOL "Build Expat as a shared library")
mark_as_advanced(BUILD_shared)
set(BUILD_tests OFF CACHE BOOL "Build Expat tests")
mark_as_advanced(BUILD_tests)
set(BUILD_tools OFF CACHE BOOL "Build Expat tools")
mark_as_advanced(BUILD_tools)

# Include the real CMakeLists, specifying the binary dir as it's not a 
# child directory.
add_subdirectory(${WX_SOURCE_DIR}/src/expat ${PROJECT_BINARY_DIR}/_wxexpat)

# It does however create its expat_config.h in the subproject directory, and
# its CMakeLists.txt assume it is ${PROJECT_BINARY_DIR}. This is not true as
# we use it as a subproject, so copy the output .h file to a reachable location.
set(_EXPAT_GENERATED_CONFIG_H "${PROJECT_BINARY_DIR}/_wxexpat/expat_config.h")
set(_EXPAT_TARGET_CONFIG_H "${PROJECT_BINARY_DIR}/include/expat_config.h")
execute_process(COMMAND ${CMAKE_COMMAND} -E copy_if_different ${_EXPAT_GENERATED_CONFIG_H} ${_EXPAT_TARGET_CONFIG_H})
# Another tweak to the original CMakeLists.txt: add -fPIC when necessary
if ((NOT WIN32) AND (CMAKE_SIZEOF_VOID_P EQUAL 8))
	# 64 bit POSIX builds need -fPIC, otherwise you get the "relocation 
	# R_X86_64_32 against `.anysymbol' can not be used when making a 
	# shared object; recompile with -fPIC" error
	set_target_properties(expat PROPERTIES COMPILE_FLAGS "-fPIC")
endif ()

