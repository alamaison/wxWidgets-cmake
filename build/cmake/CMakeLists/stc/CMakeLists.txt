set(LIB_NAME stc)

add_definitions(-DwxUSE_BASE=0 -D__WX__ -DSCI_LEXER -DLINK_LEXERS)

if(BUILD_SHARED_LIBS)
  add_definitions(-DWXMAKINGDLL_STC -DWXUSINGDLL)
endif()

include_directories(${WXBUILD_PORT_INCLUDE_DIRS})
include_directories(${WX_SOURCE_DIR}/src/stc/scintilla/include ${WX_SOURCE_DIR}/src/stc/scintilla/src ${WX_SOURCE_DIR}/src/stc/scintilla/lexlib)

set(LIB_SRC
	${WXFILES_STC_SRC}
)

set(LIB_HEADERS
	${WXFILES_STC_HDR}
)

wx_set_pch(LIB_SRC ${WX_SOURCE_DIR}/src/common/dummy.cpp wx/wxprec.h "${WX_SOURCE_DIR}/include/wx/wxprec.h")

wx_set_source_groups()

add_library(${LIB_NAME}
	${LIB_SRC}
	${LIB_HEADERS}
	${PROJECT_BINARY_DIR}/include/wx/setup.h
)

set(_deps)

list(APPEND _deps ${WXBUILD_PORT_LIBRARIES})

target_link_libraries(${LIB_NAME} core wxscintilla ${_deps})
