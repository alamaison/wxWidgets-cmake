set(LIB_NAME base)

if (NOT WXBUILD_SYSTEM_ZLIB)
	include_directories(${WX_SOURCE_DIR}/src/zlib)
else()
    include_directories(${ZLIB_INCLUDE_DIRS})
    add_definitions(-DZLIB_DLL)
endif ()

if (WXSETUP_wxUSE_REGEX)
	include_directories(${WX_SOURCE_DIR}/src/regex)
endif()

add_definitions(-DwxUSE_BASE=1 -DwxUSE_GUI=0)

if(BUILD_SHARED_LIBS)
  add_definitions(-DWXMAKINGDLL_BASE)
endif()

set(LIB_SRC
	${WXFILES_BASE_SRC}
	${WXFILES_BASE_AND_GUI_SRC}
	${WXFILES_BASE_PLATFORM_SRC}
	${WXFILES_BASE_AND_GUI_PLATFORM_SRC}
)

set(LIB_HEADERS
	${WXFILES_BASE_CMN_HDR}
	${WXFILES_BASE_PLATFORM_HDR}
)

foreach (hdr ${LIB_HEADERS})
	# There are .cpp files in the headers. To exclude all of them from compilation,
	# we use this command unconditionally (it does no harm on .h files)
	set_source_files_properties(${hdr} PROPERTIES HEADER_FILE_ONLY TRUE)
endforeach ()

wx_set_pch(LIB_SRC ${WX_SOURCE_DIR}/src/common/dummy.cpp wx/wxprec.h "${WX_SOURCE_DIR}/include/wx/wxprec.h")

wx_set_source_groups()

add_library(${LIB_NAME}
	${LIB_SRC}
	${LIB_HEADERS}
	${PROJECT_BINARY_DIR}/include/wx/setup.h
)

set(_deps)
if (NOT WXBUILD_SYSTEM_ZLIB)
	list(APPEND _deps wxzlib)
else ()
	list(APPEND _deps ${ZLIB_LIBRARIES})
endif ()

if (WXSETUP_wxUSE_REGEX)
	list(APPEND _deps wxregex)
endif()

if (${WXBUILD_PLATFORM} STREQUAL "win32")
	target_link_libraries(${LIB_NAME} ws2_32)
endif ()

target_link_libraries(${LIB_NAME} ${_deps})

