set(LIB_NAME xml)

add_definitions(-DWXMAKINGDLL_XML -DwxUSE_BASE=0 -DWXUSINGDLL)

include_directories(${WXBUILD_PORT_INCLUDE_DIRS} ${WX_SOURCE_DIR}/src/expat/lib)

set(LIB_SRC
	${WXFILES_XML_SRC}
)

set(LIB_HEADERS
	${WXFILES_XML_HDR}
)

wx_set_pch(LIB_SRC ${WX_SOURCE_DIR}/src/common/dummy.cpp wx/wxprec.h "${WX_SOURCE_DIR}/include/wx/wxprec.h")

wx_set_source_groups()

add_library(${LIB_NAME} SHARED
	${LIB_SRC}
	${LIB_HEADERS}
	${PROJECT_BINARY_DIR}/include/wx/setup.h
)

set(_deps)

list(APPEND _deps ${WXBUILD_PORT_LIBRARIES})

target_link_libraries(${LIB_NAME} core expat ${_deps})

