set(LIB_NAME gl)

add_definitions(-DwxUSE_BASE=0)

if(WXBUILD_SHARED_LIBS)
  add_definitions(-DWXMAKINGDLL_GL -DWXUSINGDLL)
endif()

include_directories(${WXBUILD_PORT_INCLUDE_DIRS})

set(LIB_SRC
	${WXFILES_OPENGL_SRC}
)

set(LIB_HEADERS
	${WXFILES_OPENGL_HDR}
)

wx_set_pch(LIB_SRC ${WX_SOURCE_DIR}/src/common/dummy.cpp wx/wxprec.h "${WX_SOURCE_DIR}/include/wx/wxprec.h")

wx_set_source_groups()

add_library(${LIB_NAME} ${WXBUILD_SHARED_OR_STATIC}
	${LIB_SRC}
	${LIB_HEADERS}
	${PROJECT_BINARY_DIR}/include/wx/setup.h
)

set(_deps)

if (${WXBUILD_PORT} STREQUAL "msw")
	list(APPEND _deps opengl32 glu32)
else ()
	list(APPEND _deps GL GLU)
endif ()

list(APPEND _deps ${WXBUILD_PORT_LIBRARIES})

target_link_libraries(${LIB_NAME} core ${_deps})
