set(LIB_NAME wxzlib)
set(LIB_SRC_DIR "${WX_SOURCE_DIR}/src/zlib")

set(LIB_SRC
	${LIB_SRC_DIR}/adler32.c
	${LIB_SRC_DIR}/compress.c
	${LIB_SRC_DIR}/crc32.c
	${LIB_SRC_DIR}/deflate.c
	${LIB_SRC_DIR}/gzclose.c
	${LIB_SRC_DIR}/gzlib.c
	${LIB_SRC_DIR}/gzread.c
	${LIB_SRC_DIR}/gzwrite.c
	${LIB_SRC_DIR}/infback.c
	${LIB_SRC_DIR}/inffast.c
	${LIB_SRC_DIR}/inflate.c
	${LIB_SRC_DIR}/inftrees.c
	${LIB_SRC_DIR}/trees.c
	${LIB_SRC_DIR}/uncompr.c
	${LIB_SRC_DIR}/zutil.c
)

add_library(${LIB_NAME} STATIC
	${LIB_SRC}
)

