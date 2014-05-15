set(LIB_NAME wxpng)

set(LIB_SRC_DIR ${WX_SOURCE_DIR}/src/png)

include_directories(${WX_SOURCE_DIR}/src/zlib)

set(LIB_SRC
	${LIB_SRC_DIR}/png.c
	${LIB_SRC_DIR}/pngerror.c
	${LIB_SRC_DIR}/pngget.c
	${LIB_SRC_DIR}/pngmem.c
	${LIB_SRC_DIR}/pngpread.c
	${LIB_SRC_DIR}/pngread.c
	${LIB_SRC_DIR}/pngrio.c
	${LIB_SRC_DIR}/pngrtran.c
	${LIB_SRC_DIR}/pngrutil.c
	${LIB_SRC_DIR}/pngset.c
	${LIB_SRC_DIR}/pngtrans.c
	${LIB_SRC_DIR}/pngwio.c
	${LIB_SRC_DIR}/pngwrite.c
	${LIB_SRC_DIR}/pngwtran.c
	${LIB_SRC_DIR}/pngwutil.c
)

add_library(${LIB_NAME} STATIC
	${LIB_SRC}
)
