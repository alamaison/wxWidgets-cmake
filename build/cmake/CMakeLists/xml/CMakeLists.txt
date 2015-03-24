set(LIB_NAME xml)

add_definitions(-DwxUSE_BASE=0)

if(BUILD_SHARED_LIBS)
  add_definitions(-DWXMAKINGDLL_XML -DWXUSINGDLL)
endif()

if (NOT WXBUILD_SYSTEM_EXPAT)
    include_directories(${WXBUILD_PORT_INCLUDE_DIRS} ${WX_SOURCE_DIR}/src/expat/lib)
else ()
    include_directories(${WXBUILD_PORT_INCLUDE_DIRS} ${EXPAT_INCLUDE_DIRS})
endif ()

set(LIB_SRC
	${WXFILES_XML_SRC}
)

set(LIB_HEADERS
	${WXFILES_XML_HDR}
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
if (NOT WXBUILD_SYSTEM_EXPAT)
	list(APPEND _deps expat)
else ()
	list(APPEND _deps ${EXPAT_LIBRARIES})
endif ()

target_link_libraries(${LIB_NAME} core ${_deps})
