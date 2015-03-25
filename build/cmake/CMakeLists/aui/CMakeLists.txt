set(LIB_NAME aui)

add_definitions(-DwxUSE_BASE=0)

if(WXBUILD_SHARED_LIBS)
  add_definitions(-DWXMAKINGDLL_AUI -DWXUSINGDLL)
endif()

include_directories(${WXBUILD_PORT_INCLUDE_DIRS})

set(LIB_SRC
	${WXFILES_AUI_SRC}
)

set(LIB_HEADERS
	${WXFILES_AUI_HDR}
)

wx_set_pch(LIB_SRC ${WX_SOURCE_DIR}/src/common/dummy.cpp wx/wxprec.h "${WX_SOURCE_DIR}/include/wx/wxprec.h")

wx_set_source_groups()

add_library(${LIB_NAME} ${WXBUILD_SHARED_OR_STATIC}
	${LIB_SRC}
	${LIB_HEADERS}
	${PROJECT_BINARY_DIR}/include/wx/setup.h
)

set(_deps)

list(APPEND _deps ${WXBUILD_PORT_LIBRARIES})

target_link_libraries(${LIB_NAME} core ${_deps})
