set(LIB_NAME wxtiff)

set(LIB_SRC_DIR "${WX_SOURCE_DIR}/src/tiff/libtiff")

include_directories(${LIB_SRC_DIR} ${WX_SOURCE_DIR}/src/zlib ${WX_SOURCE_DIR}/src/jpeg)

set(LIB_SRC
	${LIB_SRC_DIR}/tif_aux.c
	${LIB_SRC_DIR}/tif_close.c
	${LIB_SRC_DIR}/tif_codec.c
	${LIB_SRC_DIR}/tif_color.c
	${LIB_SRC_DIR}/tif_compress.c
	${LIB_SRC_DIR}/tif_dir.c
	${LIB_SRC_DIR}/tif_dirinfo.c
	${LIB_SRC_DIR}/tif_dirread.c
	${LIB_SRC_DIR}/tif_dirwrite.c
	${LIB_SRC_DIR}/tif_dumpmode.c
	${LIB_SRC_DIR}/tif_error.c
	${LIB_SRC_DIR}/tif_extension.c
	${LIB_SRC_DIR}/tif_fax3.c
	${LIB_SRC_DIR}/tif_fax3sm.c
	${LIB_SRC_DIR}/tif_flush.c
	${LIB_SRC_DIR}/tif_getimage.c
	${LIB_SRC_DIR}/tif_jbig.c
	${LIB_SRC_DIR}/tif_jpeg.c
	${LIB_SRC_DIR}/tif_jpeg_12.c
	${LIB_SRC_DIR}/tif_luv.c
	${LIB_SRC_DIR}/tif_lzma.c
	${LIB_SRC_DIR}/tif_lzw.c
	${LIB_SRC_DIR}/tif_next.c
	${LIB_SRC_DIR}/tif_ojpeg.c
	${LIB_SRC_DIR}/tif_open.c
	${LIB_SRC_DIR}/tif_packbits.c
	${LIB_SRC_DIR}/tif_pixarlog.c
	${LIB_SRC_DIR}/tif_predict.c
	${LIB_SRC_DIR}/tif_print.c
	${LIB_SRC_DIR}/tif_read.c
	${LIB_SRC_DIR}/tif_strip.c
	${LIB_SRC_DIR}/tif_swab.c
	${LIB_SRC_DIR}/tif_thunder.c
	${LIB_SRC_DIR}/tif_tile.c
	${LIB_SRC_DIR}/tif_version.c
	${LIB_SRC_DIR}/tif_warning.c
	${LIB_SRC_DIR}/tif_win32.c
	${LIB_SRC_DIR}/tif_write.c
	${LIB_SRC_DIR}/tif_zip.c
)

add_library(${LIB_NAME} STATIC
	${LIB_SRC}
)

