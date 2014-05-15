set(LIB_NAME adv)

add_definitions(-DWXMAKINGDLL_ADV -DwxUSE_BASE=0 -DWXUSINGDLL)

include_directories(${WXBUILD_PORT_INCLUDE_DIRS})

set(LIB_SRC
	${WXFILES_ADVANCED_SRC}
	${WXFILES_PLUGIN_ADV_SRC}
	${WXFILES_ADVANCED_WIN32_SRC}
)

set(LIB_HEADERS
	${WXFILES_ADVANCED_HDR}
	${WXFILES_ADVANCED_WIN32_HDR}
)

wx_set_pch(LIB_SRC ${WX_SOURCE_DIR}/src/common/dummy.cpp wx/wxprec.h "${WX_SOURCE_DIR}/include/wx/wxprec.h")

wx_set_source_groups()

add_library(${LIB_NAME} SHARED
	${LIB_SRC}
	${LIB_HEADERS}
	${PROJECT_BINARY_DIR}/include/wx/setup.h
)

set(_deps)
if (${WXBUILD_PLATFORM} STREQUAL "win32")
	target_link_libraries(${LIB_NAME} Winmm)
endif ()

list(APPEND _deps ${WXBUILD_PORT_LIBRARIES})

target_link_libraries(${LIB_NAME} base core ${_deps})

