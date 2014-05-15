# This file is a replacement for the various checks made by legacy autoconf
# e.g. HAVE_X, SIZEOF_Y, etc.

# Inform the build system that we're using checks so that the proper definitions
# can be injected into the generated 'setup.h'
set(WXBUILD_USE_CONFIGURE 1)

include(CheckTypeSize)
include(CheckFunctionExists)
include(CheckSymbolExists)
include(CheckCSourceCompiles)
include(CheckCXXSourceCompiles)
include(FindPkgConfig)
include(CheckCCompilerFlag)
include(CheckPrototypeDefinition)
include(CheckIncludeFile)


# These helper macros work mostly like the original ones (e.g. check_function_exists for
# my_check_function_exists) but they also update the CONFIGURATION_DIRECTIVES list with
# a line that should be injected into setup.h.
# TODO: rework this design by using a generic, common setup.h.inc file for all platforms,
# all compilers, using the appropriate #cmakdefines for everything.

set(CONFIGURATION_DIRECTIVES "")

macro (my_check_type_size TYPENAME OUTPUT_SUFFIX)
	check_type_size("${TYPENAME}" "${OUTPUT_SUFFIX}")
	if (${HAVE_${OUTPUT_SUFFIX}})
		list(APPEND CONFIGURATION_DIRECTIVES "#define HAVE_${OUTPUT_SUFFIX}")
	else ()
		list(APPEND CONFIGURATION_DIRECTIVES "/* #undef HAVE_${OUTPUT_SUFFIX} */")
	endif ()
	list(APPEND CONFIGURATION_DIRECTIVES "#define SIZEOF_${OUTPUT_SUFFIX} ${${OUTPUT_SUFFIX}}")
endmacro (my_check_type_size)


macro (my_check_function_exists FUNCNAME OUTPUT_VAR)
	if ("${ARGC}" GREATER 2)
		set(CMAKE_REQUIRED_INCLUDES ${ARGV2})
		set(CMAKE_REQUIRED_LIBRARIES ${ARGV3})
	endif ()
	check_function_exists("${FUNCNAME}" "${OUTPUT_VAR}")
	set(CMAKE_REQUIRED_INCLUDES)
	set(CMAKE_REQUIRED_LIBRARIES)
	if (${OUTPUT_VAR})
		list(APPEND CONFIGURATION_DIRECTIVES "#define ${OUTPUT_VAR}")
	else ()
		list(APPEND CONFIGURATION_DIRECTIVES "/* #undef ${OUTPUT_VAR} */")
	endif ()
endmacro (my_check_function_exists)

macro (my_check_symbol_exists SYMBOL FILENAME OUTPUT_VAR)
	check_symbol_exists("${SYMBOL}" "${FILENAME}" "${OUTPUT_VAR}")
	if (${OUTPUT_VAR})
		list(APPEND CONFIGURATION_DIRECTIVES "#define ${OUTPUT_VAR}")
	else ()
		list(APPEND CONFIGURATION_DIRECTIVES "/* #undef ${OUTPUT_VAR} */")
	endif ()
endmacro (my_check_symbol_exists)


macro (my_check_c_source_compiles SOURCE OUTPUT_VAR INCLUDES)
	set(_src)
	foreach (header ${INCLUDES})
		set(_src "${_src}#include <${header}>\n")
	endforeach ()
	if (${ARGC} GREATER 2)
		set(_src "${_src}${ARGN}\n")	
	endif ()
	set(_src "${_src}\nint main(int argc, char* argv[]) {\n ${SOURCE}\nreturn 0; }")
	check_c_source_compiles("${_src}" "${OUTPUT_VAR}")
	if (${OUTPUT_VAR})
		list(APPEND CONFIGURATION_DIRECTIVES "#define ${OUTPUT_VAR}")
	else ()
		list(APPEND CONFIGURATION_DIRECTIVES "/* #undef ${OUTPUT_VAR} */")
	endif ()
endmacro (my_check_c_source_compiles)


macro (my_check_cxx_source_compiles SOURCE OUTPUT_VAR INCLUDES)
	set(_src)
	foreach (header ${INCLUDES})
		set(_src "${_src}#include <${header}>\n")
	endforeach ()
	if (${ARGC} GREATER 2)
		set(_src "${_src}${ARGN}\n")	
	endif ()
	set(_src "${_src}\nint main(int argc, char* argv[]) {\n ${SOURCE}\nreturn 0; }")
	check_cxx_source_compiles("${_src}" "${OUTPUT_VAR}")
	if (${OUTPUT_VAR})
		list(APPEND CONFIGURATION_DIRECTIVES "#define ${OUTPUT_VAR}")
	else ()
		list(APPEND CONFIGURATION_DIRECTIVES "/* #undef ${OUTPUT_VAR} */")
	endif ()
