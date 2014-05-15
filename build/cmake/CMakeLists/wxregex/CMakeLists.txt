set(LIB_NAME wxregex)

set(LIB_SRC_DIR ${WX_SOURCE_DIR}/src/regex)

set(LIB_SRC
	${LIB_SRC_DIR}/regcomp.c
	${LIB_SRC_DIR}/regerror.c
	${LIB_SRC_DIR}/regexec.c
	${LIB_SRC_DIR}/regfree.c
)

add_library(${LIB_NAME} STATIC
	${LIB_SRC}
)

if ((NOT WIN32) AND (CMAKE_SIZEOF_VOID_P EQUAL 8))
	# 64 bit POSIX builds need -fPIC, otherwise you get the "relocation 
	# R_X86_64_32 against `.anysymbol' can not be used when making a 
	# shared object; recompile with -fPIC" error
	set_target_properties(${LIB_NAME} PROPERTIES COMPILE_FLAGS "-fPIC")
endif ()

