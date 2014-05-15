set(LIB_NAME core)

if (NOT WXBUILD_SYSTEM_PNG)
	include_directories(${WX_SOURCE_DIR}/src/png)
endif ()
if (NOT WXBUILD_SYSTEM_JPEG)
	include_directories(${WX_SOURCE_DIR}/src/jpeg)
endif ()
if (NOT WXBUILD_SYSTEM_TIFF)
	include_directories(${WX_SOURCE_DIR}/src/tiff/libtiff)
endif ()

include_directories(${WXBUILD_PORT_INCLUDE_DIRS})

add_definitions(-DWXMAKINGDLL_CORE -DwxUSE_BASE=0 -DWXUSINGDLL)

set(LIB_SRC
	${WXFILES_BASE_AND_GUI_SRC}
	${WXFILES_CORE_SRC}
	${WXFILES_BASE_AND_GUI_PLATFORM_SRC}
	${WXFILES_CORE_PLATFORM_SRC}
)

set(LIB_HEADERS
	${WXFILES_ALL_GUI_HEADERS}
)

wx_set_pch(LIB_SRC ${WX_SOURCE_DIR}/src/common/dummy.cpp wx/wxprec.h "${WX_SOURCE_DIR}/include/wx/wxprec.h")

wx_set_source_groups()

add_library(${LIB_NAME} SHARED
	${LIB_SRC}
	${LIB_HEADERS}
	${PROJECT_BINARY_DIR}/include/wx/setup.h
)

set(_deps)

if (NOT WXBUILD_SYSTEM_PNG)
	list(APPEND _deps wxpng)
else ()
	list(APPEND _deps ${PNG_LIBRARIES})
endif ()
if (NOT WXBUILD_SYSTEM_JPEG)
	list(APPEND _deps wxjpeg)
else ()
	list(APPEND _deps ${JPEG_LIBRARIES})
endif ()
if (NOT WXBUILD_SYSTEM_TIFF)
	list(APPEND _deps wxtiff)
else ()
	list(APPEND _deps ${TIFF_LIBRARIES})
endif ()

list(APPEND _deps ${WXBUILD_PORT_LIBRARIES})

target_link_libraries(${LIB_NAME} base ${_deps})