endmacro (my_check_cxx_source_compiles)


macro (my_check_c_compiler_flag FLAG OUTVAR)
	check_c_compiler_flag(${FLAG} ${OUTVAR})
	if (${OUTVAR})
		list(APPEND CONFIGURATION_DIRECTIVES "#define ${OUTVAR}")
	else ()
		list(APPEND CONFIGURATION_DIRECTIVES "/* #undef ${OUTVAR} */")
	endif ()
endmacro (my_check_c_compiler_flag)


macro (my_check_wx PREFIX MODULE)
	pkg_check_modules(${PREFIX} ${MODULE} QUIET)
	if (${PREFIX}_FOUND)
		list(APPEND CONFIGURATION_DIRECTIVES "#define wxHAS_${PREFIX}")
	else ()
		list(APPEND CONFIGURATION_DIRECTIVES "/* #undef wxHAS_${PREFIX} */")
	endif ()
endmacro (my_check_wx)


macro (my_check_prototype_definition FUNCTION PROTOTYPE RETURN HEADER OUTPUT_VARIABLE)
	check_prototype_definition("${FUNCTION}" "${PROTOTYPE}" "${RETURN}" "${HEADER}" "${OUTPUT_VARIABLE}")
	if (${OUTPUT_VARIABLE})
		list(APPEND CONFIGURATION_DIRECTIVES "#define ${OUTVAR}")
	else ()
		list(APPEND CONFIGURATION_DIRECTIVES "/* #undef ${OUTVAR} */")
	endif ()
endmacro (my_check_prototype_definition)


macro (my_check_parameter_type TYPES SRC_CODE INCLUDES OUTPUT_VARIABLE)
	set(_found 0)
	set(_src_begin "")
	foreach (hdr ${INCLUDES})
		set(_src_begin "${_src_begin}#include <${hdr}>\n")
	endforeach ()
	set(_src_begin "${_src_begin}int main(int argc, char* argv[]) {\n")
	set(_src_end "\treturn 0;\n}\n")
	set(_counter 0)
	foreach (_type ${TYPES})
		set(_persistent_var __my_check_parameter_type_${OUTPUT_VARIABLE}_${_counter})
		set (_src "${_src_begin}\t${_type} the_param;\n\t${SRC_CODE};\n${_src_end}")
		check_cxx_source_compiles("${_src}" ${_persistent_var})
		if (${_persistent_var})
			set(_found 1)
			list(APPEND CONFIGURATION_DIRECTIVES "#define ${OUTPUT_VARIABLE} ${_type}")
			break()
		endif ()
		math(EXPR _counter "${_counter}+1")
	endforeach ()
	if (NOT _found)
		message(FATAL_ERROR "Could not find the type of ${OUTPUT_VARIABLE}")
	endif ()
endmacro ()


macro (my_cmake_check TEST OUTVAR)
	if (${TEST})
		set(_value 1)
	else ()
		set(_value 0)
	endif ()
	list(APPEND CONFIGURATION_DIRECTIVES "#define ${OUTVAR} 1")
	if (${ARGN})
		# If 3rd argument is true, add the result as -Dfoo=value
		# in the compiler's command line for the tests in this file
		list(APPEND CMAKE_REQUIRED_DEFINITIONS "-D${OUTVAR}=${_value}")
	endif ()
endmacro(my_cmake_check)



macro (my_check_include_file INCLUDE OUTVAR)
	check_include_file(${INCLUDE} ${OUTVAR})
	if (${OUTVAR})
		list(APPEND CONFIGURATION_DIRECTIVES "#define ${OUTVAR}")
	else ()
		list(APPEND CONFIGURATION_DIRECTIVES "/* #undef ${OUTVAR} */")
	endif ()
endmacro (my_check_include_file)


list(APPEND CONFIGURATION_DIRECTIVES "#ifndef _GNU_SOURCE")
my_cmake_check(CMAKE_COMPILER_IS_GNUCXX _GNU_SOURCE true)
list(APPEND CONFIGURATION_DIRECTIVES "#endif")

# Don't really what to do with a compiler that does not have standard libc headers
# so let's assume we've got one that is ANSI compliant. If things go wrong with
# your exotic compiler, this might be something to investigate.
list(APPEND CONFIGURATION_DIRECTIVES "#define STDC_HEADERS 1")

set_eval(_check ${WXBUILD_PLATFORM} STREQUAL "unix")
my_cmake_check(${_check} wxUSE_UNIX)

