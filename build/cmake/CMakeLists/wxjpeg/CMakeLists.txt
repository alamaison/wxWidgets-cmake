set(LIB_NAME wxjpeg)

set(LIB_SRC_DIR ${WX_SOURCE_DIR}/src/jpeg)

set(LIB_SRC
	${LIB_SRC_DIR}/jcapimin.c
	${LIB_SRC_DIR}/jcapistd.c
	${LIB_SRC_DIR}/jccoefct.c
	${LIB_SRC_DIR}/jccolor.c
	${LIB_SRC_DIR}/jcdctmgr.c
	${LIB_SRC_DIR}/jchuff.c
	${LIB_SRC_DIR}/jcinit.c
	${LIB_SRC_DIR}/jcmainct.c
	${LIB_SRC_DIR}/jcmarker.c
	${LIB_SRC_DIR}/jcmaster.c
	${LIB_SRC_DIR}/jcomapi.c
	${LIB_SRC_DIR}/jcparam.c
	${LIB_SRC_DIR}/jcphuff.c
	${LIB_SRC_DIR}/jcprepct.c
	${LIB_SRC_DIR}/jcsample.c
	${LIB_SRC_DIR}/jctrans.c
	${LIB_SRC_DIR}/jdapimin.c
	${LIB_SRC_DIR}/jdapistd.c
	${LIB_SRC_DIR}/jdatadst.c
	${LIB_SRC_DIR}/jdatasrc.c
	${LIB_SRC_DIR}/jdcoefct.c
	${LIB_SRC_DIR}/jdcolor.c
	${LIB_SRC_DIR}/jddctmgr.c
	${LIB_SRC_DIR}/jdhuff.c
	${LIB_SRC_DIR}/jdinput.c
	${LIB_SRC_DIR}/jdmainct.c
	${LIB_SRC_DIR}/jdmarker.c
	${LIB_SRC_DIR}/jdmaster.c
	${LIB_SRC_DIR}/jdmerge.c
	${LIB_SRC_DIR}/jdphuff.c
	${LIB_SRC_DIR}/jdpostct.c
	${LIB_SRC_DIR}/jdsample.c
	${LIB_SRC_DIR}/jdtrans.c
	${LIB_SRC_DIR}/jerror.c
	${LIB_SRC_DIR}/jfdctflt.c
	${LIB_SRC_DIR}/jfdctfst.c
	${LIB_SRC_DIR}/jfdctint.c
	${LIB_SRC_DIR}/jidctflt.c
	${LIB_SRC_DIR}/jidctfst.c
	${LIB_SRC_DIR}/jidctint.c
	${LIB_SRC_DIR}/jidctred.c
	${LIB_SRC_DIR}/jmemmgr.c
	${LIB_SRC_DIR}/jmemnobs.c
	${LIB_SRC_DIR}/jquant1.c
	${LIB_SRC_DIR}/jquant2.c
	${LIB_SRC_DIR}/jutils.c
)

add_library(${LIB_NAME} STATIC
	${LIB_SRC}
)