# Add these as well (will see later)
list(APPEND CONFIGURATION_DIRECTIVES "#define wxUSE_NANOX 0")


list(APPEND CONFIGURATION_DIRECTIVES "#define WXWIN_OS_DESCRIPTION \"${CMAKE_SYSTEM}\"")
list(APPEND CONFIGURATION_DIRECTIVES "#define wxINSTALL_PREFIX \"${CMAKE_INSTALL_PREFIX}\"")


my_check_type_size(int INT)
my_check_type_size(wchar_t WCHAR_T)
my_check_type_size(size_t SIZE_T)
my_check_type_size(ssize_t SSIZE_T)

my_check_function_exists(dlopen HAVE_DLOPEN dlfcn.h dl)

my_check_symbol_exists(va_copy stdarg.h HAVE_VA_COPY)
my_check_symbol_exists(wprintf wchar.h HAVE_WPRINTF)
my_check_symbol_exists(vswscanf wchar.h HAVE_VSWSCANF)

my_check_c_source_compiles("struct tm tm;" WX_GMTOFF_IN_TM "time.h")
my_check_symbol_exists(gettimeofday sys/time.h HAVE_GETTIMEOFDAY)
my_check_symbol_exists(ftime sys/timeb.h HAVE_FTIME)
my_check_symbol_exists(localtime_r time.h HAVE_LOCALTIME_R)
my_check_symbol_exists(gmtime_r time.h HAVE_GMTIME_R)

my_check_symbol_exists(gethostbyname netdb.h HAVE_GETHOSTBYNAME)
my_check_symbol_exists(getservbyname netdb.h HAVE_GETSERVBYNAME)
my_check_symbol_exists(inet_aton "sys/socket.h;netinet/in.h;arpa/inet.h" HAVE_INET_ATON)
my_check_symbol_exists(inet_addr "sys/socket.h;netinet/in.h;arpa/inet.h" HAVE_INET_ADDR)

my_check_symbol_exists(select "sys/select.h" HAVE_SYS_SELECT_H)
my_check_symbol_exists(epoll_ctl "sys/epoll.h" HAVE_SYS_EPOLL_H)

my_check_c_compiler_flag("-fvisibility=hidden" HAVE_VISIBILITY)

my_check_wx(INOTIFY inotify)
my_check_wx(KQUEUE kqueue)
if ((NOT INOTIFY_FOUND) AND (NOT KQUEUE_FOUND))
	wx_force_option_off(wxUSE_FSWATCHER "INotify;kqueue")
endif ()


my_check_symbol_exists(fcntl "unistd.h;fcntl.h" HAVE_FCNTL)
my_check_symbol_exists(flock "sys/file.h" HAVE_FLOCK)
if ((NOT HAVE_FCNTL) AND (NOT HAVE_FLOCK))
	wx_force_option_off(wxUSE_FSWATCHER "fcntl();flock()")
endif ()

my_check_symbol_exists(backtrace "execinfo.h" HAVE_EXECINFO)
if (NOT HAVE_EXECINFO)
	wx_force_option_off(wxUSE_STACKWALKER "<execinfo.h>")
endif ()

my_check_symbol_exists(usleep "unistd.h" HAVE_USLEEP)
my_check_symbol_exists(nanosleep "time.h" HAVE_NANOSLEEP)

my_check_symbol_exists(sigaction "signal.h" HAVE_SIGACTION)
if (NOT HAVE_SIGACTION)
	wx_force_option_off(wxUSE_ON_FATAL_EXCEPTION "sigaction()")
else ()
	# Check parameter to signal handler (int or void?). Custom check
	# because we're not simply #definining the result but we set the
	# special wxTYPE_SA_HANDLER declaration.
	# Note that we're using C++ because (as per configure.in) the "C compiler 
	# happily compiles the code even if there is type mismatch"
	check_cxx_source_compiles("#include <signal.h>
		void testSigHandler(int) {} 
		int main(int argc, char* argv[]) {
			struct sigaction sa;
			sa.sa_handler = testSigHandler;
			return 0;
		}"
		__is_param_to_handler_int)
	if (__is_param_to_handler_int)
		list(APPEND CONFIGURATION_DIRECTIVES "#define wxTYPE_SA_HANDLER int")
	else ()
		list(APPEND CONFIGURATION_DIRECTIVES "#define wxTYPE_SA_HANDLER void")
	endif ()
endif ()


my_check_parameter_type("socklen_t;size_t;int" "getsockname(0, 0, &the_param);" "sys/types.h;sys/socket.h" WX_SOCKLEN_T)
my_check_parameter_type("socklen_t;size_t;int" "getsockopt(0, 0, 0, 0, &the_param);" "sys/types.h;sys/socket.h" SOCKOPTLEN_T)


my_check_symbol_exists(js_event "linux/joystick.h" HAVE_JOYSTICK_H)
if (NOT HAVE_JOYSTICK_H)
	wx_force_option_off(wxUSE_JOYSTICK "<linux/joystick.h>")
endif ()


my_check_cxx_source_compiles("Foo f;" HAVE_EXPLICIT "" "class Foo { public: explicit Foo() {} };")

my_check_symbol_exists(va_copy "stdarg.h" HAVE_VA_COPY)
my_check_c_source_compiles("return foo(\"hi\", 17);" VA_LIST_IS_ARRAY "stdarg.h" "int foo(char *f, ...)
                    {
                        va_list ap1, ap2;
                        va_start(ap1, f);
                        ap2 = ap1;
                        if ( va_arg(ap1, int) != 17 || va_arg(ap2, int) != 17 )
                            return 1;
                        va_end(ap2);
                        va_end(ap1);
                        return 0;
                    }")

my_check_c_source_compiles("test(\"%s %d %p\", \"test\", 1, 0);" HAVE_VARIADIC_MACROS "stdio.h" "#define test(fmt, ...) printf(fmt, __VA_ARGS__)")

my_check_cxx_source_compiles("std::wstring x(L\"hello world\");" HAVE_STD_WSTRING "string")
my_check_cxx_source_compiles("std::string foo, bar;
            foo.compare(bar);
            foo.compare(1, 1, bar);
            foo.compare(1, 1, bar, 1, 1);
            foo.compare(\"\");
            foo.compare(1, 1, \"\");
            foo.compare(1, 1, \"\", 2);" HAVE_STD_STRING_COMPARE "string")

my_check_include_file("hash_map" HAVE_HASH_MAP)
my_check_include_file("ext/hash_map" HAVE_EXT_HASH_MAP)

list(APPEND CMAKE_REQUIRED_DEFINITIONS "-pthread")
list(APPEND CMAKE_REQUIRED_LIBRARIES "-pthread")
my_check_symbol_exists(pthread_cleanup_push pthread.h wxHAVE_PTHREAD_CLEANUP)
my_check_c_source_compiles("static __thread int n = 0; static __thread int *p = 0;" HAVE___THREAD_KEYWORD "pthread.h")
my_check_c_source_compiles("pthread_mutexattr_t attr; pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);" HAVE_PTHREAD_MUTEXATTR_T pthread.h)
my_check_symbol_exists(pthread_mutexattr_settype pthread.h HAVE_PTHREAD_MUTEXATTR_SETTYPE_DECL)
my_check_c_source_compiles("pthread_mutex_t attr = PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP;" HAVE_PTHREAD_RECURSIVE_MUTEX_INITIALIZER pthread.h)
if (NOT HAVE_PTHREAD_MUTEXATTR_SETTYPE_DECL AND NOT HAVE_PTHREAD_RECURSIVE_MUTEX_INITIALIZER)
	# this may break code working elsewhere, so at least warn about it
	message(WARNING "wxMutex won't be recursive on this platform")
endif ()
my_check_symbol_exists(pthread_cancel pthread.h HAVE_PTHREAD_CANCEL)
my_check_symbol_exists(pthread_mutex_timedlock pthread.h HAVE_PTHREAD_MUTEX_TIMEDLOCK)
my_check_symbol_exists(pthread_attr_setstacksize pthread.h HAVE_PTHREAD_ATTR_SETSTACKSIZE)

#my_check_symbol_exists(vsscanf "stdarg.h;stdio.h" HAVE_VSSCANF)
my_check_c_source_compiles("char *buf; va_list args; vsscanf(buf, \"%s\", args);" HAVE_VSSCANF_DECL "stdio.h;stdarg.h" "#include <stdio.h>
                    #include <stdarg.h>
                    #ifdef __MSL__
                    #if __MSL__ >= 0x6000
                    namespace std {}
                    using namespace std;
                    #endif
                    #endif")

# Each port should have already defined HAVE_WEBKIT (1=found, 0=not found) 
# and, if the previous is 1, WEBKIT_API_VERSION (1 or 2).
if (NOT HAVE_WEBKIT)
	wx_force_option_off(wxUSE_WEBVIEW_WEBKIT "the required include files")
	if (NOT (${WXBUILD_PLATFORM} STREQUAL win32))
		wx_force_option_off(wxUSE_WEBVIEW "MSIE and WebKit")
	endif ()
endif ()
