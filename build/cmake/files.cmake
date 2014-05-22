# Preliminary definitions
set(SRC ${WX_SOURCE_DIR})
set(HDR ${WX_SOURCE_DIR}/include)

# BASE_UNIX_AND_DARWIN_SRC
set(WXFILES_BASE_UNIX_AND_DARWIN_SRC
	${SRC}/src/common/fdiodispatcher.cpp
	${SRC}/src/common/selectdispatcher.cpp
	${SRC}/src/unix/appunix.cpp
	${SRC}/src/unix/dir.cpp
	${SRC}/src/unix/dlunix.cpp
	${SRC}/src/unix/epolldispatcher.cpp
	${SRC}/src/unix/evtloopunix.cpp
	${SRC}/src/unix/fdiounix.cpp
	${SRC}/src/unix/snglinst.cpp
	${SRC}/src/unix/stackwalk.cpp
	${SRC}/src/unix/stdpaths.cpp
	${SRC}/src/unix/timerunx.cpp
	${SRC}/src/unix/threadpsx.cpp
	${SRC}/src/unix/utilsunx.cpp
	${SRC}/src/unix/wakeuppipe.cpp
	${SRC}/src/unix/fswatcher_kqueue.cpp
)

# BASE_UNIX_AND_DARWIN_HDR
set(WXFILES_BASE_UNIX_AND_DARWIN_HDR
	${HDR}/wx/unix/app.h
	${HDR}/wx/unix/apptbase.h
	${HDR}/wx/unix/apptrait.h
	${HDR}/wx/unix/chkconf.h
	${HDR}/wx/unix/evtloop.h
	${HDR}/wx/unix/evtloopsrc.h
	${HDR}/wx/unix/pipe.h
	${HDR}/wx/unix/stdpaths.h
	${HDR}/wx/unix/stackwalk.h
	${HDR}/wx/unix/tls.h
	${HDR}/wx/unix/fswatcher_kqueue.h
)

# BASE_UNIX_AND_DARWIN_NOTWXMAC_SRC
set(WXFILES_BASE_UNIX_AND_DARWIN_NOTWXMAC_SRC
	${WXFILES_BASE_UNIX_AND_DARWIN_SRC}
	${SRC}/src/unix/mimetype.cpp
)

# BASE_UNIX_AND_DARWIN_NOTWXMAC_HDR
set(WXFILES_BASE_UNIX_AND_DARWIN_NOTWXMAC_HDR
	${WXFILES_BASE_UNIX_AND_DARWIN_HDR}
	${HDR}/wx/unix/execute.h
	${HDR}/wx/unix/mimetype.h
)

# BASE_UNIX_SRC
set(WXFILES_BASE_UNIX_SRC
	${WXFILES_BASE_UNIX_AND_DARWIN_NOTWXMAC_SRC}
	${SRC}/src/unix/fswatcher_inotify.cpp
)

# BASE_UNIX_HDR
set(WXFILES_BASE_UNIX_HDR
	${WXFILES_BASE_UNIX_AND_DARWIN_NOTWXMAC_HDR}
	${HDR}/wx/unix/fswatcher_inotify.h
)

# BASE_WIN32_SRC
set(WXFILES_BASE_WIN32_SRC
	${SRC}/src/msw/basemsw.cpp
	${SRC}/src/msw/crashrpt.cpp
	${SRC}/src/msw/debughlp.cpp
	${SRC}/src/msw/dde.cpp
	${SRC}/src/msw/dir.cpp
	${SRC}/src/msw/dlmsw.cpp
	${SRC}/src/msw/evtloopconsole.cpp
	${SRC}/src/msw/mimetype.cpp
	${SRC}/src/msw/power.cpp
	${SRC}/src/msw/regconf.cpp
	${SRC}/src/msw/registry.cpp
	${SRC}/src/msw/snglinst.cpp
	${SRC}/src/msw/stackwalk.cpp
	${SRC}/src/msw/stdpaths.cpp
	${SRC}/src/msw/thread.cpp
	${SRC}/src/msw/timer.cpp
	${SRC}/src/msw/utils.cpp
	${SRC}/src/msw/utilsexc.cpp
	${SRC}/src/msw/fswatcher.cpp
)

# BASE_AND_GUI_WIN32_SRC
set(WXFILES_BASE_AND_GUI_WIN32_SRC
	${SRC}/src/msw/main.cpp
#	${SRC}/src/msw/mslu.cpp - not found
	${SRC}/src/msw/volume.cpp
)

# BASE_WINCE_SRC
set(WXFILES_BASE_WINCE_SRC
)
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_BASE_WINCE_SRC
			${SRC}/src/msw/wince/time.cpp
		)
	endif ()

# BASE_WIN32_HDR
set(WXFILES_BASE_WIN32_HDR
	${HDR}/wx/msw/apptrait.h
	${HDR}/wx/msw/apptbase.h
	${HDR}/wx/msw/chkconf.h
	${HDR}/wx/msw/crashrpt.h
	${HDR}/wx/msw/dde.h
	${HDR}/wx/msw/debughlp.h
	${HDR}/wx/msw/evtloopconsole.h
	${HDR}/wx/msw/gccpriv.h
	${HDR}/wx/msw/libraries.h
	${HDR}/wx/msw/mimetype.h
#	${HDR}/wx/msw/mslu.h - not found
	${HDR}/wx/msw/private.h
	${HDR}/wx/msw/regconf.h
	${HDR}/wx/msw/registry.h
	${HDR}/wx/msw/seh.h
	${HDR}/wx/msw/stackwalk.h
	${HDR}/wx/msw/stdpaths.h
	${HDR}/wx/msw/winundef.h
	${HDR}/wx/msw/wrapcctl.h
	${HDR}/wx/msw/wrapcdlg.h
	${HDR}/wx/msw/wrapwin.h
	${HDR}/wx/msw/fswatcher.h
)

# BASE_WINCE_HDR
set(WXFILES_BASE_WINCE_HDR
)
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_BASE_WINCE_HDR
			${HDR}/wx/msw/wince/time.h
			${HDR}/wx/msw/wince/chkconf.h
		)
	endif ()

# BASE_COREFOUNDATION_SRC
set(WXFILES_BASE_COREFOUNDATION_SRC
	${SRC}/src/osx/core/cfstring.cpp
	${SRC}/src/osx/core/evtloop_cf.cpp
	${SRC}/src/osx/core/stdpaths_cf.cpp
	${SRC}/src/osx/core/strconv_cf.cpp
	${SRC}/src/osx/core/utilsexc_base.cpp
)

# BASE_COREFOUNDATION_HDR
set(WXFILES_BASE_COREFOUNDATION_HDR
	${HDR}/wx/osx/core/cfdataref.h
	${HDR}/wx/osx/core/cfref.h
	${HDR}/wx/osx/core/cfstring.h
	${HDR}/wx/osx/core/hid.h
	${HDR}/wx/osx/core/evtloop.h
	${HDR}/wx/osx/core/objcid.h
	${HDR}/wx/osx/core/private.h
	${HDR}/wx/osx/core/stdpaths.h
)

# BASE_OSX_SHARED_SRC
set(WXFILES_BASE_OSX_SHARED_SRC
	${SRC}/src/osx/core/mimetype.cpp
	${WXFILES_BASE_COREFOUNDATION_SRC}
	${WXFILES_BASE_UNIX_AND_DARWIN_SRC}
)

# BASE_OSX_SHARED_HDR
set(WXFILES_BASE_OSX_SHARED_HDR
	${WXFILES_BASE_COREFOUNDATION_HDR}
	${WXFILES_BASE_UNIX_AND_DARWIN_HDR}
)

# BASE_AND_GUI_OSX_CARBON_SRC
set(WXFILES_BASE_AND_GUI_OSX_CARBON_SRC
	${SRC}/src/osx/carbon/utils.cpp
	${SRC}/src/osx/carbon/uma.cpp
)

# BASE_AND_GUI_OSX_COCOA_SRC
set(WXFILES_BASE_AND_GUI_OSX_COCOA_SRC
	${SRC}/src/osx/cocoa/utils.mm
)

# BASE_AND_GUI_OSX_IPHONE_SRC
set(WXFILES_BASE_AND_GUI_OSX_IPHONE_SRC
	${SRC}/src/osx/iphone/utils.mm
)

# BASE_OSX_NOTWXMAC_SRC
set(WXFILES_BASE_OSX_NOTWXMAC_SRC
	${WXFILES_BASE_UNIX_AND_DARWIN_NOTWXMAC_SRC}
	${WXFILES_BASE_COREFOUNDATION_SRC}
)

# BASE_OSX_NOTWXMAC_HDR
set(WXFILES_BASE_OSX_NOTWXMAC_HDR
	${WXFILES_BASE_UNIX_AND_DARWIN_NOTWXMAC_HDR}
	${WXFILES_BASE_COREFOUNDATION_HDR}
)

# BASE_OS2_SRC
set(WXFILES_BASE_OS2_SRC
	${SRC}/src/common/fdiodispatcher.cpp
	${SRC}/src/common/selectdispatcher.cpp
	${SRC}/src/unix/appunix.cpp
	${SRC}/src/unix/evtloopunix.cpp
	${SRC}/src/unix/timerunx.cpp
	${SRC}/src/os2/dir.cpp
	${SRC}/src/os2/mimetype.cpp
	${SRC}/src/os2/snglinst.cpp
	${SRC}/src/os2/stdpaths.cpp
	${SRC}/src/os2/thread.cpp
	${SRC}/src/os2/utils.cpp
	${SRC}/src/os2/utilsexc.cpp
)

# BASE_AND_GUI_OS2_SRC
set(WXFILES_BASE_AND_GUI_OS2_SRC
)

# BASE_OS2_HDR
set(WXFILES_BASE_OS2_HDR
	${HDR}/wx/unix/app.h
	${HDR}/wx/os2/apptbase.h
	${HDR}/wx/os2/apptrait.h
	${HDR}/wx/unix/evtloop.h
	${HDR}/wx/os2/mimetype.h
	${HDR}/wx/os2/private.h
	${HDR}/wx/os2/stdpaths.h
	${HDR}/wx/os2/chkconf.h
	${HDR}/wx/os2/wxrsc.h
)

# BASE_MSDOS_SRC
set(WXFILES_BASE_MSDOS_SRC
	${SRC}/src/msdos/dir.cpp
	${SRC}/src/msdos/mimetype.cpp
	${SRC}/src/msdos/utilsdos.cpp
)

# BASE_AND_GUI_MSDOS_SRC
set(WXFILES_BASE_AND_GUI_MSDOS_SRC
)

# BASE_MSDOS_HDR
set(WXFILES_BASE_MSDOS_HDR
	${HDR}/wx/msdos/mimetype.h
)

# BASE_CMN_SRC
set(WXFILES_BASE_CMN_SRC
	${SRC}/src/common/any.cpp
	${SRC}/src/common/appbase.cpp
	${SRC}/src/common/arcall.cpp
	${SRC}/src/common/arcfind.cpp
	${SRC}/src/common/archive.cpp
	${SRC}/src/common/arrstr.cpp
	${SRC}/src/common/base64.cpp
	${SRC}/src/common/clntdata.cpp
	${SRC}/src/common/cmdline.cpp
	${SRC}/src/common/config.cpp
	${SRC}/src/common/convauto.cpp
	${SRC}/src/common/datetime.cpp
	${SRC}/src/common/datetimefmt.cpp
	${SRC}/src/common/datstrm.cpp
	${SRC}/src/common/dircmn.cpp
	${SRC}/src/common/dynarray.cpp
	${SRC}/src/common/dynlib.cpp
	${SRC}/src/common/dynload.cpp
	${SRC}/src/common/encconv.cpp
	${SRC}/src/common/evtloopcmn.cpp
	${SRC}/src/common/extended.c
	${SRC}/src/common/ffile.cpp
	${SRC}/src/common/file.cpp
	${SRC}/src/common/fileback.cpp
	${SRC}/src/common/fileconf.cpp
	${SRC}/src/common/filefn.cpp
	${SRC}/src/common/filename.cpp
	${SRC}/src/common/filesys.cpp
	${SRC}/src/common/filtall.cpp
	${SRC}/src/common/filtfind.cpp
	${SRC}/src/common/fmapbase.cpp
	${SRC}/src/common/fs_arc.cpp
	${SRC}/src/common/fs_filter.cpp
	${SRC}/src/common/hash.cpp
	${SRC}/src/common/hashmap.cpp
	${SRC}/src/common/init.cpp
	${SRC}/src/common/intl.cpp
	${SRC}/src/common/ipcbase.cpp
	${SRC}/src/common/languageinfo.cpp
	${SRC}/src/common/list.cpp
	${SRC}/src/common/log.cpp
	${SRC}/src/common/longlong.cpp
	${SRC}/src/common/memory.cpp
	${SRC}/src/common/mimecmn.cpp
	${SRC}/src/common/module.cpp
	${SRC}/src/common/mstream.cpp
	${SRC}/src/common/numformatter.cpp
	${SRC}/src/common/object.cpp
	${SRC}/src/common/platinfo.cpp
	${SRC}/src/common/powercmn.cpp
	${SRC}/src/common/process.cpp
	${SRC}/src/common/regex.cpp
	${SRC}/src/common/stdpbase.cpp
	${SRC}/src/common/sstream.cpp
	${SRC}/src/common/stdstream.cpp
	${SRC}/src/common/stopwatch.cpp
	${SRC}/src/common/strconv.cpp
	${SRC}/src/common/stream.cpp
	${SRC}/src/common/string.cpp
	${SRC}/src/common/stringimpl.cpp
	${SRC}/src/common/stringops.cpp
	${SRC}/src/common/strvararg.cpp
	${SRC}/src/common/sysopt.cpp
	${SRC}/src/common/tarstrm.cpp
	${SRC}/src/common/textbuf.cpp
	${SRC}/src/common/textfile.cpp
	${SRC}/src/common/threadinfo.cpp
	${SRC}/src/common/time.cpp
	${SRC}/src/common/timercmn.cpp
	${SRC}/src/common/timerimpl.cpp
	${SRC}/src/common/tokenzr.cpp
	${SRC}/src/common/translation.cpp
	${SRC}/src/common/txtstrm.cpp
	${SRC}/src/common/unichar.cpp
	${SRC}/src/common/uri.cpp
	${SRC}/src/common/ustring.cpp
	${SRC}/src/common/variant.cpp
	${SRC}/src/common/wfstream.cpp
	${SRC}/src/common/wxcrt.cpp
	${SRC}/src/common/wxprintf.cpp
	${SRC}/src/common/xlocale.cpp
	${SRC}/src/common/xti.cpp
	${SRC}/src/common/xtistrm.cpp
	${SRC}/src/common/zipstrm.cpp
	${SRC}/src/common/zstream.cpp
	${SRC}/src/common/fswatchercmn.cpp
	${SRC}/src/generic/fswatcherg.cpp
)

# BASE_AND_GUI_CMN_SRC
set(WXFILES_BASE_AND_GUI_CMN_SRC
	${SRC}/src/common/event.cpp
	${SRC}/src/common/fs_mem.cpp
	${SRC}/src/common/msgout.cpp
	${SRC}/src/common/utilscmn.cpp
)

# BASE_CMN_HDR
set(WXFILES_BASE_CMN_HDR
	${HDR}/wx/afterstd.h
	${HDR}/wx/any.h
	${HDR}/wx/anystr.h
	${HDR}/wx/app.h
	${HDR}/wx/apptrait.h
	${HDR}/wx/archive.h
	${HDR}/wx/arrimpl.cpp
	${HDR}/wx/arrstr.h
	${HDR}/wx/atomic.h
	${HDR}/wx/base64.h
	${HDR}/wx/beforestd.h
	${HDR}/wx/buffer.h
	${HDR}/wx/build.h
	${HDR}/wx/chartype.h
	${HDR}/wx/checkeddelete.h
	${HDR}/wx/chkconf.h
	${HDR}/wx/clntdata.h
	${HDR}/wx/cmdargs.h
	${HDR}/wx/cmdline.h
	${HDR}/wx/compiler.h
	${HDR}/wx/confbase.h
	${HDR}/wx/config.h
	${HDR}/wx/convauto.h
	${HDR}/wx/containr.h
	${HDR}/wx/cpp.h
	${HDR}/wx/crt.h
	${HDR}/wx/datetime.h
	${HDR}/wx/datstrm.h
	${HDR}/wx/dde.h
	${HDR}/wx/debug.h
	${HDR}/wx/defs.h
	${HDR}/wx/dir.h
	${HDR}/wx/dlimpexp.h
	${HDR}/wx/dlist.h
	${HDR}/wx/dynarray.h
	${HDR}/wx/dynlib.h
	${HDR}/wx/dynload.h
	${HDR}/wx/encconv.h
	${HDR}/wx/event.h
	${HDR}/wx/eventfilter.h
	${HDR}/wx/evtloop.h
	${HDR}/wx/except.h
	${HDR}/wx/features.h
	${HDR}/wx/flags.h
	${HDR}/wx/ffile.h
	${HDR}/wx/file.h
	${HDR}/wx/fileconf.h
	${HDR}/wx/filefn.h
	${HDR}/wx/filename.h
	${HDR}/wx/filesys.h
	${HDR}/wx/fontenc.h
	${HDR}/wx/fontmap.h
	${HDR}/wx/fs_arc.h
	${HDR}/wx/fs_filter.h
	${HDR}/wx/fs_mem.h
	${HDR}/wx/fs_zip.h
	${HDR}/wx/hash.h
	${HDR}/wx/hashmap.h
	${HDR}/wx/hashset.h
	${HDR}/wx/html/forcelnk.h
	${HDR}/wx/iconloc.h
	${HDR}/wx/init.h
	${HDR}/wx/intl.h
	${HDR}/wx/iosfwrap.h
	${HDR}/wx/ioswrap.h
	${HDR}/wx/ipc.h
	${HDR}/wx/ipcbase.h
	${HDR}/wx/kbdstate.h
	${HDR}/wx/language.h
	${HDR}/wx/link.h
	${HDR}/wx/list.h
	${HDR}/wx/listimpl.cpp
	${HDR}/wx/log.h
	${HDR}/wx/longlong.h
	${HDR}/wx/math.h
	${HDR}/wx/memconf.h
	${HDR}/wx/memory.h
	${HDR}/wx/memtext.h
	${HDR}/wx/mimetype.h
	${HDR}/wx/module.h
	${HDR}/wx/mousestate.h
	${HDR}/wx/msgout.h
	${HDR}/wx/msgqueue.h
	${HDR}/wx/mstream.h
	${HDR}/wx/numformatter.h
	${HDR}/wx/object.h
	${HDR}/wx/platform.h
	${HDR}/wx/platinfo.h
	${HDR}/wx/power.h
	${HDR}/wx/process.h
	${HDR}/wx/ptr_scpd.h
	${HDR}/wx/ptr_shrd.h
	${HDR}/wx/recguard.h
	${HDR}/wx/regex.h
	${HDR}/wx/rtti.h
	${HDR}/wx/scopedarray.h
	${HDR}/wx/scopedptr.h
	${HDR}/wx/scopeguard.h
	${HDR}/wx/sharedptr.h
	${HDR}/wx/snglinst.h
	${HDR}/wx/sstream.h
	${HDR}/wx/stack.h
	${HDR}/wx/stackwalk.h
	${HDR}/wx/stdpaths.h
	${HDR}/wx/stdstream.h
	${HDR}/wx/stockitem.h
	${HDR}/wx/stopwatch.h
	${HDR}/wx/strconv.h
	${HDR}/wx/stream.h
	${HDR}/wx/string.h
	${HDR}/wx/stringimpl.h
	${HDR}/wx/stringops.h
	${HDR}/wx/strvararg.h
	${HDR}/wx/sysopt.h
	${HDR}/wx/tarstrm.h
	${HDR}/wx/textbuf.h
	${HDR}/wx/textfile.h
	${HDR}/wx/thread.h
	${HDR}/wx/thrimpl.cpp
	${HDR}/wx/time.h
	${HDR}/wx/timer.h
	${HDR}/wx/tls.h
	${HDR}/wx/tokenzr.h
	${HDR}/wx/tracker.h
	${HDR}/wx/translation.h
	${HDR}/wx/txtstrm.h
	${HDR}/wx/typeinfo.h
	${HDR}/wx/types.h
	${HDR}/wx/unichar.h
	${HDR}/wx/uri.h
	${HDR}/wx/ustring.h
	${HDR}/wx/utils.h
	${HDR}/wx/variant.h
	${HDR}/wx/vector.h
	${HDR}/wx/version.h
	${HDR}/wx/versioninfo.h
	${HDR}/wx/volume.h
	${HDR}/wx/weakref.h
	${HDR}/wx/wfstream.h
	${HDR}/wx/wx.h
	${HDR}/wx/wxchar.h
	${HDR}/wx/wxcrt.h
	${HDR}/wx/wxcrtbase.h
	${HDR}/wx/wxcrtvararg.h
	${HDR}/wx/wxprec.h
	${HDR}/wx/xlocale.h
	${HDR}/wx/xti.h
	${HDR}/wx/xti2.h
	${HDR}/wx/xtistrm.h
	${HDR}/wx/xtictor.h
	${HDR}/wx/xtihandler.h
	${HDR}/wx/xtiprop.h
	${HDR}/wx/xtitypes.h
	${HDR}/wx/zipstrm.h
	${HDR}/wx/zstream.h
	${HDR}/wx/meta/convertible.h
	${HDR}/wx/meta/if.h
	${HDR}/wx/meta/implicitconversion.h
	${HDR}/wx/meta/int2type.h
	${HDR}/wx/meta/movable.h
	${HDR}/wx/meta/pod.h
	${HDR}/wx/meta/removeref.h
	${HDR}/wx/fswatcher.h
	${HDR}/wx/generic/fswatcher.h
)

# NET_UNIX_SRC
set(WXFILES_NET_UNIX_SRC
	${SRC}/src/common/socketiohandler.cpp
	${SRC}/src/unix/sockunix.cpp
)

# NET_OSX_SRC
set(WXFILES_NET_OSX_SRC
	${SRC}/src/osx/core/sockosx.cpp
)

# NET_WIN32_SRC
set(WXFILES_NET_WIN32_SRC
	${SRC}/src/msw/sockmsw.cpp
	${SRC}/src/msw/urlmsw.cpp
)

# NET_WIN32_HDR
set(WXFILES_NET_WIN32_HDR
)

# NET_WINCE_SRC
set(WXFILES_NET_WINCE_SRC
)
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_NET_WINCE_SRC
			${SRC}/src/msw/wince/net.cpp
		)
	endif ()

# NET_WINCE_HDR
set(WXFILES_NET_WINCE_HDR
)
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_NET_WINCE_HDR
			${HDR}/wx/msw/wince/net.h
		)
	endif ()

# NET_OS2_SRC
set(WXFILES_NET_OS2_SRC
	${SRC}/src/unix/sockunix.cpp
)

# NET_CMN_SRC
set(WXFILES_NET_CMN_SRC
	${SRC}/src/common/fs_inet.cpp
	${SRC}/src/common/ftp.cpp
	${SRC}/src/common/http.cpp
	${SRC}/src/common/protocol.cpp
	${SRC}/src/common/sckaddr.cpp
	${SRC}/src/common/sckfile.cpp
	${SRC}/src/common/sckipc.cpp
	${SRC}/src/common/sckstrm.cpp
	${SRC}/src/common/socket.cpp
	${SRC}/src/common/url.cpp
)

# NET_CMN_HDR
set(WXFILES_NET_CMN_HDR
	${HDR}/wx/fs_inet.h
	${HDR}/wx/protocol/file.h
	${HDR}/wx/protocol/ftp.h
	${HDR}/wx/protocol/http.h
	${HDR}/wx/protocol/log.h
	${HDR}/wx/protocol/protocol.h
	${HDR}/wx/sckaddr.h
	${HDR}/wx/sckipc.h
	${HDR}/wx/sckstrm.h
	${HDR}/wx/socket.h
	${HDR}/wx/url.h
)

# QA_SRC
set(WXFILES_QA_SRC
	${SRC}/src/common/debugrpt.cpp
	${SRC}/src/generic/dbgrptg.cpp
)

# QA_HDR
set(WXFILES_QA_HDR
	${HDR}/wx/debugrpt.h
)

# GUI_CMN_SRC
set(WXFILES_GUI_CMN_SRC
	${SRC}/src/common/accelcmn.cpp
	${SRC}/src/common/accesscmn.cpp
	${SRC}/src/common/anidecod.cpp
	${SRC}/src/common/affinematrix2d.cpp
	${SRC}/src/common/appcmn.cpp
	${SRC}/src/common/artprov.cpp
	${SRC}/src/common/artstd.cpp
	${SRC}/src/common/arttango.cpp
	${SRC}/src/common/bmpbase.cpp
	${SRC}/src/common/bmpbtncmn.cpp
	${SRC}/src/common/bookctrl.cpp
	${SRC}/src/common/btncmn.cpp
	${SRC}/src/common/cairo.cpp
	${SRC}/src/common/checkboxcmn.cpp
	${SRC}/src/common/checklstcmn.cpp
	${SRC}/src/common/choiccmn.cpp
	${SRC}/src/common/clipcmn.cpp
	${SRC}/src/common/clrpickercmn.cpp
	${SRC}/src/common/colourcmn.cpp
	${SRC}/src/common/colourdata.cpp
	${SRC}/src/common/combocmn.cpp
	${SRC}/src/common/cmdproc.cpp
	${SRC}/src/common/cmndata.cpp
	${SRC}/src/common/containr.cpp
	${SRC}/src/common/cshelp.cpp
	${SRC}/src/common/ctrlcmn.cpp
	${SRC}/src/common/ctrlsub.cpp
	${SRC}/src/common/dcbase.cpp
	${SRC}/src/common/dcbufcmn.cpp
	${SRC}/src/common/dcgraph.cpp
	${SRC}/src/common/dcsvg.cpp
	${SRC}/src/common/dirctrlcmn.cpp
	${SRC}/src/common/dlgcmn.cpp
	${SRC}/src/common/dndcmn.cpp
	${SRC}/src/common/dobjcmn.cpp
	${SRC}/src/common/docmdi.cpp
	${SRC}/src/common/docview.cpp
	${SRC}/src/common/dpycmn.cpp
	${SRC}/src/common/dseldlg.cpp
	${SRC}/src/common/effects.cpp
	${SRC}/src/common/fddlgcmn.cpp
	${SRC}/src/common/filectrlcmn.cpp
	${SRC}/src/common/filehistorycmn.cpp
	${SRC}/src/common/filepickercmn.cpp
	${SRC}/src/common/fontpickercmn.cpp
	${SRC}/src/common/fldlgcmn.cpp
	${SRC}/src/common/fontcmn.cpp
	${SRC}/src/common/fontdata.cpp
	${SRC}/src/generic/graphicc.cpp
	${SRC}/src/common/fontenumcmn.cpp
	${SRC}/src/common/fontmap.cpp
	${SRC}/src/common/fontutilcmn.cpp
	${SRC}/src/common/framecmn.cpp
	${SRC}/src/common/gaugecmn.cpp
	${SRC}/src/common/gbsizer.cpp
	${SRC}/src/common/gdicmn.cpp
	${SRC}/src/common/geometry.cpp
	${SRC}/src/common/gifdecod.cpp
	${SRC}/src/common/graphcmn.cpp
	${SRC}/src/common/headercolcmn.cpp
	${SRC}/src/common/headerctrlcmn.cpp
	${SRC}/src/common/helpbase.cpp
	${SRC}/src/common/iconbndl.cpp
	${SRC}/src/common/imagall.cpp
	${SRC}/src/common/imagbmp.cpp
	${SRC}/src/common/image.cpp
	${SRC}/src/common/imagfill.cpp
	${SRC}/src/common/imaggif.cpp
	${SRC}/src/common/imagiff.cpp
	${SRC}/src/common/imagjpeg.cpp
	${SRC}/src/common/imagpcx.cpp
	${SRC}/src/common/imagpng.cpp
	${SRC}/src/common/imagpnm.cpp
	${SRC}/src/common/imagtga.cpp
	${SRC}/src/common/imagtiff.cpp
	${SRC}/src/common/imagxpm.cpp
	${SRC}/src/common/layout.cpp
	${SRC}/src/common/lboxcmn.cpp
	${SRC}/src/common/listctrlcmn.cpp
	${SRC}/src/common/markupparser.cpp
	${SRC}/src/common/matrix.cpp
	${SRC}/src/common/menucmn.cpp
	${SRC}/src/common/modalhook.cpp
	${SRC}/src/common/mousemanager.cpp
	${SRC}/src/common/nbkbase.cpp
	${SRC}/src/common/overlaycmn.cpp
	${SRC}/src/common/ownerdrwcmn.cpp
	${SRC}/src/common/paper.cpp
	${SRC}/src/common/panelcmn.cpp
	${SRC}/src/common/persist.cpp
	${SRC}/src/common/pickerbase.cpp
	${SRC}/src/common/popupcmn.cpp
	${SRC}/src/common/preferencescmn.cpp
	${SRC}/src/common/prntbase.cpp
	${SRC}/src/common/quantize.cpp
	${SRC}/src/common/radiobtncmn.cpp
	${SRC}/src/common/radiocmn.cpp
	${SRC}/src/common/rearrangectrl.cpp
	${SRC}/src/common/rendcmn.cpp
	${SRC}/src/common/rgncmn.cpp
	${SRC}/src/common/scrolbarcmn.cpp
	${SRC}/src/common/settcmn.cpp
	${SRC}/src/common/sizer.cpp
	${SRC}/src/common/slidercmn.cpp
	${SRC}/src/common/spinbtncmn.cpp
	${SRC}/src/common/spinctrlcmn.cpp
	${SRC}/src/common/srchcmn.cpp
	${SRC}/src/common/statbar.cpp
	${SRC}/src/common/statbmpcmn.cpp
	${SRC}/src/common/statboxcmn.cpp
	${SRC}/src/common/statlinecmn.cpp
	${SRC}/src/common/stattextcmn.cpp
	${SRC}/src/common/stockitem.cpp
	${SRC}/src/common/tbarbase.cpp
	${SRC}/src/common/textcmn.cpp
	${SRC}/src/common/textentrycmn.cpp
	${SRC}/src/common/textmeasurecmn.cpp
	${SRC}/src/common/toplvcmn.cpp
	${SRC}/src/common/treebase.cpp
	${SRC}/src/common/uiactioncmn.cpp
	${SRC}/src/common/valgen.cpp
	${SRC}/src/common/validate.cpp
	${SRC}/src/common/valtext.cpp
	${SRC}/src/common/valnum.cpp
	${SRC}/src/common/wincmn.cpp
	${SRC}/src/common/windowid.cpp
	${SRC}/src/common/wrapsizer.cpp
	${SRC}/src/common/xpmdecod.cpp
	${SRC}/src/generic/busyinfo.cpp
	${SRC}/src/generic/buttonbar.cpp
	${SRC}/src/generic/choicdgg.cpp
	${SRC}/src/generic/choicbkg.cpp
	${SRC}/src/generic/combog.cpp
	${SRC}/src/generic/dcpsg.cpp
	${SRC}/src/generic/dirctrlg.cpp
	${SRC}/src/generic/dragimgg.cpp
	${SRC}/src/generic/filectrlg.cpp
	${SRC}/src/generic/headerctrlg.cpp
	${SRC}/src/generic/infobar.cpp
	${SRC}/src/generic/listbkg.cpp
	${SRC}/src/generic/logg.cpp
	${SRC}/src/generic/markuptext.cpp
	${SRC}/src/generic/msgdlgg.cpp
	${SRC}/src/generic/numdlgg.cpp
	${SRC}/src/generic/progdlgg.cpp
	${SRC}/src/generic/preferencesg.cpp
	${SRC}/src/generic/printps.cpp
	${SRC}/src/generic/renderg.cpp
	${SRC}/src/generic/richmsgdlgg.cpp
	${SRC}/src/generic/scrlwing.cpp
	${SRC}/src/generic/selstore.cpp
	${SRC}/src/generic/spinctlg.cpp
	${SRC}/src/generic/splitter.cpp
	${SRC}/src/generic/srchctlg.cpp
	${SRC}/src/generic/statbmpg.cpp
	${SRC}/src/generic/stattextg.cpp
	${SRC}/src/generic/textdlgg.cpp
	${SRC}/src/generic/tipwin.cpp
	${SRC}/src/generic/toolbkg.cpp
	${SRC}/src/generic/treectlg.cpp
	${SRC}/src/generic/treebkg.cpp
	${SRC}/src/generic/vlbox.cpp
	${SRC}/src/generic/vscroll.cpp
	${SRC}/src/xrc/xmlreshandler.cpp
)

# GUI_CMN_HDR
set(WXFILES_GUI_CMN_HDR
	${HDR}/wx/affinematrix2dbase.h
	${HDR}/wx/affinematrix2d.h
	${HDR}/wx/anybutton.h
	${HDR}/wx/bmpbuttn.h
	${HDR}/wx/brush.h
	${HDR}/wx/button.h
	${HDR}/wx/checkbox.h
	${HDR}/wx/checklst.h
	${HDR}/wx/choicdlg.h
	${HDR}/wx/choice.h
	${HDR}/wx/cmndata.h
	${HDR}/wx/collpane.h
	${HDR}/wx/combo.h
	${HDR}/wx/combobox.h
	${HDR}/wx/compositewin.h
	${HDR}/wx/control.h
	${HDR}/wx/ctrlsub.h
	${HDR}/wx/cursor.h
	${HDR}/wx/custombgwin.h
	${HDR}/wx/dc.h
	${HDR}/wx/dcclient.h
	${HDR}/wx/dcgraph.h
	${HDR}/wx/dcmemory.h
	${HDR}/wx/dcprint.h
	${HDR}/wx/dcscreen.h
	${HDR}/wx/dcsvg.h
	${HDR}/wx/dialog.h
	${HDR}/wx/dirdlg.h
	${HDR}/wx/dragimag.h
	${HDR}/wx/encinfo.h
	${HDR}/wx/filedlg.h
	${HDR}/wx/frame.h
	${HDR}/wx/gauge.h
	${HDR}/wx/gbsizer.h
	${HDR}/wx/gdicmn.h
	${HDR}/wx/generic/accel.h
	${HDR}/wx/generic/buttonbar.h
	${HDR}/wx/generic/choicdgg.h
	${HDR}/wx/generic/combo.h
	${HDR}/wx/generic/custombgwin.h
	${HDR}/wx/generic/dcpsg.h
	${HDR}/wx/generic/dirctrlg.h
	${HDR}/wx/generic/dragimgg.h
	${HDR}/wx/generic/filectrlg.h
	${HDR}/wx/generic/headerctrlg.h
	${HDR}/wx/generic/infobar.h
	${HDR}/wx/generic/logg.h
	${HDR}/wx/generic/msgdlgg.h
	${HDR}/wx/generic/numdlgg.h
	${HDR}/wx/generic/notebook.h
	${HDR}/wx/generic/panelg.h
	${HDR}/wx/generic/prntdlgg.h
	${HDR}/wx/generic/printps.h
	${HDR}/wx/generic/progdlgg.h
	${HDR}/wx/generic/richmsgdlgg.h
	${HDR}/wx/generic/scrolwin.h
	${HDR}/wx/generic/spinctlg.h
	${HDR}/wx/generic/splitter.h
	${HDR}/wx/generic/srchctlg.h
	${HDR}/wx/generic/statbmpg.h
	${HDR}/wx/generic/stattextg.h
	${HDR}/wx/generic/textdlgg.h
	${HDR}/wx/generic/treectlg.h
	${HDR}/wx/graphics.h
	${HDR}/wx/headercol.h
	${HDR}/wx/headerctrl.h
	${HDR}/wx/helphtml.h
	${HDR}/wx/icon.h
	${HDR}/wx/infobar.h
	${HDR}/wx/itemid.h
	${HDR}/wx/layout.h
	${HDR}/wx/listbox.h
	${HDR}/wx/mdi.h
	${HDR}/wx/menu.h
	${HDR}/wx/modalhook.h
	${HDR}/wx/mousemanager.h
	${HDR}/wx/msgdlg.h
	${HDR}/wx/nativewin.h
	${HDR}/wx/numdlg.h
	${HDR}/wx/overlay.h
	${HDR}/wx/palette.h
	${HDR}/wx/panel.h
	${HDR}/wx/pen.h
	${HDR}/wx/position.h
	${HDR}/wx/preferences.h
	${HDR}/wx/radiobox.h
	${HDR}/wx/radiobut.h
	${HDR}/wx/range.h
	${HDR}/wx/rearrangectrl.h
	${HDR}/wx/renderer.h
	${HDR}/wx/richmsgdlg.h
	${HDR}/wx/scrolbar.h
	${HDR}/wx/scrolbar.h
	${HDR}/wx/scrolwin.h
	${HDR}/wx/selstore.h
	${HDR}/wx/settings.h
	${HDR}/wx/sizer.h
	${HDR}/wx/slider.h
	${HDR}/wx/statbmp.h
	${HDR}/wx/statbox.h
	${HDR}/wx/stattext.h
	${HDR}/wx/statusbr.h
	${HDR}/wx/testing.h
	${HDR}/wx/textcompleter.h
	${HDR}/wx/textctrl.h
	${HDR}/wx/textdlg.h
	${HDR}/wx/textentry.h
	${HDR}/wx/textwrapper.h
	${HDR}/wx/toolbar.h
	${HDR}/wx/validate.h
	${HDR}/wx/valtext.h
	${HDR}/wx/valnum.h
	${HDR}/wx/window.h
	${HDR}/wx/windowid.h
	${HDR}/wx/windowptr.h
	${HDR}/wx/withimages.h
	${HDR}/wx/wrapsizer.h
	${HDR}/wx/wupdlock.h
	${HDR}/wx/accel.h
	${HDR}/wx/access.h
	${HDR}/wx/anidecod.h
	${HDR}/wx/animdecod.h
	${HDR}/wx/artprov.h
	${HDR}/wx/bitmap.h
	${HDR}/wx/bookctrl.h
	${HDR}/wx/busyinfo.h
	${HDR}/wx/generic/busyinfo.h
	${HDR}/wx/caret.h
	${HDR}/wx/choicebk.h
	${HDR}/wx/clipbrd.h
	${HDR}/wx/clrpicker.h
	${HDR}/wx/cmdproc.h
	${HDR}/wx/colordlg.h
	${HDR}/wx/colour.h
	${HDR}/wx/colourdata.h
	${HDR}/wx/cshelp.h
	${HDR}/wx/dataobj.h
	${HDR}/wx/dcmirror.h
	${HDR}/wx/dcps.h
	${HDR}/wx/dialup.h
	${HDR}/wx/dirctrl.h
	${HDR}/wx/display.h
	${HDR}/wx/display_impl.h
	${HDR}/wx/dnd.h
	${HDR}/wx/docmdi.h
	${HDR}/wx/docview.h
	${HDR}/wx/effects.h
	${HDR}/wx/evtloopsrc.h
	${HDR}/wx/fdrepdlg.h
	${HDR}/wx/filectrl.h
	${HDR}/wx/filehistory.h
	${HDR}/wx/filepicker.h
	${HDR}/wx/fontpicker.h
	${HDR}/wx/fmappriv.h
	${HDR}/wx/font.h
	${HDR}/wx/fontdata.h
	${HDR}/wx/fontdlg.h
	${HDR}/wx/fontenum.h
	${HDR}/wx/fontutil.h
	${HDR}/wx/gdiobj.h
	${HDR}/wx/geometry.h
	${HDR}/wx/gifdecod.h
	${HDR}/wx/help.h
	${HDR}/wx/helpbase.h
	${HDR}/wx/helpwin.h
	${HDR}/wx/iconbndl.h
	${HDR}/wx/imagbmp.h
	${HDR}/wx/image.h
	${HDR}/wx/imaggif.h
	${HDR}/wx/imagiff.h
	${HDR}/wx/imagjpeg.h
	${HDR}/wx/imaglist.h
	${HDR}/wx/imagpcx.h
	${HDR}/wx/imagpng.h
	${HDR}/wx/imagpnm.h
	${HDR}/wx/imagtga.h
	${HDR}/wx/imagtiff.h
	${HDR}/wx/imagxpm.h
	${HDR}/wx/listbase.h
	${HDR}/wx/listbook.h
	${HDR}/wx/listctrl.h
	${HDR}/wx/matrix.h
	${HDR}/wx/menuitem.h
	${HDR}/wx/metafile.h
	${HDR}/wx/minifram.h
	${HDR}/wx/nonownedwnd.h
	${HDR}/wx/notebook.h
	${HDR}/wx/ownerdrw.h
	${HDR}/wx/paper.h
	${HDR}/wx/persist.h
	${HDR}/wx/persist/bookctrl.h
	${HDR}/wx/persist/splitter.h
	${HDR}/wx/persist/toplevel.h
	${HDR}/wx/persist/treebook.h
	${HDR}/wx/persist/window.h
	${HDR}/wx/pickerbase.h
	${HDR}/wx/popupwin.h
	${HDR}/wx/print.h
	${HDR}/wx/printdlg.h
	${HDR}/wx/prntbase.h
	${HDR}/wx/progdlg.h
	${HDR}/wx/quantize.h
	${HDR}/wx/rawbmp.h
	${HDR}/wx/region.h
	${HDR}/wx/scopeguard.h
	${HDR}/wx/simplebook.h
	${HDR}/wx/spinbutt.h
	${HDR}/wx/spinctrl.h
	${HDR}/wx/splitter.h
	${HDR}/wx/srchctrl.h
	${HDR}/wx/statline.h
	${HDR}/wx/tbarbase.h
	${HDR}/wx/tglbtn.h
	${HDR}/wx/tipwin.h
	${HDR}/wx/toolbook.h
	${HDR}/wx/tooltip.h
	${HDR}/wx/toplevel.h
	${HDR}/wx/treebase.h
	${HDR}/wx/treebook.h
	${HDR}/wx/treectrl.h
	${HDR}/wx/uiaction.h
	${HDR}/wx/valgen.h
	${HDR}/wx/vidmode.h
	${HDR}/wx/vlbox.h
	${HDR}/wx/vms_x_fix.h
	${HDR}/wx/vscroll.h
	${HDR}/wx/xpmdecod.h
	${HDR}/wx/xpmhand.h
	${HDR}/wx/xrc/xmlreshandler.h
)

# UNIX_SRC
set(WXFILES_UNIX_SRC
	${SRC}/src/unix/apptraits.cpp
)

# XWIN_LOWLEVEL_SRC
set(WXFILES_XWIN_LOWLEVEL_SRC
	${SRC}/src/generic/caret.cpp
	${SRC}/src/generic/imaglist.cpp
	${SRC}/src/unix/dialup.cpp
	${SRC}/src/unix/displayx11.cpp
	${SRC}/src/unix/fontenum.cpp
	${SRC}/src/unix/fontutil.cpp
	${SRC}/src/unix/uiactionx11.cpp
	${SRC}/src/unix/utilsx11.cpp
)

# XWIN_LOWLEVEL_HDR
set(WXFILES_XWIN_LOWLEVEL_HDR
	${HDR}/wx/generic/caret.h
	${HDR}/wx/generic/imaglist.h
	${HDR}/wx/unix/fontutil.h
	${HDR}/wx/unix/utilsx11.h
)

# GTK_WIN32_SRC
set(WXFILES_GTK_WIN32_SRC
	${SRC}/src/generic/caret.cpp
	${SRC}/src/generic/imaglist.cpp
	${SRC}/src/msw/ole/automtn.cpp
	${SRC}/src/msw/ole/oleutils.cpp
	${SRC}/src/msw/ole/safearray.cpp
	${SRC}/src/msw/ole/uuid.cpp
	${SRC}/src/msw/dialup.cpp
	${SRC}/src/msw/dib.cpp
	${SRC}/src/msw/display.cpp
	${SRC}/src/msw/utilswin.cpp
	${SRC}/src/unix/fontenum.cpp
	${SRC}/src/unix/fontutil.cpp
)

# GTK_WIN32_HDR
set(WXFILES_GTK_WIN32_HDR
	${HDR}/wx/generic/caret.h
	${HDR}/wx/generic/imaglist.h
	${HDR}/wx/msw/ole/automtn.h
	${HDR}/wx/msw/ole/oleutils.h
	${HDR}/wx/msw/ole/safearray.h
	${HDR}/wx/msw/ole/uuid.h
	${HDR}/wx/msw/dib.h
	${HDR}/wx/unix/fontutil.h
)

# GTK_PLATFORM_SRC
set(WXFILES_GTK_PLATFORM_SRC
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "unix")
		list(APPEND WXFILES_GTK_PLATFORM_SRC
			${WXFILES_XWIN_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_GTK_PLATFORM_SRC
			${WXFILES_XWIN_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "win32")
		list(APPEND WXFILES_GTK_PLATFORM_SRC
			${WXFILES_GTK_WIN32_SRC}
		)
	endif ()

# GTK_PLATFORM_HDR
set(WXFILES_GTK_PLATFORM_HDR
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "unix")
		list(APPEND WXFILES_GTK_PLATFORM_HDR
			${WXFILES_XWIN_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_GTK_PLATFORM_HDR
			${WXFILES_XWIN_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "win32")
		list(APPEND WXFILES_GTK_PLATFORM_HDR
			${WXFILES_GTK_WIN32_HDR}
		)
	endif ()

# GTK_LOWLEVEL_SRC
set(WXFILES_GTK_LOWLEVEL_SRC
	${WXFILES_GTK_PLATFORM_SRC}
	${SRC}/src/generic/icon.cpp
	${SRC}/src/generic/paletteg.cpp
	${SRC}/src/gtk/app.cpp
	${SRC}/src/gtk/assertdlg_gtk.cpp
	${SRC}/src/gtk/bitmap.cpp
	${SRC}/src/gtk/brush.cpp
	${SRC}/src/gtk/clipbrd.cpp
	${SRC}/src/gtk/colour.cpp
	${SRC}/src/gtk/cursor.cpp
	${SRC}/src/gtk/dataobj.cpp
	${SRC}/src/gtk/dc.cpp
	${SRC}/src/gtk/display.cpp
	${SRC}/src/gtk/dnd.cpp
	${SRC}/src/gtk/evtloop.cpp
	${SRC}/src/gtk/filectrl.cpp
	${SRC}/src/gtk/filehistory.cpp
	${SRC}/src/gtk/font.cpp
	${SRC}/src/gtk/sockgtk.cpp
	${SRC}/src/gtk/minifram.cpp
	${SRC}/src/gtk/nonownedwnd.cpp
	${SRC}/src/gtk/pen.cpp
	${SRC}/src/gtk/popupwin.cpp
	${SRC}/src/gtk/private.cpp
	${SRC}/src/gtk/region.cpp
	${SRC}/src/gtk/renderer.cpp
	${SRC}/src/gtk/settings.cpp
	${SRC}/src/gtk/textmeasure.cpp
	${SRC}/src/gtk/timer.cpp
	${SRC}/src/gtk/tooltip.cpp
	${SRC}/src/gtk/toplevel.cpp
	${SRC}/src/gtk/utilsgtk.cpp
	${SRC}/src/gtk/win_gtk.cpp
	${SRC}/src/gtk/window.cpp
)

# GTK2_LOWLEVEL_SRC
set(WXFILES_GTK2_LOWLEVEL_SRC
	${WXFILES_GTK_LOWLEVEL_SRC}
	${SRC}/src/gtk/dcclient.cpp
	${SRC}/src/gtk/dcmemory.cpp
	${SRC}/src/gtk/dcscreen.cpp
)

# GTK_LOWLEVEL_HDR
set(WXFILES_GTK_LOWLEVEL_HDR
	${WXFILES_GTK_PLATFORM_HDR}
	${HDR}/wx/generic/icon.h
	${HDR}/wx/generic/paletteg.h
	${HDR}/wx/gtk/app.h
	${HDR}/wx/gtk/assertdlg_gtk.h
	${HDR}/wx/gtk/bitmap.h
	${HDR}/wx/gtk/brush.h
	${HDR}/wx/gtk/clipbrd.h
	${HDR}/wx/gtk/colour.h
	${HDR}/wx/gtk/cursor.h
	${HDR}/wx/gtk/dataform.h
	${HDR}/wx/gtk/dataobj.h
	${HDR}/wx/gtk/dataobj2.h
	${HDR}/wx/gtk/dnd.h
	${HDR}/wx/gtk/evtloop.h
	${HDR}/wx/gtk/evtloopsrc.h
	${HDR}/wx/gtk/font.h
	${HDR}/wx/gtk/filehistory.h
	${HDR}/wx/gtk/minifram.h
	${HDR}/wx/gtk/nonownedwnd.h
	${HDR}/wx/gtk/pen.h
	${HDR}/wx/gtk/popupwin.h
	${HDR}/wx/gtk/region.h
	${HDR}/wx/gtk/tooltip.h
	${HDR}/wx/gtk/toplevel.h
	${HDR}/wx/gtk/window.h
)

# GTK_SRC
set(WXFILES_GTK_SRC
	${SRC}/src/generic/accel.cpp
	${SRC}/src/generic/fdrepdlg.cpp
	${SRC}/src/generic/filepickerg.cpp
	${SRC}/src/generic/listctrl.cpp
	${SRC}/src/generic/prntdlgg.cpp
	${SRC}/src/generic/statusbr.cpp
	${SRC}/src/gtk/anybutton.cpp
	${SRC}/src/gtk/artgtk.cpp
	${SRC}/src/gtk/bmpbuttn.cpp
	${SRC}/src/gtk/button.cpp
	${SRC}/src/gtk/checkbox.cpp
	${SRC}/src/gtk/checklst.cpp
	${SRC}/src/gtk/choice.cpp
	${SRC}/src/gtk/collpane.cpp
	${SRC}/src/gtk/colordlg.cpp
	${SRC}/src/gtk/combobox.cpp
	${SRC}/src/gtk/control.cpp
	${SRC}/src/gtk/clrpicker.cpp
	${SRC}/src/gtk/dialog.cpp
	${SRC}/src/gtk/fontpicker.cpp
	${SRC}/src/gtk/filepicker.cpp
	${SRC}/src/gtk/dirdlg.cpp
	${SRC}/src/gtk/filedlg.cpp
	${SRC}/src/gtk/fontdlg.cpp
	${SRC}/src/gtk/frame.cpp
	${SRC}/src/gtk/gauge.cpp
	${SRC}/src/gtk/gnome/gvfs.cpp
	${SRC}/src/gtk/infobar.cpp
	${SRC}/src/gtk/listbox.cpp
	${SRC}/src/gtk/mdi.cpp
	${SRC}/src/gtk/menu.cpp
	${SRC}/src/gtk/mnemonics.cpp
	${SRC}/src/gtk/msgdlg.cpp
	${SRC}/src/gtk/nativewin.cpp
	${SRC}/src/gtk/notebook.cpp
	${SRC}/src/gtk/print.cpp
	${SRC}/src/gtk/radiobox.cpp
	${SRC}/src/gtk/radiobut.cpp
	${SRC}/src/gtk/scrolbar.cpp
	${SRC}/src/gtk/scrolwin.cpp
	${SRC}/src/gtk/slider.cpp
	${SRC}/src/gtk/spinbutt.cpp
	${SRC}/src/gtk/spinctrl.cpp
	${SRC}/src/gtk/statbmp.cpp
	${SRC}/src/gtk/statbox.cpp
	${SRC}/src/gtk/statline.cpp
	${SRC}/src/gtk/stattext.cpp
	${SRC}/src/gtk/toolbar.cpp
	${SRC}/src/gtk/textctrl.cpp
	${SRC}/src/gtk/textentry.cpp
	${SRC}/src/gtk/tglbtn.cpp
	${SRC}/src/gtk/treeentry_gtk.c
)

# GTK2_SRC
set(WXFILES_GTK2_SRC
	${WXFILES_GTK_SRC}
	${SRC}/src/generic/fontdlgg.cpp
)

# GTK_HDR
set(WXFILES_GTK_HDR
	${HDR}/wx/generic/fdrepdlg.h
	${HDR}/wx/generic/filepickerg.h
	${HDR}/wx/generic/listctrl.h
	${HDR}/wx/generic/statusbr.h
	${HDR}/wx/gtk/accel.h
	${HDR}/wx/gtk/anybutton.h
	${HDR}/wx/gtk/bmpbuttn.h
	${HDR}/wx/gtk/button.h
	${HDR}/wx/gtk/checkbox.h
	${HDR}/wx/gtk/checklst.h
	${HDR}/wx/gtk/chkconf.h
	${HDR}/wx/gtk/collpane.h
	${HDR}/wx/gtk/colordlg.h
	${HDR}/wx/gtk/choice.h
	${HDR}/wx/gtk/combobox.h
	${HDR}/wx/gtk/control.h
	${HDR}/wx/gtk/clrpicker.h
	${HDR}/wx/gtk/dialog.h
	${HDR}/wx/gtk/dirdlg.h
	${HDR}/wx/gtk/filectrl.h
	${HDR}/wx/gtk/filedlg.h
	${HDR}/wx/gtk/fontpicker.h
	${HDR}/wx/gtk/filepicker.h
	${HDR}/wx/gtk/fontdlg.h
	${HDR}/wx/gtk/frame.h
	${HDR}/wx/gtk/gauge.h
	${HDR}/wx/gtk/gnome/gvfs.h
	${HDR}/wx/gtk/infobar.h
	${HDR}/wx/gtk/listbox.h
	${HDR}/wx/gtk/mdi.h
	${HDR}/wx/gtk/menu.h
	${HDR}/wx/gtk/menuitem.h
	${HDR}/wx/gtk/msgdlg.h
	${HDR}/wx/gtk/notebook.h
	${HDR}/wx/gtk/print.h
	${HDR}/wx/gtk/radiobox.h
	${HDR}/wx/gtk/radiobut.h
	${HDR}/wx/gtk/scrolbar.h
	${HDR}/wx/gtk/scrolwin.h
	${HDR}/wx/gtk/slider.h
	${HDR}/wx/gtk/spinbutt.h
	${HDR}/wx/gtk/spinctrl.h
	${HDR}/wx/gtk/statbmp.h
	${HDR}/wx/gtk/statbox.h
	${HDR}/wx/gtk/statline.h
	${HDR}/wx/gtk/stattext.h
	${HDR}/wx/gtk/toolbar.h
	${HDR}/wx/gtk/textctrl.h
	${HDR}/wx/gtk/textentry.h
	${HDR}/wx/gtk/tglbtn.h
)

# GTK2_HDR
set(WXFILES_GTK2_HDR
	${WXFILES_GTK_HDR}
	${HDR}/wx/generic/fontdlgg.h
)

# GTK1_LOWLEVEL_SRC
set(WXFILES_GTK1_LOWLEVEL_SRC
	${WXFILES_XWIN_LOWLEVEL_SRC}
	${SRC}/src/generic/icon.cpp
	${SRC}/src/generic/paletteg.cpp
	${SRC}/src/generic/textmeasure.cpp
	${SRC}/src/gtk1/app.cpp
	${SRC}/src/gtk1/bitmap.cpp
	${SRC}/src/gtk1/brush.cpp
	${SRC}/src/gtk1/clipbrd.cpp
	${SRC}/src/gtk1/colour.cpp
	${SRC}/src/gtk1/cursor.cpp
	${SRC}/src/gtk1/data.cpp
	${SRC}/src/gtk1/dataobj.cpp
	${SRC}/src/gtk1/dc.cpp
	${SRC}/src/gtk1/dcclient.cpp
	${SRC}/src/gtk1/dcmemory.cpp
	${SRC}/src/gtk1/dcscreen.cpp
	${SRC}/src/gtk1/dnd.cpp
	${SRC}/src/gtk1/evtloop.cpp
	${SRC}/src/gtk1/font.cpp
	${SRC}/src/gtk1/sockgtk.cpp
	${SRC}/src/gtk1/main.cpp
	${SRC}/src/gtk1/minifram.cpp
	${SRC}/src/gtk1/pen.cpp
	${SRC}/src/gtk1/popupwin.cpp
	${SRC}/src/gtk1/region.cpp
	${SRC}/src/gtk1/renderer.cpp
	${SRC}/src/gtk1/settings.cpp
	${SRC}/src/gtk1/timer.cpp
	${SRC}/src/gtk1/tooltip.cpp
	${SRC}/src/gtk1/toplevel.cpp
	${SRC}/src/gtk1/utilsgtk.cpp
	${SRC}/src/gtk1/win_gtk.c
	${SRC}/src/gtk1/window.cpp
)

# GTK1_LOWLEVEL_HDR
set(WXFILES_GTK1_LOWLEVEL_HDR
	${WXFILES_XWIN_LOWLEVEL_HDR}
	${HDR}/wx/generic/icon.h
	${HDR}/wx/generic/paletteg.h
	${HDR}/wx/gtk1/app.h
	${HDR}/wx/gtk1/bitmap.h
	${HDR}/wx/gtk1/brush.h
	${HDR}/wx/gtk1/clipbrd.h
	${HDR}/wx/gtk1/colour.h
	${HDR}/wx/gtk1/cursor.h
	${HDR}/wx/gtk1/dataform.h
	${HDR}/wx/gtk1/dataobj.h
	${HDR}/wx/gtk1/dataobj2.h
	${HDR}/wx/gtk1/dc.h
	${HDR}/wx/gtk1/dcclient.h
	${HDR}/wx/gtk1/dcmemory.h
	${HDR}/wx/gtk1/dcscreen.h
	${HDR}/wx/gtk1/dnd.h
	${HDR}/wx/gtk1/font.h
	${HDR}/wx/gtk1/minifram.h
	${HDR}/wx/gtk1/pen.h
	${HDR}/wx/gtk1/popupwin.h
	${HDR}/wx/gtk1/region.h
	${HDR}/wx/gtk1/tooltip.h
	${HDR}/wx/gtk1/toplevel.h
	${HDR}/wx/gtk1/win_gtk.h
	${HDR}/wx/gtk1/window.h
)

# GTK1_SRC
set(WXFILES_GTK1_SRC
	${SRC}/src/generic/accel.cpp
	${SRC}/src/generic/clrpickerg.cpp
	${SRC}/src/generic/collpaneg.cpp
	${SRC}/src/generic/colrdlgg.cpp
	${SRC}/src/generic/dirdlgg.cpp
	${SRC}/src/generic/fdrepdlg.cpp
	${SRC}/src/generic/filedlgg.cpp
	${SRC}/src/generic/filepickerg.cpp
	${SRC}/src/generic/fontdlgg.cpp
	${SRC}/src/generic/fontpickerg.cpp
	${SRC}/src/generic/listctrl.cpp
	${SRC}/src/generic/prntdlgg.cpp
	${SRC}/src/generic/statusbr.cpp
	${SRC}/src/gtk1/bmpbuttn.cpp
	${SRC}/src/gtk1/button.cpp
	${SRC}/src/gtk1/checkbox.cpp
	${SRC}/src/gtk1/checklst.cpp
	${SRC}/src/gtk1/choice.cpp
	${SRC}/src/gtk1/combobox.cpp
	${SRC}/src/gtk1/control.cpp
	${SRC}/src/gtk1/dialog.cpp
	${SRC}/src/gtk1/filedlg.cpp
	${SRC}/src/gtk1/fontdlg.cpp
	${SRC}/src/gtk1/frame.cpp
	${SRC}/src/gtk1/gauge.cpp
	${SRC}/src/gtk1/listbox.cpp
	${SRC}/src/gtk1/mdi.cpp
	${SRC}/src/gtk1/menu.cpp
	${SRC}/src/gtk1/mnemonics.cpp
	${SRC}/src/gtk1/notebook.cpp
	${SRC}/src/gtk1/radiobox.cpp
	${SRC}/src/gtk1/radiobut.cpp
	${SRC}/src/gtk1/scrolbar.cpp
	${SRC}/src/gtk1/scrolwin.cpp
	${SRC}/src/gtk1/slider.cpp
	${SRC}/src/gtk1/spinbutt.cpp
	${SRC}/src/gtk1/spinctrl.cpp
	${SRC}/src/gtk1/statbmp.cpp
	${SRC}/src/gtk1/statbox.cpp
	${SRC}/src/gtk1/statline.cpp
	${SRC}/src/gtk1/stattext.cpp
	${SRC}/src/gtk1/toolbar.cpp
	${SRC}/src/gtk1/textctrl.cpp
	${SRC}/src/gtk1/tglbtn.cpp
)

# GTK1_HDR
set(WXFILES_GTK1_HDR
	${HDR}/wx/generic/clrpickerg.h
	${HDR}/wx/generic/collpaneg.h
	${HDR}/wx/generic/colrdlgg.h
	${HDR}/wx/generic/dirdlgg.h
	${HDR}/wx/generic/fdrepdlg.h
	${HDR}/wx/generic/filedlgg.h
	${HDR}/wx/generic/filepickerg.h
	${HDR}/wx/generic/fontdlgg.h
	${HDR}/wx/generic/fontpickerg.h
	${HDR}/wx/generic/listctrl.h
	${HDR}/wx/generic/statusbr.h
	${HDR}/wx/gtk1/accel.h
	${HDR}/wx/gtk1/bmpbuttn.h
	${HDR}/wx/gtk1/button.h
	${HDR}/wx/gtk1/checkbox.h
	${HDR}/wx/gtk1/checklst.h
	${HDR}/wx/gtk1/choice.h
	${HDR}/wx/gtk1/combobox.h
	${HDR}/wx/gtk1/control.h
	${HDR}/wx/gtk1/dialog.h
	${HDR}/wx/gtk1/filedlg.h
	${HDR}/wx/gtk1/fontdlg.h
	${HDR}/wx/gtk1/frame.h
	${HDR}/wx/gtk1/gauge.h
	${HDR}/wx/gtk1/listbox.h
	${HDR}/wx/gtk1/mdi.h
	${HDR}/wx/gtk1/menu.h
	${HDR}/wx/gtk1/menuitem.h
	${HDR}/wx/gtk1/msgdlg.h
	${HDR}/wx/gtk1/notebook.h
	${HDR}/wx/gtk1/radiobox.h
	${HDR}/wx/gtk1/radiobut.h
	${HDR}/wx/gtk1/scrolbar.h
	${HDR}/wx/gtk1/scrolwin.h
	${HDR}/wx/gtk1/slider.h
	${HDR}/wx/gtk1/spinbutt.h
	${HDR}/wx/gtk1/spinctrl.h
	${HDR}/wx/gtk1/statbmp.h
	${HDR}/wx/gtk1/statbox.h
	${HDR}/wx/gtk1/statline.h
	${HDR}/wx/gtk1/stattext.h
	${HDR}/wx/gtk1/toolbar.h
	${HDR}/wx/gtk1/textctrl.h
	${HDR}/wx/gtk1/tglbtn.h
	${HDR}/wx/gtk1/treectrl.h
)

# MOTIF_LOWLEVEL_SRC
set(WXFILES_MOTIF_LOWLEVEL_SRC
	${WXFILES_XWIN_LOWLEVEL_SRC}
	${SRC}/src/generic/textmeasure.cpp
	${SRC}/src/x11/bitmap.cpp
	${SRC}/src/x11/brush.cpp
	${SRC}/src/x11/palette.cpp
	${SRC}/src/x11/pen.cpp
	${SRC}/src/x11/region.cpp
	${SRC}/src/x11/utilsx.cpp
)

# MOTIF_LOWLEVEL_HDR
set(WXFILES_MOTIF_LOWLEVEL_HDR
	${WXFILES_XWIN_LOWLEVEL_HDR}
	${HDR}/wx/x11/bitmap.h
	${HDR}/wx/x11/brush.h
	${HDR}/wx/x11/palette.h
	${HDR}/wx/x11/pen.h
	${HDR}/wx/x11/region.h
)

# MOTIF_SRC
set(WXFILES_MOTIF_SRC
	${SRC}/src/motif/accel.cpp
	${SRC}/src/motif/app.cpp
	${SRC}/src/motif/bmpbuttn.cpp
	${SRC}/src/motif/bmpmotif.cpp
	${SRC}/src/motif/button.cpp
	${SRC}/src/motif/checkbox.cpp
	${SRC}/src/motif/checklst.cpp
	${SRC}/src/motif/choice.cpp
	${SRC}/src/motif/clipbrd.cpp
	${SRC}/src/motif/colour.cpp
	${SRC}/src/motif/combobox.cpp
	${SRC}/src/motif/combobox_native.cpp
	${SRC}/src/motif/control.cpp
	${SRC}/src/motif/cursor.cpp
	${SRC}/src/motif/data.cpp
	${SRC}/src/motif/dataobj.cpp
	${SRC}/src/motif/dc.cpp
	${SRC}/src/motif/dcclient.cpp
	${SRC}/src/motif/dcmemory.cpp
	${SRC}/src/motif/dcscreen.cpp
	${SRC}/src/motif/dialog.cpp
	${SRC}/src/motif/evtloop.cpp
	${SRC}/src/motif/filedlg.cpp
	${SRC}/src/motif/font.cpp
	${SRC}/src/motif/frame.cpp
	${SRC}/src/motif/gauge.cpp
	${SRC}/src/motif/sockmot.cpp
	${SRC}/src/motif/icon.cpp
	${SRC}/src/motif/listbox.cpp
	${SRC}/src/motif/main.cpp
	${SRC}/src/motif/menu.cpp
	${SRC}/src/motif/menuitem.cpp
	${SRC}/src/motif/minifram.cpp
	${SRC}/src/motif/msgdlg.cpp
	${SRC}/src/motif/popupwin.cpp
	${SRC}/src/motif/radiobox.cpp
	${SRC}/src/motif/radiobut.cpp
	${SRC}/src/motif/scrolbar.cpp
	${SRC}/src/motif/settings.cpp
	${SRC}/src/motif/slider.cpp
	${SRC}/src/motif/spinbutt.cpp
	${SRC}/src/motif/statbmp.cpp
	${SRC}/src/motif/statbox.cpp
	${SRC}/src/motif/stattext.cpp
	${SRC}/src/motif/textctrl.cpp
	${SRC}/src/motif/textentry.cpp
	${SRC}/src/motif/timer.cpp
	${SRC}/src/motif/toolbar.cpp
	${SRC}/src/motif/toplevel.cpp
	${SRC}/src/motif/utils.cpp
	${SRC}/src/motif/window.cpp
	${SRC}/src/motif/xmcombo/xmcombo.c
	${SRC}/src/generic/clrpickerg.cpp
	${SRC}/src/generic/collpaneg.cpp
	${SRC}/src/generic/colrdlgg.cpp
	${SRC}/src/generic/dirdlgg.cpp
	${SRC}/src/generic/fdrepdlg.cpp
	${SRC}/src/generic/filepickerg.cpp
	${SRC}/src/generic/fontdlgg.cpp
	${SRC}/src/generic/fontpickerg.cpp
	${SRC}/src/generic/listctrl.cpp
	${SRC}/src/generic/mdig.cpp
	${SRC}/src/generic/notebook.cpp
	${SRC}/src/generic/prntdlgg.cpp
	${SRC}/src/generic/statline.cpp
	${SRC}/src/generic/statusbr.cpp
	${SRC}/src/generic/tabg.cpp
)

# MOTIF_HDR
set(WXFILES_MOTIF_HDR
	${HDR}/wx/generic/clrpickerg.h
	${HDR}/wx/generic/collpaneg.h
	${HDR}/wx/generic/colrdlgg.h
	${HDR}/wx/generic/ctrlsub.h
	${HDR}/wx/generic/dirdlgg.h
	${HDR}/wx/generic/fdrepdlg.h
	${HDR}/wx/generic/filepickerg.h
	${HDR}/wx/generic/fontdlgg.h
	${HDR}/wx/generic/fontpickerg.h
	${HDR}/wx/generic/listctrl.h
	${HDR}/wx/generic/mdig.h
	${HDR}/wx/generic/notebook.h
	${HDR}/wx/generic/prntdlgg.h
	${HDR}/wx/generic/statline.h
	${HDR}/wx/generic/statusbr.h
	${HDR}/wx/generic/tabg.h
	${HDR}/wx/motif/accel.h
	${HDR}/wx/motif/app.h
	${HDR}/wx/motif/bmpbuttn.h
	${HDR}/wx/motif/bmpmotif.h
	${HDR}/wx/motif/button.h
	${HDR}/wx/motif/checkbox.h
	${HDR}/wx/motif/checklst.h
	${HDR}/wx/motif/chkconf.h
	${HDR}/wx/motif/choice.h
	${HDR}/wx/motif/clipbrd.h
	${HDR}/wx/motif/colour.h
	${HDR}/wx/motif/combobox.h
	${HDR}/wx/motif/control.h
	${HDR}/wx/motif/ctrlsub.h
	${HDR}/wx/motif/cursor.h
	${HDR}/wx/motif/dataform.h
	${HDR}/wx/motif/dataobj.h
	${HDR}/wx/motif/dataobj2.h
	${HDR}/wx/motif/dc.h
	${HDR}/wx/motif/dcclient.h
	${HDR}/wx/motif/dcmemory.h
	${HDR}/wx/motif/dcprint.h
	${HDR}/wx/motif/dcscreen.h
	${HDR}/wx/motif/dialog.h
	${HDR}/wx/motif/dnd.h
	${HDR}/wx/motif/filedlg.h
	${HDR}/wx/motif/font.h
	${HDR}/wx/motif/frame.h
	${HDR}/wx/motif/gauge.h
	${HDR}/wx/motif/icon.h
	${HDR}/wx/motif/listbox.h
	${HDR}/wx/motif/menu.h
	${HDR}/wx/motif/menuitem.h
	${HDR}/wx/motif/minifram.h
	${HDR}/wx/motif/msgdlg.h
	${HDR}/wx/motif/popupwin.h
	${HDR}/wx/motif/print.h
	${HDR}/wx/motif/private.h
	${HDR}/wx/motif/radiobox.h
	${HDR}/wx/motif/radiobut.h
	${HDR}/wx/motif/scrolbar.h
	${HDR}/wx/motif/slider.h
	${HDR}/wx/motif/spinbutt.h
	${HDR}/wx/motif/statbmp.h
	${HDR}/wx/motif/statbox.h
	${HDR}/wx/motif/stattext.h
	${HDR}/wx/motif/textctrl.h
	${HDR}/wx/motif/textentry.h
	${HDR}/wx/motif/tglbtn.h
	${HDR}/wx/motif/toolbar.h
	${HDR}/wx/motif/toplevel.h
	${HDR}/wx/motif/window.h
)

# X11_LOWLEVEL_SRC
set(WXFILES_X11_LOWLEVEL_SRC
	${WXFILES_XWIN_LOWLEVEL_SRC}
	${SRC}/src/generic/icon.cpp
	${SRC}/src/generic/textmeasure.cpp
	${SRC}/src/generic/timer.cpp
	${SRC}/src/x11/app.cpp
	${SRC}/src/x11/bitmap.cpp
	${SRC}/src/x11/brush.cpp
	${SRC}/src/x11/clipbrd.cpp
	${SRC}/src/x11/colour.cpp
	${SRC}/src/x11/cursor.cpp
	${SRC}/src/x11/data.cpp
	${SRC}/src/x11/dataobj.cpp
	${SRC}/src/x11/dc.cpp
	${SRC}/src/x11/dcclient.cpp
	${SRC}/src/x11/dcmemory.cpp
	${SRC}/src/x11/dcscreen.cpp
	${SRC}/src/x11/evtloop.cpp
	${SRC}/src/x11/font.cpp
	${SRC}/src/x11/minifram.cpp
	${SRC}/src/x11/nanox.c
	${SRC}/src/x11/palette.cpp
	${SRC}/src/x11/pen.cpp
	${SRC}/src/x11/popupwin.cpp
	${SRC}/src/x11/region.cpp
	${SRC}/src/x11/reparent.cpp
	${SRC}/src/x11/settings.cpp
	${SRC}/src/x11/toplevel.cpp
	${SRC}/src/x11/utils.cpp
	${SRC}/src/x11/utilsx.cpp
	${SRC}/src/x11/window.cpp
)

# X11_LOWLEVEL_HDR
set(WXFILES_X11_LOWLEVEL_HDR
	${WXFILES_XWIN_LOWLEVEL_HDR}
	${HDR}/wx/generic/icon.h
	${HDR}/wx/x11/app.h
	${HDR}/wx/x11/bitmap.h
	${HDR}/wx/x11/brush.h
	${HDR}/wx/x11/chkconf.h
	${HDR}/wx/x11/clipbrd.h
	${HDR}/wx/x11/colour.h
	${HDR}/wx/x11/cursor.h
	${HDR}/wx/x11/dataform.h
	${HDR}/wx/x11/dataobj.h
	${HDR}/wx/x11/dataobj2.h
	${HDR}/wx/x11/dc.h
	${HDR}/wx/x11/dcclient.h
	${HDR}/wx/x11/dcmemory.h
	${HDR}/wx/x11/dcprint.h
	${HDR}/wx/x11/dcscreen.h
	${HDR}/wx/x11/dnd.h
	${HDR}/wx/x11/font.h
	${HDR}/wx/x11/minifram.h
	${HDR}/wx/x11/palette.h
	${HDR}/wx/x11/pen.h
	${HDR}/wx/x11/popupwin.h
	${HDR}/wx/x11/print.h
	${HDR}/wx/x11/private.h
	${HDR}/wx/x11/privx.h
	${HDR}/wx/x11/region.h
	${HDR}/wx/x11/reparent.h
	${HDR}/wx/x11/textctrl.h
	${HDR}/wx/x11/toplevel.h
	${HDR}/wx/x11/window.h
)

# MSW_LOWLEVEL_SRC
set(WXFILES_MSW_LOWLEVEL_SRC
	${SRC}/src/msw/ole/activex.cpp
	${SRC}/src/msw/app.cpp
	${SRC}/src/msw/bitmap.cpp
	${SRC}/src/msw/brush.cpp
	${SRC}/src/msw/caret.cpp
	${SRC}/src/msw/clipbrd.cpp
	${SRC}/src/msw/colour.cpp
	${SRC}/src/msw/cursor.cpp
	${SRC}/src/msw/data.cpp
	${SRC}/src/msw/dc.cpp
	${SRC}/src/msw/dcclient.cpp
	${SRC}/src/msw/dcmemory.cpp
	${SRC}/src/msw/dcprint.cpp
	${SRC}/src/msw/dcscreen.cpp
	${SRC}/src/msw/dialup.cpp
	${SRC}/src/msw/dib.cpp
	${SRC}/src/msw/display.cpp
	${SRC}/src/msw/enhmeta.cpp
	${SRC}/src/msw/font.cpp
	${SRC}/src/msw/fontenum.cpp
	${SRC}/src/msw/fontutil.cpp
	${SRC}/src/msw/gdiimage.cpp
	${SRC}/src/msw/gdiobj.cpp
	${SRC}/src/msw/gdiplus.cpp
	${SRC}/src/msw/graphics.cpp
	${SRC}/src/msw/icon.cpp
	${SRC}/src/msw/imaglist.cpp
	${SRC}/src/msw/minifram.cpp
	${SRC}/src/msw/nonownedwnd.cpp
	${SRC}/src/msw/ole/dataobj.cpp
	${SRC}/src/msw/ole/dropsrc.cpp
	${SRC}/src/msw/ole/droptgt.cpp
	${SRC}/src/msw/ole/oleutils.cpp
	${SRC}/src/msw/ole/safearray.cpp
	${SRC}/src/msw/palette.cpp
	${SRC}/src/msw/pen.cpp
	${SRC}/src/msw/popupwin.cpp
	${SRC}/src/msw/printdlg.cpp
	${SRC}/src/msw/printwin.cpp
	${SRC}/src/msw/region.cpp
	${SRC}/src/msw/renderer.cpp
	${SRC}/src/msw/settings.cpp
	${SRC}/src/msw/textmeasure.cpp
	${SRC}/src/msw/tooltip.cpp
	${SRC}/src/msw/toplevel.cpp
	${SRC}/src/msw/uiaction.cpp
	${SRC}/src/msw/utilsgui.cpp
	${SRC}/src/msw/utilswin.cpp
	${SRC}/src/msw/uxtheme.cpp
	${SRC}/src/msw/window.cpp
)

# MSW_LOWLEVEL_HDR
set(WXFILES_MSW_LOWLEVEL_HDR
	${HDR}/wx/msw/nonownedwnd.h
	${HDR}/wx/msw/ole/activex.h
	${HDR}/wx/msw/popupwin.h
	${HDR}/wx/msw/uxtheme.h
	${HDR}/wx/msw/uxthemep.h
	${HDR}/wx/msw/htmlhelp.h
)

# MSW_DESKTOP_LOWLEVEL_SRC
set(WXFILES_MSW_DESKTOP_LOWLEVEL_SRC
	${SRC}/src/msw/helpchm.cpp
	${SRC}/src/msw/helpwin.cpp
	${SRC}/src/msw/ole/automtn.cpp
	${SRC}/src/msw/ole/uuid.cpp
)

# MSW_DESKTOP_LOWLEVEL_HDR
set(WXFILES_MSW_DESKTOP_LOWLEVEL_HDR
	${HDR}/wx/msw/helpchm.h
	${HDR}/wx/msw/helpwin.h
)

# MSW_SRC
set(WXFILES_MSW_SRC
	${SRC}/src/generic/clrpickerg.cpp
	${SRC}/src/generic/collpaneg.cpp
	${SRC}/src/generic/filepickerg.cpp
	${SRC}/src/generic/fontpickerg.cpp
	${SRC}/src/generic/statusbr.cpp
	${SRC}/src/generic/prntdlgg.cpp
	${SRC}/src/msw/accel.cpp
	${SRC}/src/msw/anybutton.cpp
	${SRC}/src/msw/artmsw.cpp
	${SRC}/src/msw/bmpbuttn.cpp
	${SRC}/src/msw/button.cpp
	${SRC}/src/msw/checkbox.cpp
	${SRC}/src/msw/choice.cpp
	${SRC}/src/msw/colordlg.cpp
	${SRC}/src/msw/combo.cpp
	${SRC}/src/msw/combobox.cpp
	${SRC}/src/msw/control.cpp
	${SRC}/src/msw/dialog.cpp
	${SRC}/src/msw/dirdlg.cpp
	${SRC}/src/msw/dragimag.cpp
	${SRC}/src/msw/evtloop.cpp
	${SRC}/src/msw/filedlg.cpp
	${SRC}/src/msw/frame.cpp
	${SRC}/src/msw/gauge.cpp
	${SRC}/src/msw/headerctrl.cpp
	${SRC}/src/msw/iniconf.cpp
	${SRC}/src/msw/listbox.cpp
	${SRC}/src/msw/listctrl.cpp
	${SRC}/src/msw/mdi.cpp
	${SRC}/src/msw/menu.cpp
	${SRC}/src/msw/menuitem.cpp
	${SRC}/src/msw/metafile.cpp
	${SRC}/src/msw/msgdlg.cpp
	${SRC}/src/msw/nativdlg.cpp
	${SRC}/src/msw/nativewin.cpp
	${SRC}/src/msw/notebook.cpp
	${SRC}/src/msw/ole/access.cpp
	${SRC}/src/msw/ownerdrw.cpp
	${SRC}/src/msw/panel.cpp
	${SRC}/src/msw/progdlg.cpp
	${SRC}/src/msw/radiobox.cpp
	${SRC}/src/msw/radiobut.cpp
	${SRC}/src/msw/richmsgdlg.cpp
	${SRC}/src/msw/scrolbar.cpp
	${SRC}/src/msw/slider.cpp
	${SRC}/src/msw/spinbutt.cpp
	${SRC}/src/msw/spinctrl.cpp
	${SRC}/src/msw/statbmp.cpp
	${SRC}/src/msw/statbox.cpp
	${SRC}/src/msw/statusbar.cpp
	${SRC}/src/msw/statline.cpp
	${SRC}/src/msw/stattext.cpp
	${SRC}/src/msw/toolbar.cpp
	${SRC}/src/msw/textctrl.cpp
	${SRC}/src/msw/textentry.cpp
	${SRC}/src/msw/tglbtn.cpp
	${SRC}/src/msw/treectrl.cpp
)

# MSW_HDR
set(WXFILES_MSW_HDR
	${HDR}/wx/generic/clrpickerg.h
	${HDR}/wx/generic/collpaneg.h
	${HDR}/wx/generic/filepickerg.h
	${HDR}/wx/generic/fontpickerg.h
	${HDR}/wx/msw/accel.h
	${HDR}/wx/msw/anybutton.h
	${HDR}/wx/msw/app.h
	${HDR}/wx/msw/bitmap.h
	${HDR}/wx/msw/bmpbuttn.h
	${HDR}/wx/msw/brush.h
	${HDR}/wx/msw/button.h
	${HDR}/wx/msw/caret.h
	${HDR}/wx/msw/checkbox.h
	${HDR}/wx/msw/choice.h
	${HDR}/wx/msw/clipbrd.h
	${HDR}/wx/msw/colordlg.h
	${HDR}/wx/msw/colour.h
	${HDR}/wx/msw/combo.h
	${HDR}/wx/msw/combobox.h
	${HDR}/wx/msw/control.h
	${HDR}/wx/msw/ctrlsub.h
	${HDR}/wx/msw/cursor.h
	${HDR}/wx/msw/custombgwin.h
	${HDR}/wx/msw/dc.h
	${HDR}/wx/msw/dcclient.h
	${HDR}/wx/msw/dcmemory.h
	${HDR}/wx/msw/dcprint.h
	${HDR}/wx/msw/dcscreen.h
	${HDR}/wx/msw/dialog.h
	${HDR}/wx/msw/dib.h
	${HDR}/wx/msw/dirdlg.h
	${HDR}/wx/msw/dragimag.h
	${HDR}/wx/msw/enhmeta.h
	${HDR}/wx/msw/evtloop.h
	${HDR}/wx/msw/filedlg.h
	${HDR}/wx/msw/font.h
	${HDR}/wx/msw/frame.h
	${HDR}/wx/msw/gauge.h
	${HDR}/wx/msw/gdiimage.h
	${HDR}/wx/msw/headerctrl.h
	${HDR}/wx/msw/icon.h
	${HDR}/wx/msw/imaglist.h
	${HDR}/wx/msw/iniconf.h
	${HDR}/wx/msw/init.h
	${HDR}/wx/msw/listbox.h
	${HDR}/wx/msw/listctrl.h
	${HDR}/wx/msw/mdi.h
	${HDR}/wx/msw/menu.h
	${HDR}/wx/msw/menuitem.h
	${HDR}/wx/msw/metafile.h
	${HDR}/wx/msw/minifram.h
	${HDR}/wx/msw/missing.h
	${HDR}/wx/msw/msgdlg.h
	${HDR}/wx/msw/msvcrt.h
	${HDR}/wx/msw/notebook.h
	${HDR}/wx/msw/ole/access.h
	${HDR}/wx/msw/ole/dataform.h
	${HDR}/wx/msw/ole/dataobj.h
	${HDR}/wx/msw/ole/dataobj2.h
	${HDR}/wx/msw/ole/dropsrc.h
	${HDR}/wx/msw/ole/droptgt.h
	${HDR}/wx/msw/ole/oleutils.h
	${HDR}/wx/msw/ole/safearray.h
	${HDR}/wx/msw/ownerdrw.h
	${HDR}/wx/msw/palette.h
	${HDR}/wx/msw/panel.h
	${HDR}/wx/msw/pen.h
	${HDR}/wx/msw/printdlg.h
	${HDR}/wx/msw/printwin.h
	${HDR}/wx/msw/progdlg.h
	${HDR}/wx/msw/radiobox.h
	${HDR}/wx/msw/radiobut.h
	${HDR}/wx/msw/region.h
	${HDR}/wx/msw/rcdefs.h
	${HDR}/wx/msw/richmsgdlg.h
	${HDR}/wx/msw/scrolbar.h
	${HDR}/wx/msw/slider.h
	${HDR}/wx/msw/spinbutt.h
	${HDR}/wx/msw/spinctrl.h
	${HDR}/wx/msw/statbmp.h
	${HDR}/wx/msw/statbox.h
	${HDR}/wx/msw/statusbar.h
	${HDR}/wx/msw/statline.h
	${HDR}/wx/msw/stattext.h
	${HDR}/wx/msw/toolbar.h
	${HDR}/wx/msw/textctrl.h
	${HDR}/wx/msw/textentry.h
	${HDR}/wx/msw/tglbtn.h
	${HDR}/wx/msw/tooltip.h
	${HDR}/wx/msw/toplevel.h
	${HDR}/wx/msw/treectrl.h
	${HDR}/wx/msw/window.h
	${HDR}/wx/msw/wx.manifest
	${HDR}/wx/msw/amd64.manifest
	${HDR}/wx/msw/ia64.manifest
	${HDR}/wx/msw/wx.rc
	${HDR}/wx/msw/colours.bmp
	${HDR}/wx/msw/csquery.bmp
	${HDR}/wx/msw/blank.cur
	${HDR}/wx/msw/bullseye.cur
	${HDR}/wx/msw/cross.cur
	${HDR}/wx/msw/hand.cur
	${HDR}/wx/msw/magnif1.cur
	${HDR}/wx/msw/pbrush.cur
	${HDR}/wx/msw/pencil.cur
	${HDR}/wx/msw/pntleft.cur
	${HDR}/wx/msw/pntright.cur
	${HDR}/wx/msw/roller.cur
	${HDR}/wx/msw/cdrom.ico
	${HDR}/wx/msw/child.ico
	${HDR}/wx/msw/computer.ico
	${HDR}/wx/msw/drive.ico
	${HDR}/wx/msw/file1.ico
	${HDR}/wx/msw/floppy.ico
	${HDR}/wx/msw/folder1.ico
	${HDR}/wx/msw/folder2.ico
	${HDR}/wx/msw/mdi.ico
	${HDR}/wx/msw/question.ico
	${HDR}/wx/msw/removble.ico
	${HDR}/wx/msw/std.ico
)

# MSW_DESKTOP_SRC
set(WXFILES_MSW_DESKTOP_SRC
	${SRC}/src/msw/checklst.cpp
	${SRC}/src/msw/fdrepdlg.cpp
	${SRC}/src/msw/fontdlg.cpp
)

# MSW_DESKTOP_HDR
set(WXFILES_MSW_DESKTOP_HDR
	${HDR}/wx/msw/checklst.h
	${HDR}/wx/msw/fdrepdlg.h
	${HDR}/wx/msw/fontdlg.h
	${HDR}/wx/msw/ole/automtn.h
	${HDR}/wx/msw/ole/uuid.h
)

# WINCE_SRC
set(WXFILES_WINCE_SRC
	${SRC}/src/generic/dirdlgg.cpp
	${SRC}/src/generic/fdrepdlg.cpp
	${SRC}/src/generic/filedlgg.cpp
	${SRC}/src/generic/fontdlgg.cpp
	${SRC}/src/msw/wince/checklst.cpp
	${SRC}/src/msw/wince/choicece.cpp
	${SRC}/src/msw/wince/crt.cpp
	${SRC}/src/msw/wince/filedlgwce.cpp
	${SRC}/src/msw/wince/filefnwce.cpp
	${SRC}/src/msw/wince/helpwce.cpp
	${SRC}/src/msw/wince/menuce.cpp
	${SRC}/src/msw/wince/tbarwce.cpp
	${SRC}/src/msw/wince/textctrlce.cpp
)

# WINCE_HDR
set(WXFILES_WINCE_HDR
	${HDR}/wx/generic/fdrepdlg.h
	${HDR}/wx/generic/filedlgg.h
	${HDR}/wx/generic/fontdlgg.h
	${HDR}/wx/msw/wince/checklst.h
	${HDR}/wx/msw/wince/choicece.h
	${HDR}/wx/msw/wince/helpwce.h
	${HDR}/wx/msw/wince/libraries.h
	${HDR}/wx/msw/wince/missing.h
	${HDR}/wx/msw/wince/tbarwce.h
	${HDR}/wx/msw/wince/textctrlce.h
	${HDR}/wx/msw/wince/resources.h
)

# DFB_LOWLEVEL_SRC
set(WXFILES_DFB_LOWLEVEL_SRC
	${SRC}/src/common/fontmgrcmn.cpp
	${SRC}/src/generic/caret.cpp
	${SRC}/src/generic/colour.cpp
	${SRC}/src/generic/icon.cpp
	${SRC}/src/generic/imaglist.cpp
	${SRC}/src/generic/mask.cpp
	${SRC}/src/generic/textmeasure.cpp
	${SRC}/src/dfb/app.cpp
	${SRC}/src/dfb/bitmap.cpp
	${SRC}/src/dfb/brush.cpp
	${SRC}/src/dfb/cursor.cpp
	${SRC}/src/dfb/dc.cpp
	${SRC}/src/dfb/dcclient.cpp
	${SRC}/src/dfb/dcmemory.cpp
	${SRC}/src/dfb/dcscreen.cpp
	${SRC}/src/dfb/evtloop.cpp
	${SRC}/src/dfb/font.cpp
	${SRC}/src/dfb/fontenum.cpp
	${SRC}/src/dfb/fontmgr.cpp
	${SRC}/src/dfb/nonownedwnd.cpp
	${SRC}/src/dfb/overlay.cpp
	${SRC}/src/dfb/pen.cpp
	${SRC}/src/dfb/region.cpp
	${SRC}/src/dfb/settings.cpp
	${SRC}/src/dfb/toplevel.cpp
	${SRC}/src/dfb/utils.cpp
	${SRC}/src/dfb/window.cpp
	${SRC}/src/dfb/wrapdfb.cpp
)

# DFB_LOWLEVEL_HDR
set(WXFILES_DFB_LOWLEVEL_HDR
	${HDR}/wx/generic/caret.h
	${HDR}/wx/generic/colour.h
	${HDR}/wx/generic/icon.h
	${HDR}/wx/generic/imaglist.h
	${HDR}/wx/generic/mask.h
	${HDR}/wx/dfb/app.h
	${HDR}/wx/dfb/bitmap.h
	${HDR}/wx/dfb/brush.h
	${HDR}/wx/dfb/chkconf.h
	${HDR}/wx/dfb/cursor.h
	${HDR}/wx/dfb/dc.h
	${HDR}/wx/dfb/dcclient.h
	${HDR}/wx/dfb/dcmemory.h
	${HDR}/wx/dfb/dcscreen.h
	${HDR}/wx/dfb/dfbptr.h
	${HDR}/wx/dfb/evtloop.h
	${HDR}/wx/dfb/font.h
	${HDR}/wx/dfb/nonownedwnd.h
	${HDR}/wx/dfb/pen.h
	${HDR}/wx/dfb/popupwin.h
	${HDR}/wx/dfb/private.h
	${HDR}/wx/dfb/region.h
	${HDR}/wx/dfb/toplevel.h
	${HDR}/wx/dfb/window.h
	${HDR}/wx/dfb/wrapdfb.h
)

# OS2_LOWLEVEL_SRC
set(WXFILES_OS2_LOWLEVEL_SRC
)

# OS2_LOWLEVEL_HDR
set(WXFILES_OS2_LOWLEVEL_HDR
)

# OS2_SRC
set(WXFILES_OS2_SRC
	${SRC}/src/generic/caret.cpp
	${SRC}/src/generic/clrpickerg.cpp
	${SRC}/src/generic/collpaneg.cpp
	${SRC}/src/generic/colrdlgg.cpp
	${SRC}/src/generic/dirdlgg.cpp
	${SRC}/src/generic/fdrepdlg.cpp
	${SRC}/src/generic/filepickerg.cpp
	${SRC}/src/generic/fontpickerg.cpp
	${SRC}/src/generic/imaglist.cpp
	${SRC}/src/generic/listctrl.cpp
	${SRC}/src/generic/mdig.cpp
	${SRC}/src/generic/prntdlgg.cpp
	${SRC}/src/generic/statusbr.cpp
	${SRC}/src/generic/textmeasure.cpp
	${SRC}/src/os2/accel.cpp
	${SRC}/src/os2/app.cpp
	${SRC}/src/os2/bitmap.cpp
	${SRC}/src/os2/bmpbuttn.cpp
	${SRC}/src/os2/brush.cpp
	${SRC}/src/os2/button.cpp
	${SRC}/src/os2/checkbox.cpp
	${SRC}/src/os2/checklst.cpp
	${SRC}/src/os2/choice.cpp
	${SRC}/src/os2/clipbrd.cpp
	${SRC}/src/os2/colour.cpp
	${SRC}/src/os2/combobox.cpp
	${SRC}/src/os2/control.cpp
	${SRC}/src/os2/cursor.cpp
	${SRC}/src/os2/data.cpp
	${SRC}/src/os2/dataobj.cpp
	${SRC}/src/os2/dc.cpp
	${SRC}/src/os2/dcclient.cpp
	${SRC}/src/os2/dcmemory.cpp
	${SRC}/src/os2/dcprint.cpp
	${SRC}/src/os2/dcscreen.cpp
	${SRC}/src/os2/dialog.cpp
	${SRC}/src/os2/dnd.cpp
	${SRC}/src/os2/evtloop.cpp
	${SRC}/src/os2/filedlg.cpp
	${SRC}/src/os2/font.cpp
	${SRC}/src/os2/fontdlg.cpp
	${SRC}/src/os2/fontenum.cpp
	${SRC}/src/os2/fontutil.cpp
	${SRC}/src/os2/frame.cpp
	${SRC}/src/os2/gauge.cpp
	${SRC}/src/os2/gdiimage.cpp
	${SRC}/src/os2/sockpm.cpp
	${SRC}/src/os2/helpwin.cpp
	${SRC}/src/os2/icon.cpp
	${SRC}/src/os2/iniconf.cpp
	${SRC}/src/os2/listbox.cpp
	${SRC}/src/os2/main.cpp
	${SRC}/src/os2/menu.cpp
	${SRC}/src/os2/menuitem.cpp
	${SRC}/src/os2/metafile.cpp
	${SRC}/src/os2/minifram.cpp
	${SRC}/src/os2/msgdlg.cpp
	${SRC}/src/os2/nativdlg.cpp
	${SRC}/src/os2/notebook.cpp
	${SRC}/src/os2/ownerdrw.cpp
	${SRC}/src/os2/palette.cpp
	${SRC}/src/os2/pen.cpp
	${SRC}/src/os2/popupwin.cpp
	${SRC}/src/os2/print.cpp
	${SRC}/src/os2/radiobox.cpp
	${SRC}/src/os2/radiobut.cpp
	${SRC}/src/os2/region.cpp
	${SRC}/src/os2/scrolbar.cpp
	${SRC}/src/os2/settings.cpp
	${SRC}/src/os2/slider.cpp
	${SRC}/src/os2/spinbutt.cpp
	${SRC}/src/os2/spinctrl.cpp
	${SRC}/src/os2/statbmp.cpp
	${SRC}/src/os2/statbox.cpp
	${SRC}/src/os2/statline.cpp
	${SRC}/src/os2/stattext.cpp
	${SRC}/src/os2/textctrl.cpp
	${SRC}/src/os2/textentry.cpp
	${SRC}/src/os2/tglbtn.cpp
	${SRC}/src/os2/timer.cpp
	${SRC}/src/os2/toolbar.cpp
	${SRC}/src/os2/tooltip.cpp
	${SRC}/src/os2/toplevel.cpp
	${SRC}/src/os2/utilsgui.cpp
	${SRC}/src/os2/window.cpp
)

# OS2_HDR
set(WXFILES_OS2_HDR
	${HDR}/wx/generic/caret.h
	${HDR}/wx/generic/clrpickerg.h
	${HDR}/wx/generic/collpaneg.h
	${HDR}/wx/generic/colrdlgg.h
	${HDR}/wx/generic/dirdlgg.h
	${HDR}/wx/generic/fdrepdlg.h
	${HDR}/wx/generic/listctrl.h
	${HDR}/wx/generic/mdig.h
	${HDR}/wx/generic/statusbr.h
	${HDR}/wx/os2/accel.h
	${HDR}/wx/os2/app.h
	${HDR}/wx/os2/bitmap.h
	${HDR}/wx/os2/bmpbuttn.h
	${HDR}/wx/os2/brush.h
	${HDR}/wx/os2/button.h
	${HDR}/wx/os2/checkbox.h
	${HDR}/wx/os2/checklst.h
	${HDR}/wx/os2/choice.h
	${HDR}/wx/os2/clipbrd.h
	${HDR}/wx/os2/colour.h
	${HDR}/wx/os2/combobox.h
	${HDR}/wx/os2/control.h
	${HDR}/wx/os2/cursor.h
	${HDR}/wx/os2/dataform.h
	${HDR}/wx/os2/dataobj.h
	${HDR}/wx/os2/dataobj2.h
	${HDR}/wx/os2/dc.h
	${HDR}/wx/os2/dcclient.h
	${HDR}/wx/os2/dcmemory.h
	${HDR}/wx/os2/dcprint.h
	${HDR}/wx/os2/dcscreen.h
	${HDR}/wx/os2/dialog.h
	${HDR}/wx/os2/dnd.h
	${HDR}/wx/os2/filedlg.h
	${HDR}/wx/os2/font.h
	${HDR}/wx/os2/fontdlg.h
	${HDR}/wx/os2/frame.h
	${HDR}/wx/os2/gauge.h
	${HDR}/wx/os2/gdiimage.h
	${HDR}/wx/os2/helpwin.h
	${HDR}/wx/os2/icon.h
	${HDR}/wx/os2/iniconf.h
	${HDR}/wx/os2/listbox.h
	${HDR}/wx/os2/menu.h
	${HDR}/wx/os2/menuitem.h
	${HDR}/wx/os2/metafile.h
	${HDR}/wx/os2/minifram.h
	${HDR}/wx/os2/msgdlg.h
	${HDR}/wx/os2/notebook.h
	${HDR}/wx/os2/ownerdrw.h
	${HDR}/wx/os2/palette.h
	${HDR}/wx/os2/pen.h
	${HDR}/wx/os2/pnghand.h
	${HDR}/wx/os2/pngread.h
	${HDR}/wx/os2/print.h
	${HDR}/wx/os2/radiobox.h
	${HDR}/wx/os2/radiobut.h
	${HDR}/wx/os2/region.h
	${HDR}/wx/os2/scrolbar.h
	${HDR}/wx/os2/settings.h
	${HDR}/wx/os2/slider.h
	${HDR}/wx/os2/spinbutt.h
	${HDR}/wx/os2/spinctrl.h
	${HDR}/wx/os2/statbmp.h
	${HDR}/wx/os2/statbox.h
	${HDR}/wx/os2/statline.h
	${HDR}/wx/os2/stattext.h
	${HDR}/wx/os2/textctrl.h
	${HDR}/wx/os2/textentry.h
	${HDR}/wx/os2/tglbtn.h
	${HDR}/wx/os2/toolbar.h
	${HDR}/wx/os2/tooltip.h
	${HDR}/wx/os2/toplevel.h
	${HDR}/wx/os2/window.h
)

# OSX_LOWLEVEL_SRC
set(WXFILES_OSX_LOWLEVEL_SRC
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_OSX_LOWLEVEL_SRC
			${SRC}/src/osx/artmac.cpp
			${SRC}/src/osx/brush.cpp
			${SRC}/src/osx/dialog_osx.cpp
			${SRC}/src/osx/fontutil.cpp
			${SRC}/src/osx/imaglist.cpp
			${SRC}/src/osx/minifram.cpp
			${SRC}/src/osx/nonownedwnd_osx.cpp
			${SRC}/src/osx/palette.cpp
			${SRC}/src/osx/pen.cpp
			${SRC}/src/osx/toplevel_osx.cpp
			${SRC}/src/osx/uiaction_osx.cpp
			${SRC}/src/osx/utils_osx.cpp
			${SRC}/src/osx/window_osx.cpp
			${SRC}/src/osx/core/bitmap.cpp
			${SRC}/src/osx/core/colour.cpp
			${SRC}/src/osx/core/dcmemory.cpp
			${SRC}/src/osx/core/display.cpp
			${SRC}/src/osx/core/fontenum.cpp
			${SRC}/src/osx/core/hid.cpp
			${SRC}/src/osx/core/printmac.cpp
			${SRC}/src/osx/core/timer.cpp
			${SRC}/src/osx/core/utilsexc_cf.cpp
		)
	endif ()

# OSX_LOWLEVEL_HDR
set(WXFILES_OSX_LOWLEVEL_HDR
)

# OSX_CARBON_COCOA_SRC
set(WXFILES_OSX_CARBON_COCOA_SRC
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_OSX_CARBON_COCOA_SRC
			${SRC}/src/osx/anybutton_osx.cpp
			${SRC}/src/osx/bmpbuttn_osx.cpp
			${SRC}/src/osx/button_osx.cpp
			${SRC}/src/osx/checkbox_osx.cpp
			${SRC}/src/osx/checklst_osx.cpp
			${SRC}/src/osx/choice_osx.cpp
			${SRC}/src/osx/combobox_osx.cpp
			${SRC}/src/osx/dnd_osx.cpp
			${SRC}/src/osx/gauge_osx.cpp
			${SRC}/src/osx/listbox_osx.cpp
			${SRC}/src/osx/menu_osx.cpp
			${SRC}/src/osx/menuitem_osx.cpp
			${SRC}/src/osx/notebook_osx.cpp
			${SRC}/src/osx/printdlg_osx.cpp
			${SRC}/src/osx/radiobox_osx.cpp
			${SRC}/src/osx/radiobut_osx.cpp
			${SRC}/src/osx/scrolbar_osx.cpp
			${SRC}/src/osx/slider_osx.cpp
			${SRC}/src/osx/spinbutt_osx.cpp
			${SRC}/src/osx/srchctrl_osx.cpp
			${SRC}/src/osx/statbox_osx.cpp
			${SRC}/src/osx/statline_osx.cpp
			${SRC}/src/osx/stattext_osx.cpp
			${SRC}/src/osx/textentry_osx.cpp
			${SRC}/src/osx/textctrl_osx.cpp
			${SRC}/src/osx/tglbtn_osx.cpp
			${SRC}/src/osx/toolbar_osx.cpp
			${SRC}/src/html/htmlctrl/webkit/webkit.mm
			${SRC}/src/osx/carbon/colordlgosx.mm
			${SRC}/src/osx/carbon/fontdlgosx.mm
			${SRC}/src/osx/accel.cpp
			${SRC}/src/osx/carbon/clipbrd.cpp
			${SRC}/src/osx/carbon/cursor.cpp
			${SRC}/src/osx/carbon/fontdlg.cpp
			${SRC}/src/osx/carbon/gdiobj.cpp
			${SRC}/src/osx/carbon/icon.cpp
			${SRC}/src/osx/carbon/app.cpp
			${SRC}/src/osx/carbon/combobox.cpp
			${SRC}/src/osx/carbon/control.cpp
			${SRC}/src/osx/carbon/dataobj.cpp
			${SRC}/src/osx/carbon/dcclient.cpp
			${SRC}/src/osx/carbon/dcprint.cpp
			${SRC}/src/osx/carbon/dcscreen.cpp
			${SRC}/src/osx/core/glgrab.cpp
			${SRC}/src/osx/carbon/graphics.cpp
			${SRC}/src/osx/carbon/font.cpp
			${SRC}/src/osx/carbon/frame.cpp
			${SRC}/src/osx/carbon/mdi.cpp
			${SRC}/src/osx/carbon/metafile.cpp
			${SRC}/src/osx/carbon/overlay.cpp
			${SRC}/src/osx/carbon/popupwin.cpp
			${SRC}/src/osx/carbon/renderer.cpp
			${SRC}/src/osx/carbon/settings.cpp
			${SRC}/src/osx/carbon/statbrma.cpp
			${SRC}/src/osx/carbon/region.cpp
			${SRC}/src/osx/carbon/utilscocoa.mm
			${SRC}/src/generic/caret.cpp
			${SRC}/src/generic/clrpickerg.cpp
			${SRC}/src/generic/collpaneg.cpp
			${SRC}/src/generic/colrdlgg.cpp
			${SRC}/src/generic/dirdlgg.cpp
			${SRC}/src/generic/fdrepdlg.cpp
			${SRC}/src/generic/filedlgg.cpp
			${SRC}/src/generic/filepickerg.cpp
			${SRC}/src/generic/fontdlgg.cpp
			${SRC}/src/generic/fontpickerg.cpp
			${SRC}/src/generic/listctrl.cpp
			${SRC}/src/generic/prntdlgg.cpp
			${SRC}/src/generic/statusbr.cpp
			${SRC}/src/generic/textmeasure.cpp
		)
	endif ()

# OSX_SHARED_HDR
set(WXFILES_OSX_SHARED_HDR
	${HDR}/wx/html/webkit.h
	${HDR}/wx/osx/accel.h
	${HDR}/wx/osx/anybutton.h
	${HDR}/wx/osx/app.h
	${HDR}/wx/osx/bitmap.h
	${HDR}/wx/osx/bmpbuttn.h
	${HDR}/wx/osx/brush.h
	${HDR}/wx/osx/button.h
	${HDR}/wx/osx/checkbox.h
	${HDR}/wx/osx/checklst.h
	${HDR}/wx/osx/chkconf.h
	${HDR}/wx/osx/choice.h
	${HDR}/wx/osx/clipbrd.h
	${HDR}/wx/osx/colordlg.h
	${HDR}/wx/osx/colour.h
	${HDR}/wx/osx/combobox.h
	${HDR}/wx/osx/control.h
	${HDR}/wx/osx/cursor.h
	${HDR}/wx/osx/dataform.h
	${HDR}/wx/osx/dataobj.h
	${HDR}/wx/osx/dataobj2.h
	${HDR}/wx/osx/dc.h
	${HDR}/wx/osx/dcclient.h
	${HDR}/wx/osx/dcmemory.h
	${HDR}/wx/osx/dcprint.h
	${HDR}/wx/osx/dcscreen.h
	${HDR}/wx/osx/dialog.h
	${HDR}/wx/osx/dirdlg.h
	${HDR}/wx/osx/dnd.h
	${HDR}/wx/osx/evtloop.h
	${HDR}/wx/osx/evtloopsrc.h
	${HDR}/wx/osx/filedlg.h
	${HDR}/wx/osx/font.h
	${HDR}/wx/osx/fontdlg.h
	${HDR}/wx/osx/frame.h
	${HDR}/wx/osx/gauge.h
	${HDR}/wx/osx/helpxxxx.h
	${HDR}/wx/osx/icon.h
	${HDR}/wx/osx/imaglist.h
	${HDR}/wx/osx/listbox.h
	${HDR}/wx/osx/listctrl.h
	${HDR}/wx/osx/mdi.h
	${HDR}/wx/osx/menu.h
	${HDR}/wx/osx/menuitem.h
	${HDR}/wx/osx/metafile.h
	${HDR}/wx/osx/mimetype.h
	${HDR}/wx/osx/minifram.h
	${HDR}/wx/osx/msgdlg.h
	${HDR}/wx/osx/nonownedwnd.h
	${HDR}/wx/osx/notebook.h
	${HDR}/wx/osx/palette.h
	${HDR}/wx/osx/pen.h
	${HDR}/wx/osx/popupwin.h
	${HDR}/wx/osx/pnghand.h
	${HDR}/wx/osx/pngread.h
	${HDR}/wx/osx/printdlg.h
	${HDR}/wx/osx/printmac.h
	${HDR}/wx/osx/private.h
	${HDR}/wx/osx/radiobox.h
	${HDR}/wx/osx/radiobut.h
	${HDR}/wx/osx/region.h
	${HDR}/wx/osx/scrolbar.h
	${HDR}/wx/osx/slider.h
	${HDR}/wx/osx/spinbutt.h
	${HDR}/wx/osx/srchctrl.h
	${HDR}/wx/osx/statbmp.h
	${HDR}/wx/osx/statbox.h
	${HDR}/wx/osx/statline.h
	${HDR}/wx/osx/stattext.h
	${HDR}/wx/osx/statusbr.h
	${HDR}/wx/osx/taskbarosx.h
	${HDR}/wx/osx/textctrl.h
	${HDR}/wx/osx/textentry.h
	${HDR}/wx/osx/tglbtn.h
	${HDR}/wx/osx/toolbar.h
	${HDR}/wx/osx/tooltip.h
	${HDR}/wx/osx/toplevel.h
	${HDR}/wx/osx/treectrl.h
	${HDR}/wx/osx/uma.h
	${HDR}/wx/osx/window.h
	${HDR}/wx/generic/caret.h
	${HDR}/wx/generic/clrpickerg.h
	${HDR}/wx/generic/collpaneg.h
	${HDR}/wx/generic/colrdlgg.h
	${HDR}/wx/generic/dirdlgg.h
	${HDR}/wx/generic/fdrepdlg.h
	${HDR}/wx/generic/filedlgg.h
	${HDR}/wx/generic/filepickerg.h
	${HDR}/wx/generic/fontdlgg.h
	${HDR}/wx/generic/fontpickerg.h
	${HDR}/wx/generic/listctrl.h
	${HDR}/wx/generic/prntdlgg.h
	${HDR}/wx/generic/statusbr.h
)

# OSX_CARBON_SRC
set(WXFILES_OSX_CARBON_SRC
	${WXFILES_OSX_CARBON_COCOA_SRC}
	${SRC}/src/osx/carbon/anybutton.cpp
	${SRC}/src/osx/carbon/bmpbuttn.cpp
	${SRC}/src/osx/carbon/button.cpp
	${SRC}/src/osx/carbon/checkbox.cpp
	${SRC}/src/osx/carbon/choice.cpp
	${SRC}/src/osx/carbon/colordlg.cpp
	${SRC}/src/osx/carbon/dialog.cpp
	${SRC}/src/osx/carbon/dirdlg.cpp
	${SRC}/src/osx/carbon/dnd.cpp
	${SRC}/src/osx/carbon/evtloop.cpp
	${SRC}/src/osx/carbon/filedlg.cpp
	${SRC}/src/osx/carbon/gauge.cpp
	${SRC}/src/osx/carbon/listbox.cpp
	${SRC}/src/osx/carbon/listctrl_mac.cpp
	${SRC}/src/osx/carbon/menu.cpp
	${SRC}/src/osx/carbon/menuitem.cpp
	${SRC}/src/osx/carbon/msgdlg.cpp
	${SRC}/src/osx/carbon/nonownedwnd.cpp
	${SRC}/src/osx/carbon/notebmac.cpp
	${SRC}/src/osx/carbon/printdlg.cpp
	${SRC}/src/osx/carbon/radiobut.cpp
	${SRC}/src/osx/carbon/scrolbar.cpp
	${SRC}/src/osx/carbon/slider.cpp
	${SRC}/src/osx/carbon/spinbutt.cpp
	${SRC}/src/osx/carbon/srchctrl.cpp
	${SRC}/src/osx/carbon/statbmp.cpp
	${SRC}/src/osx/carbon/statbox.cpp
	${SRC}/src/osx/carbon/statlmac.cpp
	${SRC}/src/osx/carbon/stattext.cpp
	${SRC}/src/osx/carbon/textctrl.cpp
	${SRC}/src/osx/carbon/tglbtn.cpp
	${SRC}/src/osx/carbon/toolbar.cpp
	${SRC}/src/osx/carbon/tooltip.cpp
	${SRC}/src/osx/carbon/window.cpp
)

# OSX_CARBON_HDR
set(WXFILES_OSX_CARBON_HDR
	${HDR}/wx/osx/core/colour.h
	${HDR}/wx/osx/carbon/chkconf.h
	${HDR}/wx/osx/carbon/evtloop.h
	${HDR}/wx/osx/carbon/private.h
	${HDR}/wx/osx/carbon/region.h
	${HDR}/wx/osx/carbon/statbmp.h
	${HDR}/wx/osx/carbon/uma.h
)

# OSX_COCOA_SRC
set(WXFILES_OSX_COCOA_SRC
	${WXFILES_OSX_CARBON_COCOA_SRC}
	${SRC}/src/osx/cocoa/anybutton.mm
	${SRC}/src/osx/cocoa/button.mm
	${SRC}/src/osx/cocoa/checkbox.mm
	${SRC}/src/osx/cocoa/choice.mm
	${SRC}/src/osx/cocoa/colour.mm
	${SRC}/src/osx/cocoa/combobox.mm
	${SRC}/src/osx/cocoa/dialog.mm
	${SRC}/src/osx/cocoa/dirdlg.mm
	${SRC}/src/osx/cocoa/dnd.mm
	${SRC}/src/osx/cocoa/evtloop.mm
	${SRC}/src/osx/cocoa/filedlg.mm
	${SRC}/src/osx/cocoa/gauge.mm
	${SRC}/src/osx/cocoa/listbox.mm
	${SRC}/src/osx/cocoa/menu.mm
	${SRC}/src/osx/cocoa/menuitem.mm
	${SRC}/src/osx/cocoa/msgdlg.mm
	${SRC}/src/osx/cocoa/nonownedwnd.mm
	${SRC}/src/osx/cocoa/notebook.mm
	${SRC}/src/osx/cocoa/radiobut.mm
	${SRC}/src/osx/cocoa/preferences.mm
	${SRC}/src/osx/cocoa/printdlg.mm
	${SRC}/src/osx/cocoa/scrolbar.mm
	${SRC}/src/osx/cocoa/slider.mm
	${SRC}/src/osx/cocoa/spinbutt.mm
	${SRC}/src/osx/cocoa/srchctrl.mm
	${SRC}/src/osx/cocoa/statbox.mm
	${SRC}/src/osx/cocoa/statline.mm
	${SRC}/src/osx/cocoa/stattext.mm
	${SRC}/src/osx/cocoa/textctrl.mm
	${SRC}/src/osx/cocoa/tglbtn.mm
	${SRC}/src/osx/cocoa/toolbar.mm
	${SRC}/src/osx/cocoa/tooltip.mm
	${SRC}/src/osx/cocoa/window.mm
)

# OSX_COCOA_HDR
set(WXFILES_OSX_COCOA_HDR
	${HDR}/wx/osx/cocoa/chkconf.h
	${HDR}/wx/osx/cocoa/evtloop.h
	${HDR}/wx/osx/cocoa/private.h
	${WXFILES_OSX_CARBON_HDR}
	${HDR}/wx/generic/region.h
)

# OSX_IPHONE_SRC
set(WXFILES_OSX_IPHONE_SRC
	${WXFILES_OSX_CARBON_COCOA_SRC}
	${SRC}/src/generic/regiong.cpp
	${SRC}/src/generic/icon.cpp
	${SRC}/src/osx/iphone/anybutton.mm
	${SRC}/src/osx/iphone/button.mm
	${SRC}/src/osx/iphone/checkbox.mm
	${SRC}/src/osx/iphone/dialog.mm
	${SRC}/src/osx/iphone/evtloop.mm
	${SRC}/src/osx/iphone/gauge.mm
	${SRC}/src/osx/iphone/msgdlg.mm
	${SRC}/src/osx/iphone/nonownedwnd.mm
	${SRC}/src/osx/iphone/scrolbar.mm
	${SRC}/src/osx/iphone/slider.mm
	${SRC}/src/osx/iphone/stattext.mm
	${SRC}/src/osx/iphone/textctrl.mm
	${SRC}/src/osx/iphone/toolbar.mm
	${SRC}/src/osx/iphone/utils.mm
	${SRC}/src/osx/iphone/window.mm
)

# OSX_IPHONE_HDR
set(WXFILES_OSX_IPHONE_HDR
	${HDR}/wx/osx/iphone/chkconf.h
	${HDR}/wx/osx/iphone/evtloop.h
	${HDR}/wx/osx/iphone/private.h
	${WXFILES_OSX_CARBON_HDR}
	${HDR}/wx/generic/region.h
)

# COCOA_LOWLEVEL_SRC
set(WXFILES_COCOA_LOWLEVEL_SRC
	${SRC}/src/osx/core/hid.cpp
	${SRC}/src/osx/core/utilsexc_cf.cpp
)

# COCOA_LOWLEVEL_HDR
set(WXFILES_COCOA_LOWLEVEL_HDR
)

# COCOA_SRC
set(WXFILES_COCOA_SRC
	${SRC}/src/cocoa/NSBox.mm
	${SRC}/src/cocoa/NSButton.mm
	${SRC}/src/cocoa/NSControl.mm
	${SRC}/src/cocoa/NSMenu.mm
	${SRC}/src/cocoa/NSPanel.mm
	${SRC}/src/cocoa/NSScroller.mm
	${SRC}/src/cocoa/NSSlider.mm
	${SRC}/src/cocoa/NSTabView.mm
	${SRC}/src/cocoa/NSTableView.mm
	${SRC}/src/cocoa/NSTextField.mm
	${SRC}/src/cocoa/NSView.mm
	${SRC}/src/cocoa/NSWindow.mm
	${SRC}/src/cocoa/ObjcRef.mm
	${SRC}/src/cocoa/app.mm
	${SRC}/src/cocoa/bitmap.mm
	${SRC}/src/cocoa/bmpbuttn.mm
	${SRC}/src/cocoa/brush.mm
	${SRC}/src/cocoa/button.mm
	${SRC}/src/cocoa/checkbox.mm
	${SRC}/src/cocoa/checklst.mm
	${SRC}/src/cocoa/choice.mm
	${SRC}/src/cocoa/clipbrd.mm
	${SRC}/src/cocoa/colordlg.mm
	${SRC}/src/cocoa/colour.mm
	${SRC}/src/cocoa/combobox.mm
	${SRC}/src/cocoa/control.mm
	${SRC}/src/cocoa/cursor.mm
	${SRC}/src/cocoa/data.cpp
	${SRC}/src/cocoa/dataobj.mm
	${SRC}/src/cocoa/dc.mm
	${SRC}/src/cocoa/dcclient.mm
	${SRC}/src/cocoa/dcmemory.mm
	${SRC}/src/cocoa/dcscreen.cpp
	${SRC}/src/cocoa/dialog.mm
	${SRC}/src/cocoa/dirdlg.mm
	${SRC}/src/cocoa/display.mm
	${SRC}/src/cocoa/drawer.mm
	${SRC}/src/cocoa/evtloop.mm
	${SRC}/src/cocoa/filedlg.mm
	${SRC}/src/cocoa/font.mm
	${SRC}/src/cocoa/fontdlg.mm
	${SRC}/src/cocoa/fontenum.mm
	${SRC}/src/cocoa/fontutil.cpp
	${SRC}/src/cocoa/frame.mm
	${SRC}/src/cocoa/gauge.mm
	${SRC}/src/cocoa/icon.mm
	${SRC}/src/cocoa/listbox.mm
	${SRC}/src/cocoa/main.cpp
	${SRC}/src/cocoa/mbarman.mm
	${SRC}/src/cocoa/mdi.mm
	${SRC}/src/cocoa/menu.mm
	${SRC}/src/cocoa/menuitem.mm
	${SRC}/src/cocoa/msgdlg.mm
	${SRC}/src/cocoa/notebook.mm
	${SRC}/src/cocoa/pen.mm
	${SRC}/src/cocoa/radiobox.mm
	${SRC}/src/cocoa/radiobut.mm
	${SRC}/src/cocoa/region.mm
	${SRC}/src/cocoa/scrolbar.mm
	${SRC}/src/cocoa/settings.mm
	${SRC}/src/cocoa/slider.mm
	${SRC}/src/cocoa/sound.mm
	${SRC}/src/cocoa/spinbutt.mm
	${SRC}/src/cocoa/statbmp.mm
	${SRC}/src/cocoa/statbox.mm
	${SRC}/src/cocoa/statline2.mm
	${SRC}/src/cocoa/stattext.mm
	${SRC}/src/cocoa/textctrl.mm
	${SRC}/src/cocoa/timer.mm
	${SRC}/src/cocoa/toolbar.mm
	${SRC}/src/cocoa/tooltip.mm
	${SRC}/src/cocoa/toplevel.mm
	${SRC}/src/cocoa/utils.mm
	${SRC}/src/cocoa/utilsexc.mm
	${SRC}/src/cocoa/window.mm
	${SRC}/src/generic/accel.cpp
	${SRC}/src/generic/caret.cpp
	${SRC}/src/generic/clrpickerg.cpp
	${SRC}/src/generic/collpaneg.cpp
	${SRC}/src/generic/colrdlgg.cpp
	${SRC}/src/generic/fdrepdlg.cpp
	${SRC}/src/generic/filepickerg.cpp
	${SRC}/src/generic/fontdlgg.cpp
	${SRC}/src/generic/fontpickerg.cpp
	${SRC}/src/generic/imaglist.cpp
	${SRC}/src/generic/listctrl.cpp
	${SRC}/src/generic/paletteg.cpp
	${SRC}/src/generic/regiong.cpp
	${SRC}/src/generic/statusbr.cpp
	${SRC}/src/generic/textmeasure.cpp
)

# COCOA_HDR
set(WXFILES_COCOA_HDR
	${HDR}/wx/cocoa/NSApplication.h
	${HDR}/wx/cocoa/NSBox.h
	${HDR}/wx/cocoa/NSButton.h
	${HDR}/wx/cocoa/NSControl.h
	${HDR}/wx/cocoa/NSMenu.h
	${HDR}/wx/cocoa/NSPanel.h
	${HDR}/wx/cocoa/NSScroller.h
	${HDR}/wx/cocoa/NSSlider.h
	${HDR}/wx/cocoa/NSTabView.h
	${HDR}/wx/cocoa/NSTableView.h
	${HDR}/wx/cocoa/NSTextField.h
	${HDR}/wx/cocoa/NSView.h
	${HDR}/wx/cocoa/NSWindow.h
	${HDR}/wx/cocoa/ObjcAssociate.h
	${HDR}/wx/cocoa/ObjcPose.h
	${HDR}/wx/cocoa/ObjcRef.h
	${HDR}/wx/cocoa/app.h
	${HDR}/wx/cocoa/bitmap.h
	${HDR}/wx/cocoa/bmpbuttn.h
	${HDR}/wx/cocoa/brush.h
	${HDR}/wx/cocoa/button.h
	${HDR}/wx/cocoa/checkbox.h
	${HDR}/wx/cocoa/checklst.h
	${HDR}/wx/cocoa/choice.h
	${HDR}/wx/cocoa/clipbrd.h
	${HDR}/wx/cocoa/colordlg.h
	${HDR}/wx/cocoa/colour.h
	${HDR}/wx/cocoa/combobox.h
	${HDR}/wx/cocoa/control.h
	${HDR}/wx/cocoa/cursor.h
	${HDR}/wx/cocoa/dataform.h
	${HDR}/wx/cocoa/dataobj.h
	${HDR}/wx/cocoa/dataobj2.h
	${HDR}/wx/cocoa/dc.h
	${HDR}/wx/cocoa/dcclient.h
	${HDR}/wx/cocoa/dcmemory.h
	${HDR}/wx/cocoa/dcscreen.h
	${HDR}/wx/cocoa/dialog.h
	${HDR}/wx/cocoa/dirdlg.h
	${HDR}/wx/cocoa/drawer.h
	${HDR}/wx/cocoa/evtloop.h
	${HDR}/wx/cocoa/filedlg.h
	${HDR}/wx/cocoa/font.h
	${HDR}/wx/cocoa/fontdlg.h
	${HDR}/wx/cocoa/frame.h
	${HDR}/wx/cocoa/gauge.h
	${HDR}/wx/cocoa/icon.h
	${HDR}/wx/cocoa/listbox.h
	${HDR}/wx/cocoa/log.h
	${HDR}/wx/cocoa/mbarman.h
	${HDR}/wx/cocoa/mdi.h
	${HDR}/wx/cocoa/menu.h
	${HDR}/wx/cocoa/menuitem.h
	${HDR}/wx/cocoa/msgdlg.h
	${HDR}/wx/cocoa/notebook.h
	${HDR}/wx/cocoa/pen.h
	${HDR}/wx/cocoa/radiobox.h
	${HDR}/wx/cocoa/radiobut.h
	${HDR}/wx/cocoa/region.h
	${HDR}/wx/cocoa/scrolbar.h
	${HDR}/wx/cocoa/slider.h
	${HDR}/wx/cocoa/sound.h
	${HDR}/wx/cocoa/spinbutt.h
	${HDR}/wx/cocoa/statbmp.h
	${HDR}/wx/cocoa/statbox.h
	${HDR}/wx/cocoa/statline.h
	${HDR}/wx/cocoa/stattext.h
	${HDR}/wx/cocoa/textctrl.h
	${HDR}/wx/cocoa/toolbar.h
	${HDR}/wx/cocoa/tooltip.h
	${HDR}/wx/cocoa/toplevel.h
	${HDR}/wx/cocoa/window.h
	${HDR}/wx/cocoa/objc/objc_uniquifying.h
	${HDR}/wx/generic/caret.h
	${HDR}/wx/generic/clrpickerg.h
	${HDR}/wx/generic/collpaneg.h
	${HDR}/wx/generic/fdrepdlg.h
	${HDR}/wx/generic/fontdlgg.h
	${HDR}/wx/generic/fontpickerg.h
	${HDR}/wx/generic/imaglist.h
	${HDR}/wx/generic/listctrl.h
	${HDR}/wx/generic/paletteg.h
	${HDR}/wx/generic/region.h
	${HDR}/wx/generic/statusbr.h
)

# UNIV_THEMES_SRC
set(WXFILES_UNIV_THEMES_SRC
	${SRC}/src/univ/themes/gtk.cpp
	${SRC}/src/univ/themes/metal.cpp
	${SRC}/src/univ/themes/mono.cpp
	${SRC}/src/univ/themes/win32.cpp
)

# UNIV_PLATFORM_SRC
set(WXFILES_UNIV_PLATFORM_SRC
)
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_UNIV_PLATFORM_SRC
			${SRC}/src/msw/evtloop.cpp
		)
	endif ()

# UNIV_PLATFORM_HDR
set(WXFILES_UNIV_PLATFORM_HDR
)
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_UNIV_PLATFORM_HDR
			${HDR}/wx/msw/evtloop.h
		)
	endif ()

# UNIV_SRC
set(WXFILES_UNIV_SRC
	${WXFILES_UNIV_PLATFORM_SRC}
	${SRC}/src/generic/accel.cpp
	${SRC}/src/generic/clrpickerg.cpp
	${SRC}/src/generic/collpaneg.cpp
	${SRC}/src/generic/colrdlgg.cpp
	${SRC}/src/generic/dirdlgg.cpp
	${SRC}/src/generic/fdrepdlg.cpp
	${SRC}/src/generic/filedlgg.cpp
	${SRC}/src/generic/filepickerg.cpp
	${SRC}/src/generic/fontdlgg.cpp
	${SRC}/src/generic/fontpickerg.cpp
	${SRC}/src/generic/listctrl.cpp
	${SRC}/src/generic/mdig.cpp
	${SRC}/src/generic/prntdlgg.cpp
	${SRC}/src/univ/bmpbuttn.cpp
	${SRC}/src/univ/button.cpp
	${SRC}/src/univ/checkbox.cpp
	${SRC}/src/univ/checklst.cpp
	${SRC}/src/univ/choice.cpp
	${SRC}/src/univ/combobox.cpp
	${SRC}/src/univ/control.cpp
	${SRC}/src/univ/ctrlrend.cpp
	${SRC}/src/univ/dialog.cpp
	${SRC}/src/univ/framuniv.cpp
	${SRC}/src/univ/gauge.cpp
	${SRC}/src/univ/inpcons.cpp
	${SRC}/src/univ/inphand.cpp
	${SRC}/src/univ/listbox.cpp
	${SRC}/src/univ/menu.cpp
	${SRC}/src/univ/notebook.cpp
	${SRC}/src/univ/radiobox.cpp
	${SRC}/src/univ/radiobut.cpp
	${SRC}/src/univ/scrarrow.cpp
	${SRC}/src/univ/scrolbar.cpp
	${SRC}/src/univ/scrthumb.cpp
	${SRC}/src/univ/settingsuniv.cpp
	${SRC}/src/univ/slider.cpp
	${SRC}/src/univ/spinbutt.cpp
	${SRC}/src/univ/statbmp.cpp
	${SRC}/src/univ/statbox.cpp
	${SRC}/src/univ/statline.cpp
	${SRC}/src/univ/stattext.cpp
	${SRC}/src/univ/statusbr.cpp
	${SRC}/src/univ/stdrend.cpp
	${SRC}/src/univ/textctrl.cpp
	${SRC}/src/univ/tglbtn.cpp
	${SRC}/src/univ/theme.cpp
	${SRC}/src/univ/toolbar.cpp
	${SRC}/src/univ/topluniv.cpp
	${SRC}/src/univ/winuniv.cpp
)

# UNIV_HDR
set(WXFILES_UNIV_HDR
	${WXFILES_UNIV_PLATFORM_HDR}
	${HDR}/wx/generic/accel.h
	${HDR}/wx/generic/animate.h
	${HDR}/wx/generic/clrpickerg.h
	${HDR}/wx/generic/collpaneg.h
	${HDR}/wx/generic/ctrlsub.h
	${HDR}/wx/generic/dirdlgg.h
	${HDR}/wx/generic/fdrepdlg.h
	${HDR}/wx/generic/filedlgg.h
	${HDR}/wx/generic/filepickerg.h
	${HDR}/wx/generic/fontdlgg.h
	${HDR}/wx/generic/fontpickerg.h
	${HDR}/wx/generic/listctrl.h
	${HDR}/wx/generic/mdig.h
	${HDR}/wx/generic/statusbr.h
	${HDR}/wx/univ/anybutton.h
	${HDR}/wx/univ/app.h
	${HDR}/wx/univ/bmpbuttn.h
	${HDR}/wx/univ/button.h
	${HDR}/wx/univ/checkbox.h
	${HDR}/wx/univ/checklst.h
	${HDR}/wx/univ/chkconf.h
	${HDR}/wx/univ/choice.h
	${HDR}/wx/univ/colschem.h
	${HDR}/wx/univ/combobox.h
	${HDR}/wx/univ/control.h
	${HDR}/wx/univ/custombgwin.h
	${HDR}/wx/univ/dialog.h
	${HDR}/wx/univ/frame.h
	${HDR}/wx/univ/gauge.h
	${HDR}/wx/univ/inpcons.h
	${HDR}/wx/univ/inphand.h
	${HDR}/wx/univ/listbox.h
	${HDR}/wx/univ/menu.h
	${HDR}/wx/univ/menuitem.h
	${HDR}/wx/univ/notebook.h
	${HDR}/wx/univ/panel.h
	${HDR}/wx/univ/radiobox.h
	${HDR}/wx/univ/radiobut.h
	${HDR}/wx/univ/renderer.h
	${HDR}/wx/univ/scrarrow.h
	${HDR}/wx/univ/scrolbar.h
	${HDR}/wx/univ/scrthumb.h
	${HDR}/wx/univ/scrtimer.h
	${HDR}/wx/univ/slider.h
	${HDR}/wx/univ/spinbutt.h
	${HDR}/wx/univ/statbmp.h
	${HDR}/wx/univ/statbox.h
	${HDR}/wx/univ/statline.h
	${HDR}/wx/univ/stattext.h
	${HDR}/wx/univ/statusbr.h
	${HDR}/wx/univ/stdrend.h
	${HDR}/wx/univ/textctrl.h
	${HDR}/wx/univ/theme.h
	${HDR}/wx/univ/tglbtn.h
	${HDR}/wx/univ/toolbar.h
	${HDR}/wx/univ/toplevel.h
	${HDR}/wx/univ/window.h
)

# ADVANCED_CMN_SRC
set(WXFILES_ADVANCED_CMN_SRC
	${SRC}/src/common/animatecmn.cpp
	${SRC}/src/common/bmpcboxcmn.cpp
	${SRC}/src/common/calctrlcmn.cpp
	${SRC}/src/common/datavcmn.cpp
	${SRC}/src/common/gridcmn.cpp
	${SRC}/src/common/hyperlnkcmn.cpp
	${SRC}/src/common/odcombocmn.cpp
	${SRC}/src/common/richtooltipcmn.cpp
	${SRC}/src/generic/aboutdlgg.cpp
	${SRC}/src/generic/bannerwindow.cpp
	${SRC}/src/generic/bmpcboxg.cpp
	${SRC}/src/generic/calctrlg.cpp
	${SRC}/src/generic/commandlinkbuttong.cpp
	${SRC}/src/generic/datavgen.cpp
	${SRC}/src/generic/datectlg.cpp
	${SRC}/src/generic/editlbox.cpp
	${SRC}/src/generic/grid.cpp
	${SRC}/src/generic/gridctrl.cpp
	${SRC}/src/generic/grideditors.cpp
	${SRC}/src/generic/gridsel.cpp
	${SRC}/src/generic/helpext.cpp
	${SRC}/src/generic/hyperlinkg.cpp
	${SRC}/src/generic/laywin.cpp
	${SRC}/src/generic/notifmsgg.cpp
	${SRC}/src/generic/odcombo.cpp
	${SRC}/src/generic/propdlg.cpp
	${SRC}/src/generic/richtooltipg.cpp
	${SRC}/src/generic/sashwin.cpp
	${SRC}/src/generic/splash.cpp
	${SRC}/src/generic/timectrlg.cpp
	${SRC}/src/generic/tipdlg.cpp
	${SRC}/src/generic/treelist.cpp
	${SRC}/src/generic/wizard.cpp
)

# ADVANCED_CMN_HDR
set(WXFILES_ADVANCED_CMN_HDR
	${HDR}/wx/aboutdlg.h
	${HDR}/wx/animate.h
	${HDR}/wx/bannerwindow.h
	${HDR}/wx/bmpcbox.h
	${HDR}/wx/calctrl.h
	${HDR}/wx/commandlinkbutton.h
	${HDR}/wx/dataview.h
	${HDR}/wx/datectrl.h
	${HDR}/wx/dateevt.h
	${HDR}/wx/datetimectrl.h
	${HDR}/wx/dcbuffer.h
	${HDR}/wx/dvrenderers.h
	${HDR}/wx/editlbox.h
	${HDR}/wx/generic/aboutdlgg.h
	${HDR}/wx/generic/bmpcbox.h
	${HDR}/wx/generic/calctrlg.h
	${HDR}/wx/generic/datectrl.h
	${HDR}/wx/generic/dataview.h
	${HDR}/wx/generic/dvrenderer.h
	${HDR}/wx/generic/dvrenderers.h
	${HDR}/wx/generic/grid.h
	${HDR}/wx/generic/gridctrl.h
	${HDR}/wx/generic/grideditors.h
	${HDR}/wx/generic/gridsel.h
	${HDR}/wx/generic/helpext.h
	${HDR}/wx/generic/hyperlink.h
	${HDR}/wx/generic/laywin.h
	${HDR}/wx/generic/notifmsg.h
	${HDR}/wx/generic/propdlg.h
	${HDR}/wx/generic/sashwin.h
	${HDR}/wx/generic/splash.h
	${HDR}/wx/generic/timectrl.h
	${HDR}/wx/generic/wizard.h
	${HDR}/wx/grid.h
	${HDR}/wx/hyperlink.h
	${HDR}/wx/joystick.h
	${HDR}/wx/laywin.h
	${HDR}/wx/notifmsg.h
	${HDR}/wx/odcombo.h
	${HDR}/wx/propdlg.h
	${HDR}/wx/richtooltip.h
	${HDR}/wx/sashwin.h
	${HDR}/wx/sound.h
	${HDR}/wx/splash.h
	${HDR}/wx/taskbar.h
	${HDR}/wx/timectrl.h
	${HDR}/wx/tipdlg.h
	${HDR}/wx/treelist.h
	${HDR}/wx/wizard.h
)

# ADVANCED_MSW_SRC
set(WXFILES_ADVANCED_MSW_SRC
	${SRC}/src/common/taskbarcmn.cpp
	${SRC}/src/msw/aboutdlg.cpp
	${SRC}/src/msw/notifmsg.cpp
	${SRC}/src/msw/richtooltip.cpp
	${SRC}/src/msw/sound.cpp
	${SRC}/src/msw/taskbar.cpp
)

# ADVANCED_MSW_HDR
set(WXFILES_ADVANCED_MSW_HDR
	${HDR}/wx/msw/notifmsg.h
	${HDR}/wx/msw/sound.h
	${HDR}/wx/msw/taskbar.h
)

# ADVANCED_MSW_NATIVE_SRC
set(WXFILES_ADVANCED_MSW_NATIVE_SRC
	${SRC}/src/generic/animateg.cpp
	${SRC}/src/msw/bmpcbox.cpp
	${SRC}/src/msw/calctrl.cpp
	${SRC}/src/msw/commandlinkbutton.cpp
	${SRC}/src/msw/datecontrols.cpp
	${SRC}/src/msw/datectrl.cpp
	${SRC}/src/msw/datetimectrl.cpp
	${SRC}/src/msw/hyperlink.cpp
	${SRC}/src/msw/timectrl.cpp
)

# ADVANCED_MSW_NATIVE_HDR
set(WXFILES_ADVANCED_MSW_NATIVE_HDR
	${HDR}/wx/generic/animate.h
	${HDR}/wx/msw/bmpcbox.h
	${HDR}/wx/msw/commandlinkbutton.h
	${HDR}/wx/msw/calctrl.h
	${HDR}/wx/msw/datectrl.h
	${HDR}/wx/msw/datetimectrl.h
	${HDR}/wx/msw/hyperlink.h
	${HDR}/wx/msw/timectrl.h
)

# ADVANCED_MSW_DESKTOP_SRC
set(WXFILES_ADVANCED_MSW_DESKTOP_SRC
	${SRC}/src/msw/joystick.cpp
)

# ADVANCED_MSW_DESKTOP_HDR
set(WXFILES_ADVANCED_MSW_DESKTOP_HDR
	${HDR}/wx/msw/joystick.h
)

# ADVANCED_OSX_CARBON_SRC
set(WXFILES_ADVANCED_OSX_CARBON_SRC
	${SRC}/src/common/taskbarcmn.cpp
	${SRC}/src/generic/animateg.cpp
	${SRC}/src/osx/carbon/aboutdlg.cpp
	${SRC}/src/osx/carbon/drawer.cpp
	${SRC}/src/osx/dataview_osx.cpp
	${SRC}/src/osx/carbon/dataview.cpp
	${SRC}/src/osx/sound_osx.cpp
	${SRC}/src/osx/carbon/sound.cpp
	${SRC}/src/osx/carbon/taskbar.cpp
	${SRC}/src/osx/core/hidjoystick.cpp
)

# ADVANCED_OSX_CARBON_HDR
set(WXFILES_ADVANCED_OSX_CARBON_HDR
	${HDR}/wx/generic/animate.h
	${HDR}/wx/osx/dataview.h
	${HDR}/wx/osx/dvrenderer.h
	${HDR}/wx/osx/dvrenderers.h
	${HDR}/wx/osx/joystick.h
	${HDR}/wx/osx/sound.h
	${HDR}/wx/osx/taskbarosx.h
	${HDR}/wx/osx/carbon/drawer.h
	${HDR}/wx/osx/carbon/dataview.h
	${HDR}/wx/osx/core/joystick.h
)

# ADVANCED_OSX_COCOA_SRC
set(WXFILES_ADVANCED_OSX_COCOA_SRC
	${SRC}/src/common/taskbarcmn.cpp
	${SRC}/src/generic/animateg.cpp
	${SRC}/src/osx/datetimectrl_osx.cpp
	${SRC}/src/osx/datectrl_osx.cpp
	${SRC}/src/osx/sound_osx.cpp
	${SRC}/src/osx/timectrl_osx.cpp
	${SRC}/src/osx/carbon/sound.cpp
	${SRC}/src/osx/core/sound.cpp
	${SRC}/src/osx/cocoa/aboutdlg.mm
	${SRC}/src/osx/dataview_osx.cpp
	${SRC}/src/osx/cocoa/dataview.mm
	${SRC}/src/osx/cocoa/datetimectrl.mm
	${SRC}/src/osx/cocoa/taskbar.mm
	${SRC}/src/osx/core/hidjoystick.cpp
)

# ADVANCED_OSX_COCOA_HDR
set(WXFILES_ADVANCED_OSX_COCOA_HDR
	${HDR}/wx/generic/animate.h
	${HDR}/wx/osx/dataview.h
	${HDR}/wx/osx/datectrl.h
	${HDR}/wx/osx/datetimectrl.h
	${HDR}/wx/osx/dvrenderer.h
	${HDR}/wx/osx/dvrenderers.h
	${HDR}/wx/osx/joystick.h
	${HDR}/wx/osx/sound.h
	${HDR}/wx/osx/taskbarosx.h
	${HDR}/wx/osx/timectrl.h
	${HDR}/wx/osx/core/joystick.h
	${HDR}/wx/osx/cocoa/dataview.h
)

# ADVANCED_OSX_IPHONE_SRC
set(WXFILES_ADVANCED_OSX_IPHONE_SRC
	${SRC}/src/generic/animateg.cpp
	${SRC}/src/osx/sound_osx.cpp
	${SRC}/src/osx/core/sound.cpp
)

# ADVANCED_OSX_IPHONE_HDR
set(WXFILES_ADVANCED_OSX_IPHONE_HDR
	${HDR}/wx/generic/animate.h
	${HDR}/wx/osx/sound.h
)

# ADVANCED_COCOA_SRC
set(WXFILES_ADVANCED_COCOA_SRC
	${SRC}/src/cocoa/taskbar.mm
	${SRC}/src/common/taskbarcmn.cpp
	${SRC}/src/generic/animateg.cpp
	${SRC}/src/osx/core/hidjoystick.cpp
)

# ADVANCED_COCOA_HDR
set(WXFILES_ADVANCED_COCOA_HDR
	${HDR}/wx/cocoa/taskbar.h
	${HDR}/wx/generic/animate.h
	${HDR}/wx/osx/core/joystick.h
)

# ADVANCED_OS2_SRC
set(WXFILES_ADVANCED_OS2_SRC
	${SRC}/src/generic/animateg.cpp
	${SRC}/src/os2/joystick.cpp
	${SRC}/src/os2/sound.cpp
)

# ADVANCED_OS2_HDR
set(WXFILES_ADVANCED_OS2_HDR
	${HDR}/wx/generic/animate.h
	${HDR}/wx/os2/joystick.h
	${HDR}/wx/os2/sound.h
)

# ADVANCED_UNIX_SRC
set(WXFILES_ADVANCED_UNIX_SRC
	${SRC}/src/common/taskbarcmn.cpp
	${SRC}/src/unix/joystick.cpp
	${SRC}/src/unix/sound.cpp
	${SRC}/src/unix/taskbarx11.cpp
)

# ADVANCED_UNIX_HDR
set(WXFILES_ADVANCED_UNIX_HDR
	${HDR}/wx/unix/joystick.h
	${HDR}/wx/unix/sound.h
	${HDR}/wx/unix/taskbarx11.h
)

# ADVANCED_MOTIF_SRC
set(WXFILES_ADVANCED_MOTIF_SRC
	${SRC}/src/generic/animateg.cpp
)

# ADVANCED_MOTIF_HDR
set(WXFILES_ADVANCED_MOTIF_HDR
	${HDR}/wx/generic/animate.h
)

# ADVANCED_GTK_WIN32_SRC
set(WXFILES_ADVANCED_GTK_WIN32_SRC
	${SRC}/src/common/taskbarcmn.cpp
	${SRC}/src/msw/joystick.cpp
	${SRC}/src/msw/sound.cpp
)

# ADVANCED_GTK_WIN32_HDR
set(WXFILES_ADVANCED_GTK_WIN32_HDR
	${HDR}/wx/msw/joystick.h
	${HDR}/wx/msw/sound.h
	${HDR}/wx/msw/taskbar.h
)

# ADVANCED_GTK_PLATFORM_SRC
set(WXFILES_ADVANCED_GTK_PLATFORM_SRC
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "unix")
		list(APPEND WXFILES_ADVANCED_GTK_PLATFORM_SRC
			${WXFILES_ADVANCED_UNIX_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_ADVANCED_GTK_PLATFORM_SRC
			${WXFILES_ADVANCED_UNIX_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "win32")
		list(APPEND WXFILES_ADVANCED_GTK_PLATFORM_SRC
			${WXFILES_ADVANCED_GTK_WIN32_SRC}
		)
	endif ()

# ADVANCED_GTK_PLATFORM_HDR
set(WXFILES_ADVANCED_GTK_PLATFORM_HDR
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "unix")
		list(APPEND WXFILES_ADVANCED_GTK_PLATFORM_HDR
			${WXFILES_ADVANCED_UNIX_HDR}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_ADVANCED_GTK_PLATFORM_HDR
			${WXFILES_ADVANCED_UNIX_HDR}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "win32")
		list(APPEND WXFILES_ADVANCED_GTK_PLATFORM_HDR
			${WXFILES_ADVANCED_GTK_WIN32_HDR}
		)
	endif ()

# ADVANCED_GTK_SRC
set(WXFILES_ADVANCED_GTK_SRC
	${WXFILES_ADVANCED_GTK_PLATFORM_SRC}
	${SRC}/src/gtk/notifmsg.cpp
	${SRC}/src/gtk/taskbar.cpp
)

# ADVANCED_GTK2_SRC
set(WXFILES_ADVANCED_GTK2_SRC
	${WXFILES_ADVANCED_GTK_SRC}
	${SRC}/src/gtk/eggtrayicon.c
	${SRC}/src/gtk/hildon/notifmsg.cpp
)

# ADVANCED_GTK_HDR
set(WXFILES_ADVANCED_GTK_HDR
	${WXFILES_ADVANCED_GTK_PLATFORM_HDR}
	${HDR}/wx/gtk/notifmsg.h
	${HDR}/wx/gtk/taskbar.h
)

# ADVANCED_GTK2_HDR
set(WXFILES_ADVANCED_GTK2_HDR
	${WXFILES_ADVANCED_GTK_HDR}
	${HDR}/wx/gtk/hildon/notifmsg.h
)

# ADVANCED_GTK_NATIVE_SRC
set(WXFILES_ADVANCED_GTK_NATIVE_SRC
	${SRC}/src/gtk/aboutdlg.cpp
	${SRC}/src/gtk/animate.cpp
	${SRC}/src/gtk/bmpcbox.cpp
	${SRC}/src/gtk/calctrl.cpp
	${SRC}/src/gtk/dataview.cpp
	${SRC}/src/gtk/hyperlink.cpp
)

# ADVANCED_GTK_NATIVE_HDR
set(WXFILES_ADVANCED_GTK_NATIVE_HDR
	${HDR}/wx/gtk/animate.h
	${HDR}/wx/gtk/bmpcbox.h
	${HDR}/wx/gtk/calctrl.h
	${HDR}/wx/gtk/dataview.h
	${HDR}/wx/gtk/dvrenderer.h
	${HDR}/wx/gtk/dvrenderers.h
	${HDR}/wx/gtk/hyperlink.h
)

# ADVANCED_GTK1_SRC
set(WXFILES_ADVANCED_GTK1_SRC
	${SRC}/src/generic/animateg.cpp
	${SRC}/src/gtk1/eggtrayicon.c
	${SRC}/src/gtk1/taskbar.cpp
)

# ADVANCED_GTK1_HDR
set(WXFILES_ADVANCED_GTK1_HDR
	${HDR}/wx/generic/animate.h
)

# ADVANCED_UNIV_SRC
set(WXFILES_ADVANCED_UNIV_SRC
)
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_ADVANCED_UNIV_SRC
			${SRC}/src/generic/animateg.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_ADVANCED_UNIV_SRC
			${SRC}/src/generic/animateg.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_ADVANCED_UNIV_SRC
			${SRC}/src/generic/animateg.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "x11")
		list(APPEND WXFILES_ADVANCED_UNIV_SRC
			${SRC}/src/generic/animateg.cpp
		)
	endif ()

# ADVANCED_UNIV_HDR
set(WXFILES_ADVANCED_UNIV_HDR
	${HDR}/wx/generic/animate.h
)

# MEDIA_CMN_SRC
set(WXFILES_MEDIA_CMN_SRC
	${SRC}/src/common/mediactrlcmn.cpp
)

# MEDIA_CMN_HDR
set(WXFILES_MEDIA_CMN_HDR
	${HDR}/wx/mediactrl.h
)

# MEDIA_MSW_SRC
set(WXFILES_MEDIA_MSW_SRC
	${SRC}/src/msw/mediactrl_am.cpp
	${SRC}/src/msw/mediactrl_wmp10.cpp
	${SRC}/src/msw/mediactrl_qt.cpp
)

# MEDIA_MSW_HDR
set(WXFILES_MEDIA_MSW_HDR
)

# MEDIA_MSW_DESKTOP_SRC
set(WXFILES_MEDIA_MSW_DESKTOP_SRC
)

# MEDIA_MSW_DESKTOP_HDR
set(WXFILES_MEDIA_MSW_DESKTOP_HDR
)

# MEDIA_OSX_CARBON_SRC
set(WXFILES_MEDIA_OSX_CARBON_SRC
	${SRC}/src/osx/carbon/mediactrl.cpp
)

# MEDIA_OSX_CARBON_HDR
set(WXFILES_MEDIA_OSX_CARBON_HDR
)

# MEDIA_OSX_COCOA_SRC
set(WXFILES_MEDIA_OSX_COCOA_SRC
	${SRC}/src/osx/cocoa/mediactrl.mm
)

# MEDIA_OSX_COCOA_HDR
set(WXFILES_MEDIA_OSX_COCOA_HDR
)

# MEDIA_OSX_IPHONE_SRC
set(WXFILES_MEDIA_OSX_IPHONE_SRC
)

# MEDIA_OSX_IPHONE_HDR
set(WXFILES_MEDIA_OSX_IPHONE_HDR
)

# MEDIA_COCOA_SRC
set(WXFILES_MEDIA_COCOA_SRC
	${SRC}/src/cocoa/mediactrl.mm
)

# MEDIA_COCOA_HDR
set(WXFILES_MEDIA_COCOA_HDR
)

# MEDIA_OS2_SRC
set(WXFILES_MEDIA_OS2_SRC
)

# MEDIA_OS2_HDR
set(WXFILES_MEDIA_OS2_HDR
)

# MEDIA_UNIX_SRC
set(WXFILES_MEDIA_UNIX_SRC
	${SRC}/src/unix/mediactrl.cpp
)

# MEDIA_UNIX_HDR
set(WXFILES_MEDIA_UNIX_HDR
)

# MEDIA_GTK_SRC
set(WXFILES_MEDIA_GTK_SRC
)

# MEDIA_GTK1_SRC
set(WXFILES_MEDIA_GTK1_SRC
)

# HTML_SRC_PLATFORM
set(WXFILES_HTML_SRC_PLATFORM
)
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_HTML_SRC_PLATFORM
			${SRC}/src/msw/helpbest.cpp
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "unix")
		list(APPEND WXFILES_HTML_SRC_PLATFORM
			${SRC}/src/html/chm.cpp
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_HTML_SRC_PLATFORM
			${SRC}/src/html/chm.cpp
		)
	endif ()

# HTML_SRC
set(WXFILES_HTML_SRC
	${WXFILES_HTML_SRC_PLATFORM}
	${SRC}/src/html/helpctrl.cpp
	${SRC}/src/html/helpdata.cpp
	${SRC}/src/html/helpdlg.cpp
	${SRC}/src/html/helpfrm.cpp
	${SRC}/src/html/helpwnd.cpp
	${SRC}/src/html/htmlcell.cpp
	${SRC}/src/html/htmlfilt.cpp
	${SRC}/src/html/htmlpars.cpp
	${SRC}/src/html/htmltag.cpp
	${SRC}/src/html/htmlwin.cpp
	${SRC}/src/html/htmprint.cpp
	${SRC}/src/html/m_dflist.cpp
	${SRC}/src/html/m_fonts.cpp
	${SRC}/src/html/m_hline.cpp
	${SRC}/src/html/m_image.cpp
	${SRC}/src/html/m_layout.cpp
	${SRC}/src/html/m_links.cpp
	${SRC}/src/html/m_list.cpp
	${SRC}/src/html/m_pre.cpp
	${SRC}/src/html/m_span.cpp
	${SRC}/src/html/m_style.cpp
	${SRC}/src/html/m_tables.cpp
	${SRC}/src/html/styleparams.cpp
	${SRC}/src/html/winpars.cpp
	${SRC}/src/generic/htmllbox.cpp
)

# MSW_HTML_HDR
set(WXFILES_MSW_HTML_HDR
)
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_MSW_HTML_HDR
			${HDR}/wx/msw/helpbest.h
		)
	endif ()

# HTML_HDR
set(WXFILES_HTML_HDR
	${HDR}/wx/html/helpctrl.h
	${HDR}/wx/html/helpdata.h
	${HDR}/wx/html/helpdlg.h
	${HDR}/wx/html/helpfrm.h
	${HDR}/wx/html/helpwnd.h
	${HDR}/wx/html/htmlcell.h
	${HDR}/wx/html/htmldefs.h
	${HDR}/wx/html/htmlfilt.h
	${HDR}/wx/html/htmlpars.h
	${HDR}/wx/html/htmlproc.h
	${HDR}/wx/html/htmltag.h
	${HDR}/wx/html/htmlwin.h
	${HDR}/wx/html/htmprint.h
	${HDR}/wx/html/m_templ.h
	${HDR}/wx/html/styleparams.h
	${HDR}/wx/html/winpars.h
	${HDR}/wx/wxhtml.h
	${HDR}/wx/htmllbox.h
	${WXFILES_MSW_HTML_HDR}
)

# WEBVIEW_SRC_PLATFORM
set(WXFILES_WEBVIEW_SRC_PLATFORM
)
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_WEBVIEW_SRC_PLATFORM
			${SRC}/src/msw/webview_ie.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk")
		list(APPEND WXFILES_WEBVIEW_SRC_PLATFORM
			${SRC}/src/gtk/webview_webkit.cpp
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_WEBVIEW_SRC_PLATFORM
			${SRC}/src/osx/webview_webkit.mm
		)
	endif ()

# WEBVIEW_SRC
set(WXFILES_WEBVIEW_SRC
	${WXFILES_WEBVIEW_SRC_PLATFORM}
	${SRC}/src/common/webview.cpp
	${SRC}/src/common/webviewarchivehandler.cpp
	${SRC}/src/common/webviewfshandler.cpp
)

# WEBVIEW_HDR_PLATFORM
set(WXFILES_WEBVIEW_HDR_PLATFORM
)
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_WEBVIEW_HDR_PLATFORM
			${HDR}/wx/msw/webviewhistoryitem_ie.h
			${HDR}/wx/msw/webview_ie.h
			${HDR}/wx/msw/webview_missing.h
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk")
		list(APPEND WXFILES_WEBVIEW_HDR_PLATFORM
			${HDR}/wx/gtk/webviewhistoryitem_webkit.h
			${HDR}/wx/gtk/webview_webkit.h
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_WEBVIEW_HDR_PLATFORM
			${HDR}/wx/osx/webviewhistoryitem_webkit.h
			${HDR}/wx/osx/webview_webkit.h
		)
	endif ()

# WEBVIEW_HDR
set(WXFILES_WEBVIEW_HDR
	${WXFILES_WEBVIEW_HDR_PLATFORM}
	${HDR}/wx/webview.h
	${HDR}/wx/webviewarchivehandler.h
	${HDR}/wx/webviewfshandler.h
)

# XRC_SRC
set(WXFILES_XRC_SRC
	${SRC}/src/xrc/xh_animatctrl.cpp
	${SRC}/src/xrc/xh_bannerwindow.cpp
	${SRC}/src/xrc/xh_bmp.cpp
	${SRC}/src/xrc/xh_bmpcbox.cpp
	${SRC}/src/xrc/xh_bmpbt.cpp
	${SRC}/src/xrc/xh_bttn.cpp
	${SRC}/src/xrc/xh_cald.cpp
	${SRC}/src/xrc/xh_chckb.cpp
	${SRC}/src/xrc/xh_chckl.cpp
	${SRC}/src/xrc/xh_choic.cpp
	${SRC}/src/xrc/xh_choicbk.cpp
	${SRC}/src/xrc/xh_clrpicker.cpp
	${SRC}/src/xrc/xh_cmdlinkbn.cpp
	${SRC}/src/xrc/xh_collpane.cpp
	${SRC}/src/xrc/xh_combo.cpp
	${SRC}/src/xrc/xh_comboctrl.cpp
	${SRC}/src/xrc/xh_datectrl.cpp
	${SRC}/src/xrc/xh_dirpicker.cpp
	${SRC}/src/xrc/xh_dlg.cpp
	${SRC}/src/xrc/xh_editlbox.cpp
	${SRC}/src/xrc/xh_filectrl.cpp
	${SRC}/src/xrc/xh_filepicker.cpp
	${SRC}/src/xrc/xh_fontpicker.cpp
	${SRC}/src/xrc/xh_frame.cpp
	${SRC}/src/xrc/xh_gauge.cpp
	${SRC}/src/xrc/xh_gdctl.cpp
	${SRC}/src/xrc/xh_grid.cpp
	${SRC}/src/xrc/xh_html.cpp
	${SRC}/src/xrc/xh_hyperlink.cpp
	${SRC}/src/xrc/xh_listb.cpp
	${SRC}/src/xrc/xh_listbk.cpp
	${SRC}/src/xrc/xh_listc.cpp
	${SRC}/src/xrc/xh_mdi.cpp
	${SRC}/src/xrc/xh_menu.cpp
	${SRC}/src/xrc/xh_notbk.cpp
	${SRC}/src/xrc/xh_odcombo.cpp
	${SRC}/src/xrc/xh_panel.cpp
	${SRC}/src/xrc/xh_propdlg.cpp
	${SRC}/src/xrc/xh_radbt.cpp
	${SRC}/src/xrc/xh_radbx.cpp
	${SRC}/src/xrc/xh_scrol.cpp
	${SRC}/src/xrc/xh_scwin.cpp
	${SRC}/src/xrc/xh_htmllbox.cpp
	${SRC}/src/xrc/xh_sizer.cpp
	${SRC}/src/xrc/xh_slidr.cpp
	${SRC}/src/xrc/xh_spin.cpp
	${SRC}/src/xrc/xh_split.cpp
	${SRC}/src/xrc/xh_srchctrl.cpp
	${SRC}/src/xrc/xh_statbar.cpp
	${SRC}/src/xrc/xh_stbmp.cpp
	${SRC}/src/xrc/xh_stbox.cpp
	${SRC}/src/xrc/xh_stlin.cpp
	${SRC}/src/xrc/xh_sttxt.cpp
	${SRC}/src/xrc/xh_text.cpp
	${SRC}/src/xrc/xh_tglbtn.cpp
	${SRC}/src/xrc/xh_timectrl.cpp
	${SRC}/src/xrc/xh_toolb.cpp
	${SRC}/src/xrc/xh_toolbk.cpp
	${SRC}/src/xrc/xh_tree.cpp
	${SRC}/src/xrc/xh_treebk.cpp
	${SRC}/src/xrc/xh_unkwn.cpp
	${SRC}/src/xrc/xh_wizrd.cpp
	${SRC}/src/xrc/xmlres.cpp
	${SRC}/src/xrc/xmladv.cpp
	${SRC}/src/xrc/xmlrsall.cpp
)

# XRC_HDR
set(WXFILES_XRC_HDR
	${HDR}/wx/xrc/xh_all.h
	${HDR}/wx/xrc/xh_animatctrl.h
	${HDR}/wx/xrc/xh_bannerwindow.h
	${HDR}/wx/xrc/xh_bmpbt.h
	${HDR}/wx/xrc/xh_bmp.h
	${HDR}/wx/xrc/xh_bmpcbox.h
	${HDR}/wx/xrc/xh_bttn.h
	${HDR}/wx/xrc/xh_cald.h
	${HDR}/wx/xrc/xh_chckb.h
	${HDR}/wx/xrc/xh_chckl.h
	${HDR}/wx/xrc/xh_choic.h
	${HDR}/wx/xrc/xh_choicbk.h
	${HDR}/wx/xrc/xh_clrpicker.h
	${HDR}/wx/xrc/xh_cmdlinkbn.h
	${HDR}/wx/xrc/xh_collpane.h
	${HDR}/wx/xrc/xh_combo.h
	${HDR}/wx/xrc/xh_comboctrl.h
	${HDR}/wx/xrc/xh_datectrl.h
	${HDR}/wx/xrc/xh_dirpicker.h
	${HDR}/wx/xrc/xh_dlg.h
	${HDR}/wx/xrc/xh_editlbox.h
	${HDR}/wx/xrc/xh_filectrl.h
	${HDR}/wx/xrc/xh_filepicker.h
	${HDR}/wx/xrc/xh_fontpicker.h
	${HDR}/wx/xrc/xh_frame.h
	${HDR}/wx/xrc/xh_mdi.h
	${HDR}/wx/xrc/xh_gauge.h
	${HDR}/wx/xrc/xh_gdctl.h
	${HDR}/wx/xrc/xh_grid.h
	${HDR}/wx/xrc/xh_html.h
	${HDR}/wx/xrc/xh_hyperlink.h
	${HDR}/wx/xrc/xh_listb.h
	${HDR}/wx/xrc/xh_listbk.h
	${HDR}/wx/xrc/xh_listc.h
	${HDR}/wx/xrc/xh_menu.h
	${HDR}/wx/xrc/xh_notbk.h
	${HDR}/wx/xrc/xh_odcombo.h
	${HDR}/wx/xrc/xh_panel.h
	${HDR}/wx/xrc/xh_propdlg.h
	${HDR}/wx/xrc/xh_radbt.h
	${HDR}/wx/xrc/xh_radbx.h
	${HDR}/wx/xrc/xh_scrol.h
	${HDR}/wx/xrc/xh_scwin.h
	${HDR}/wx/xrc/xh_htmllbox.h
	${HDR}/wx/xrc/xh_sizer.h
	${HDR}/wx/xrc/xh_slidr.h
	${HDR}/wx/xrc/xh_spin.h
	${HDR}/wx/xrc/xh_split.h
	${HDR}/wx/xrc/xh_srchctrl.h
	${HDR}/wx/xrc/xh_statbar.h
	${HDR}/wx/xrc/xh_stbmp.h
	${HDR}/wx/xrc/xh_stbox.h
	${HDR}/wx/xrc/xh_stlin.h
	${HDR}/wx/xrc/xh_sttxt.h
	${HDR}/wx/xrc/xh_text.h
	${HDR}/wx/xrc/xh_tglbtn.h
	${HDR}/wx/xrc/xh_timectrl.h
	${HDR}/wx/xrc/xh_toolb.h
	${HDR}/wx/xrc/xh_toolbk.h
	${HDR}/wx/xrc/xh_tree.h
	${HDR}/wx/xrc/xh_treebk.h
	${HDR}/wx/xrc/xh_unkwn.h
	${HDR}/wx/xrc/xh_wizrd.h
	${HDR}/wx/xrc/xmlres.h
)

# XML_SRC
set(WXFILES_XML_SRC
	${SRC}/src/xml/xml.cpp
	${SRC}/src/common/xtixml.cpp
)

# XML_HDR
set(WXFILES_XML_HDR
	${HDR}/wx/xml/xml.h
	${HDR}/wx/xtixml.h
)

# OPENGL_SRC_PLATFORM
set(WXFILES_OPENGL_SRC_PLATFORM
)
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_OPENGL_SRC_PLATFORM
			${SRC}/src/osx/carbon/glcanvas.cpp
			${SRC}/src/osx/glcanvas_osx.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_OPENGL_SRC_PLATFORM
			${SRC}/src/osx/cocoa/glcanvas.mm
			${SRC}/src/osx/glcanvas_osx.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_iphone")
		list(APPEND WXFILES_OPENGL_SRC_PLATFORM
			${SRC}/src/osx/iphone/glcanvas.mm
			${SRC}/src/osx/glcanvas_osx.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "chaud_cacao_cho_cho_cho_chocolat")
		list(APPEND WXFILES_OPENGL_SRC_PLATFORM
			${SRC}/src/cocoa/glcanvas.mm
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk3" AND NOT ("${WXBUILD_PLATFORM}" STREQUAL "win32"))
		list(APPEND WXFILES_OPENGL_SRC_PLATFORM
			${SRC}/src/unix/glx11.cpp
			${SRC}/src/gtk/glcanvas.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_OPENGL_SRC_PLATFORM
			${SRC}/src/gtk/glcanvas.cpp
			${SRC}/src/unix/glx11.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk1")
		list(APPEND WXFILES_OPENGL_SRC_PLATFORM
			${SRC}/src/gtk1/glcanvas.cpp
			${SRC}/src/unix/glx11.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_OPENGL_SRC_PLATFORM
			${SRC}/src/msw/glcanvas.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_OPENGL_SRC_PLATFORM
			${SRC}/src/msw/glcanvas.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "motif")
		list(APPEND WXFILES_OPENGL_SRC_PLATFORM
			${SRC}/src/x11/glcanvas.cpp
			${SRC}/src/unix/glx11.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "x11")
		list(APPEND WXFILES_OPENGL_SRC_PLATFORM
			${SRC}/src/x11/glcanvas.cpp
			${SRC}/src/unix/glx11.cpp
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "os2")
		list(APPEND WXFILES_OPENGL_SRC_PLATFORM
			${SRC}/src/os2/glcanvas.cpp
		)
	endif ()

# OPENGL_SRC
set(WXFILES_OPENGL_SRC
	${SRC}/src/common/glcmn.cpp
	${WXFILES_OPENGL_SRC_PLATFORM}
)

# OPENGL_HDR_PLATFORM
set(WXFILES_OPENGL_HDR_PLATFORM
)
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_OPENGL_HDR_PLATFORM
			${HDR}/wx/osx/glcanvas.h
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_OPENGL_HDR_PLATFORM
			${HDR}/wx/osx/glcanvas.h
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "chaud_cacao_cho_cho_cho_chocolat")
		list(APPEND WXFILES_OPENGL_HDR_PLATFORM
			${HDR}/wx/cocoa/glcanvas.h
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk3")
		list(APPEND WXFILES_OPENGL_HDR_PLATFORM
			${HDR}/wx/gtk/glcanvas.h
			${HDR}/wx/unix/glx11.h
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_OPENGL_HDR_PLATFORM
			${HDR}/wx/gtk/glcanvas.h
			${HDR}/wx/unix/glx11.h
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk1")
		list(APPEND WXFILES_OPENGL_HDR_PLATFORM
			${HDR}/wx/gtk1/glcanvas.h
			${HDR}/wx/unix/glx11.h
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_OPENGL_HDR_PLATFORM
			${HDR}/wx/msw/glcanvas.h
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_OPENGL_HDR_PLATFORM
			${HDR}/wx/msw/glcanvas.h
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "motif")
		list(APPEND WXFILES_OPENGL_HDR_PLATFORM
			${HDR}/wx/x11/glcanvas.h
			${HDR}/wx/unix/glx11.h
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "x11")
		list(APPEND WXFILES_OPENGL_HDR_PLATFORM
			${HDR}/wx/x11/glcanvas.h
			${HDR}/wx/unix/glx11.h
		)
	endif ()

# OPENGL_HDR
set(WXFILES_OPENGL_HDR
	${HDR}/wx/glcanvas.h
	${WXFILES_OPENGL_HDR_PLATFORM}
)

# UNIX_SOUND_SRC_SDL
set(WXFILES_UNIX_SOUND_SRC_SDL
	${SRC}/src/unix/sound_sdl.cpp
)

# AUI_GTK_SRC
set(WXFILES_AUI_GTK_SRC
)
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_AUI_GTK_SRC
			${SRC}/src/aui/tabartgtk.cpp
		)
	endif ()

# AUI_GTK_HDR
set(WXFILES_AUI_GTK_HDR
)
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_AUI_GTK_HDR
			${HDR}/wx/aui/tabartgtk.h
		)
	endif ()

# AUI_SRC
set(WXFILES_AUI_SRC
	${SRC}/src/aui/framemanager.cpp
	${SRC}/src/aui/dockart.cpp
	${SRC}/src/aui/floatpane.cpp
	${SRC}/src/aui/auibook.cpp
	${SRC}/src/aui/auibar.cpp
	${SRC}/src/aui/tabmdi.cpp
	${SRC}/src/aui/tabart.cpp
	${SRC}/src/xrc/xh_auinotbk.cpp
	${SRC}/src/xrc/xh_auitoolb.cpp
	${WXFILES_AUI_GTK_SRC}
)

# AUI_HDR
set(WXFILES_AUI_HDR
	${HDR}/wx/aui/framemanager.h
	${HDR}/wx/aui/dockart.h
	${HDR}/wx/aui/floatpane.h
	${HDR}/wx/aui/auibook.h
	${HDR}/wx/aui/auibar.h
	${HDR}/wx/aui/tabmdi.h
	${HDR}/wx/aui/aui.h
	${HDR}/wx/aui/tabart.h
	${HDR}/wx/xrc/xh_auinotbk.h
	${HDR}/wx/xrc/xh_auitoolb.h
	${WXFILES_AUI_GTK_HDR}
)

# RIBBON_SRC
set(WXFILES_RIBBON_SRC
	${SRC}/src/ribbon/art_internal.cpp
	${SRC}/src/ribbon/art_msw.cpp
	${SRC}/src/ribbon/art_aui.cpp
	${SRC}/src/ribbon/bar.cpp
	${SRC}/src/ribbon/buttonbar.cpp
	${SRC}/src/ribbon/control.cpp
	${SRC}/src/ribbon/gallery.cpp
	${SRC}/src/ribbon/page.cpp
	${SRC}/src/ribbon/panel.cpp
	${SRC}/src/ribbon/toolbar.cpp
	${SRC}/src/xrc/xh_ribbon.cpp
)

# RIBBON_HDR
set(WXFILES_RIBBON_HDR
	${HDR}/wx/ribbon/art.h
	${HDR}/wx/ribbon/art_internal.h
	${HDR}/wx/ribbon/bar.h
	${HDR}/wx/ribbon/buttonbar.h
	${HDR}/wx/ribbon/control.h
	${HDR}/wx/ribbon/gallery.h
	${HDR}/wx/ribbon/page.h
	${HDR}/wx/ribbon/panel.h
	${HDR}/wx/ribbon/toolbar.h
	${HDR}/wx/xrc/xh_ribbon.h
)

# PROPGRID_SRC
set(WXFILES_PROPGRID_SRC
	${SRC}/src/propgrid/advprops.cpp
	${SRC}/src/propgrid/editors.cpp
	${SRC}/src/propgrid/manager.cpp
	${SRC}/src/propgrid/property.cpp
	${SRC}/src/propgrid/propgrid.cpp
	${SRC}/src/propgrid/propgridiface.cpp
	${SRC}/src/propgrid/propgridpagestate.cpp
	${SRC}/src/propgrid/props.cpp
)

# PROPGRID_HDR
set(WXFILES_PROPGRID_HDR
	${HDR}/wx/propgrid/advprops.h
	${HDR}/wx/propgrid/editors.h
	${HDR}/wx/propgrid/manager.h
	${HDR}/wx/propgrid/property.h
	${HDR}/wx/propgrid/propgrid.h
	${HDR}/wx/propgrid/propgriddefs.h
	${HDR}/wx/propgrid/propgridiface.h
	${HDR}/wx/propgrid/propgridpagestate.h
	${HDR}/wx/propgrid/props.h
)

# RICHTEXT_SRC
set(WXFILES_RICHTEXT_SRC
	${SRC}/src/richtext/richtextbuffer.cpp
	${SRC}/src/richtext/richtextctrl.cpp
	${SRC}/src/richtext/richtextformatdlg.cpp
	${SRC}/src/richtext/richtexthtml.cpp
	${SRC}/src/richtext/richtextimagedlg.cpp
	${SRC}/src/richtext/richtextprint.cpp
	${SRC}/src/richtext/richtextstyledlg.cpp
	${SRC}/src/richtext/richtextstyles.cpp
	${SRC}/src/richtext/richtextsymboldlg.cpp
	${SRC}/src/richtext/richtextxml.cpp
	${SRC}/src/xrc/xh_richtext.cpp
)

# RICHTEXT_HDR
set(WXFILES_RICHTEXT_HDR
	${HDR}/wx/richtext/richtextbackgroundpage.h
	${HDR}/wx/richtext/richtextborderspage.h
	${HDR}/wx/richtext/richtextbuffer.h
	${HDR}/wx/richtext/richtextbulletspage.h
	${HDR}/wx/richtext/richtextctrl.h
	${HDR}/wx/richtext/richtextdialogpage.h
	${HDR}/wx/richtext/richtextfontpage.h
	${HDR}/wx/richtext/richtextformatdlg.h
	${HDR}/wx/richtext/richtexthtml.h
	${HDR}/wx/richtext/richtextimagedlg.h
	${HDR}/wx/richtext/richtextindentspage.h
	${HDR}/wx/richtext/richtextliststylepage.h
	${HDR}/wx/richtext/richtextmarginspage.h
	${HDR}/wx/richtext/richtextprint.h
	${HDR}/wx/richtext/richtextsizepage.h
	${HDR}/wx/richtext/richtextstyledlg.h
	${HDR}/wx/richtext/richtextstylepage.h
	${HDR}/wx/richtext/richtextstyles.h
	${HDR}/wx/richtext/richtextsymboldlg.h
	${HDR}/wx/richtext/richtexttabspage.h
	${HDR}/wx/richtext/richtextuicustomization.h
	${HDR}/wx/richtext/richtextxml.h
	${HDR}/wx/xrc/xh_richtext.h
)

# STC_SRC
set(WXFILES_STC_SRC
	${SRC}/src/stc/stc.cpp
	${SRC}/src/stc/PlatWX.cpp
	${SRC}/src/stc/ScintillaWX.cpp
)

# STC_HDR
set(WXFILES_STC_HDR
	${HDR}/wx/stc/stc.h
)

# BASE_OSX_SRC
set(WXFILES_BASE_OSX_SRC
)
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_BASE_OSX_SRC
			${WXFILES_BASE_OSX_SHARED_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_BASE_OSX_SRC
			${WXFILES_BASE_OSX_SHARED_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_iphone")
		list(APPEND WXFILES_BASE_OSX_SRC
			${WXFILES_BASE_OSX_SHARED_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "chaud_cacao_cho_cho_cho_chocolat")
		list(APPEND WXFILES_BASE_OSX_SRC
			${WXFILES_BASE_OSX_NOTWXMAC_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk")
		list(APPEND WXFILES_BASE_OSX_SRC
			${WXFILES_BASE_OSX_NOTWXMAC_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "x11")
		list(APPEND WXFILES_BASE_OSX_SRC
			${WXFILES_BASE_OSX_NOTWXMAC_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "motif")
		list(APPEND WXFILES_BASE_OSX_SRC
			${WXFILES_BASE_OSX_NOTWXMAC_SRC}
		)
	endif ()

# BASE_PLATFORM_SRC
set(WXFILES_BASE_PLATFORM_SRC
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "unix")
		list(APPEND WXFILES_BASE_PLATFORM_SRC
			${WXFILES_BASE_UNIX_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "win32")
		list(APPEND WXFILES_BASE_PLATFORM_SRC
			${WXFILES_BASE_WIN32_SRC}
			${WXFILES_BASE_WINCE_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_BASE_PLATFORM_SRC
			${WXFILES_BASE_OSX_SHARED_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "os2")
		list(APPEND WXFILES_BASE_PLATFORM_SRC
			${WXFILES_BASE_OS2_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "msdos")
		list(APPEND WXFILES_BASE_PLATFORM_SRC
			${WXFILES_BASE_MSDOS_SRC}
		)
	endif ()

# BASE_AND_GUI_TOOLKIT_SRC
set(WXFILES_BASE_AND_GUI_TOOLKIT_SRC
)
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_BASE_AND_GUI_TOOLKIT_SRC
			${WXFILES_BASE_AND_GUI_OSX_CARBON_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_BASE_AND_GUI_TOOLKIT_SRC
			${WXFILES_BASE_AND_GUI_OSX_COCOA_SRC}
		)
	endif ()

# BASE_AND_GUI_PLATFORM_SRC
set(WXFILES_BASE_AND_GUI_PLATFORM_SRC
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "win32")
		list(APPEND WXFILES_BASE_AND_GUI_PLATFORM_SRC
			${WXFILES_BASE_AND_GUI_WIN32_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "msdos")
		list(APPEND WXFILES_BASE_AND_GUI_PLATFORM_SRC
			${WXFILES_BASE_AND_GUI_MSDOS_SRC}
		)
	endif ()

# BASE_OSX_HDR
set(WXFILES_BASE_OSX_HDR
)
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_BASE_OSX_HDR
			${WXFILES_BASE_OSX_SHARED_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_BASE_OSX_HDR
			${WXFILES_BASE_OSX_SHARED_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "chaud_cacao_cho_cho_cho_chocolat")
		list(APPEND WXFILES_BASE_OSX_HDR
			${WXFILES_BASE_OSX_NOTWXMAC_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk")
		list(APPEND WXFILES_BASE_OSX_HDR
			${WXFILES_BASE_OSX_NOTWXMAC_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "x11")
		list(APPEND WXFILES_BASE_OSX_HDR
			${WXFILES_BASE_OSX_NOTWXMAC_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "motif")
		list(APPEND WXFILES_BASE_OSX_HDR
			${WXFILES_BASE_OSX_NOTWXMAC_HDR}
		)
	endif ()

# BASE_PLATFORM_HDR
set(WXFILES_BASE_PLATFORM_HDR
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "unix")
		list(APPEND WXFILES_BASE_PLATFORM_HDR
			${WXFILES_BASE_UNIX_HDR}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "win32")
		list(APPEND WXFILES_BASE_PLATFORM_HDR
			${WXFILES_BASE_WIN32_HDR}
			${WXFILES_BASE_WINCE_HDR}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_BASE_PLATFORM_HDR
			${WXFILES_BASE_OSX_HDR}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "msdos")
		list(APPEND WXFILES_BASE_PLATFORM_HDR
			${WXFILES_BASE_MSDOS_HDR}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "os2")
		list(APPEND WXFILES_BASE_PLATFORM_HDR
			${WXFILES_BASE_OS2_HDR}
		)
	endif ()

# BASE_SRC
set(WXFILES_BASE_SRC
	${WXFILES_BASE_CMN_SRC}
	${WXFILES_BASE_PLATFORM_SRC}
)

# BASE_AND_GUI_SRC
set(WXFILES_BASE_AND_GUI_SRC
	${WXFILES_BASE_AND_GUI_CMN_SRC}
	${WXFILES_BASE_AND_GUI_PLATFORM_SRC}
	${WXFILES_BASE_AND_GUI_TOOLKIT_SRC}
)

# NET_PLATFORM_SRC
set(WXFILES_NET_PLATFORM_SRC
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "unix")
		list(APPEND WXFILES_NET_PLATFORM_SRC
			${WXFILES_NET_UNIX_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "win32")
		list(APPEND WXFILES_NET_PLATFORM_SRC
			${WXFILES_NET_WIN32_SRC}
			${WXFILES_NET_WINCE_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_NET_PLATFORM_SRC
			${WXFILES_NET_UNIX_SRC}
			${WXFILES_NET_OSX_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "os2")
		list(APPEND WXFILES_NET_PLATFORM_SRC
			${WXFILES_NET_OS2_SRC}
		)
	endif ()

# NET_PLATFORM_HDR
set(WXFILES_NET_PLATFORM_HDR
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "win32")
		list(APPEND WXFILES_NET_PLATFORM_HDR
			${WXFILES_NET_WIN32_HDR}
			${WXFILES_NET_WINCE_HDR}
		)
	endif ()

# NET_SRC
set(WXFILES_NET_SRC
	${WXFILES_NET_CMN_SRC}
	${WXFILES_NET_PLATFORM_SRC}
)

# LOWLEVEL_SRC
set(WXFILES_LOWLEVEL_SRC
)
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_GTK2_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk3")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_GTK_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk1")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_GTK1_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "motif")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_MOTIF_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_MSW_LOWLEVEL_SRC}
			${WXFILES_MSW_DESKTOP_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_MSW_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_OSX_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_OSX_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_iphone")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_OSX_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "chaud_cacao_cho_cho_cho_chocolat")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_COCOA_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "os2")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_OS2_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "x11")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_X11_LOWLEVEL_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "dfb")
		list(APPEND WXFILES_LOWLEVEL_SRC
			${WXFILES_DFB_LOWLEVEL_SRC}
		)
	endif ()

# LOWLEVEL_HDR
set(WXFILES_LOWLEVEL_HDR
)
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk3")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_GTK_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_GTK_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk1")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_GTK1_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "motif")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_MOTIF_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_MSW_LOWLEVEL_HDR}
			${WXFILES_MSW_DESKTOP_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_MSW_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_OSX_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_OSX_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_iphone")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_OSX_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "chaud_cacao_cho_cho_cho_chocolat")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_COCOA_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "os2")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_OS2_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "x11")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_X11_LOWLEVEL_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "dfb")
		list(APPEND WXFILES_LOWLEVEL_HDR
			${WXFILES_DFB_LOWLEVEL_HDR}
		)
	endif ()

# PLATFORM_SRC
set(WXFILES_PLATFORM_SRC
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "unix")
		list(APPEND WXFILES_PLATFORM_SRC
			${WXFILES_UNIX_SRC}
		)
	endif ()
	if ("${WXBUILD_PLATFORM}" STREQUAL "osx")
		list(APPEND WXFILES_PLATFORM_SRC
			${WXFILES_UNIX_SRC}
		)
	endif ()

# GUI_SRC
set(WXFILES_GUI_SRC
)
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_GUI_SRC
			${WXFILES_GTK2_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk3")
		list(APPEND WXFILES_GUI_SRC
			${WXFILES_GTK_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk1")
		list(APPEND WXFILES_GUI_SRC
			${WXFILES_GTK1_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "motif")
		list(APPEND WXFILES_GUI_SRC
			${WXFILES_MOTIF_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_GUI_SRC
			${WXFILES_MSW_SRC}
			${WXFILES_MSW_DESKTOP_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_GUI_SRC
			${WXFILES_MSW_SRC}
			${WXFILES_WINCE_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_GUI_SRC
			${WXFILES_OSX_CARBON_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_GUI_SRC
			${WXFILES_OSX_COCOA_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_iphone")
		list(APPEND WXFILES_GUI_SRC
			${WXFILES_OSX_IPHONE_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "chaud_cacao_cho_cho_cho_chocolat")
		list(APPEND WXFILES_GUI_SRC
			${WXFILES_COCOA_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "os2")
		list(APPEND WXFILES_GUI_SRC
			${WXFILES_OS2_SRC}
		)
	endif ()

# GUI_HDR
set(WXFILES_GUI_HDR
)
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_GUI_HDR
			${WXFILES_GTK2_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk3")
		list(APPEND WXFILES_GUI_HDR
			${WXFILES_GTK_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk1")
		list(APPEND WXFILES_GUI_HDR
			${WXFILES_GTK1_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "motif")
		list(APPEND WXFILES_GUI_HDR
			${WXFILES_MOTIF_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_GUI_HDR
			${WXFILES_MSW_HDR}
			${WXFILES_MSW_DESKTOP_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_GUI_HDR
			${WXFILES_MSW_HDR}
			${WXFILES_WINCE_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_GUI_HDR
			${WXFILES_OSX_SHARED_HDR}
			${WXFILES_OSX_CARBON_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_GUI_HDR
			${WXFILES_OSX_SHARED_HDR}
			${WXFILES_OSX_COCOA_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_iphone")
		list(APPEND WXFILES_GUI_HDR
			${WXFILES_OSX_SHARED_HDR}
			${WXFILES_OSX_IPHONE_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "chaud_cacao_cho_cho_cho_chocolat")
		list(APPEND WXFILES_GUI_HDR
			${WXFILES_COCOA_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "os2")
		list(APPEND WXFILES_GUI_HDR
			${WXFILES_OS2_HDR}
		)
	endif ()

# CORE_SRC
set(WXFILES_CORE_SRC
)
	if (WXBUILD_USE_GUI AND NOT WXBUILD_UNIVERSAL)
		list(APPEND WXFILES_CORE_SRC
			${WXFILES_LOWLEVEL_SRC}
			${WXFILES_PLATFORM_SRC}
			${WXFILES_GUI_SRC}
			${WXFILES_GUI_CMN_SRC}
		)
	endif ()
	if (WXBUILD_USE_GUI AND WXBUILD_UNIVERSAL)
		list(APPEND WXFILES_CORE_SRC
			${WXFILES_LOWLEVEL_SRC}
			${WXFILES_PLATFORM_SRC}
			${WXFILES_UNIV_SRC}
			${WXFILES_UNIV_THEMES_SRC}
			${WXFILES_GUI_CMN_SRC}
		)
	endif ()

# ADVANCED_PLATFORM_SRC
set(WXFILES_ADVANCED_PLATFORM_SRC
)
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_ADVANCED_PLATFORM_SRC
			${WXFILES_ADVANCED_MSW_SRC}
			${WXFILES_ADVANCED_MSW_DESKTOP_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_ADVANCED_PLATFORM_SRC
			${WXFILES_ADVANCED_MSW_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_ADVANCED_PLATFORM_SRC
			${WXFILES_ADVANCED_OSX_CARBON_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_ADVANCED_PLATFORM_SRC
			${WXFILES_ADVANCED_OSX_COCOA_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_iphone")
		list(APPEND WXFILES_ADVANCED_PLATFORM_SRC
			${WXFILES_ADVANCED_OSX_IPHONE_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "chaud_cacao_cho_cho_cho_chocolat")
		list(APPEND WXFILES_ADVANCED_PLATFORM_SRC
			${WXFILES_ADVANCED_COCOA_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "motif")
		list(APPEND WXFILES_ADVANCED_PLATFORM_SRC
			${WXFILES_ADVANCED_UNIX_SRC}
			${WXFILES_ADVANCED_MOTIF_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_ADVANCED_PLATFORM_SRC
			${WXFILES_ADVANCED_GTK2_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk3")
		list(APPEND WXFILES_ADVANCED_PLATFORM_SRC
			${WXFILES_ADVANCED_GTK_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk1")
		list(APPEND WXFILES_ADVANCED_PLATFORM_SRC
			${WXFILES_ADVANCED_UNIX_SRC}
			${WXFILES_ADVANCED_GTK1_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "x11")
		list(APPEND WXFILES_ADVANCED_PLATFORM_SRC
			${WXFILES_ADVANCED_UNIX_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "os2")
		list(APPEND WXFILES_ADVANCED_PLATFORM_SRC
			${WXFILES_ADVANCED_OS2_SRC}
		)
	endif ()

# ADVANCED_PLATFORM_HDR
set(WXFILES_ADVANCED_PLATFORM_HDR
)
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_ADVANCED_PLATFORM_HDR
			${WXFILES_ADVANCED_MSW_HDR}
			${WXFILES_ADVANCED_MSW_DESKTOP_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_ADVANCED_PLATFORM_HDR
			${WXFILES_ADVANCED_MSW_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_ADVANCED_PLATFORM_HDR
			${WXFILES_ADVANCED_OSX_CARBON_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_ADVANCED_PLATFORM_HDR
			${WXFILES_ADVANCED_OSX_COCOA_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_iphone")
		list(APPEND WXFILES_ADVANCED_PLATFORM_HDR
			${WXFILES_ADVANCED_OSX_IPHONE_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "chaud_cacao_cho_cho_cho_chocolat")
		list(APPEND WXFILES_ADVANCED_PLATFORM_HDR
			${WXFILES_ADVANCED_COCOA_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "motif")
		list(APPEND WXFILES_ADVANCED_PLATFORM_HDR
			${WXFILES_ADVANCED_UNIX_HDR}
			${WXFILES_ADVANCED_MOTIF_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_ADVANCED_PLATFORM_HDR
			${WXFILES_ADVANCED_GTK2_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk3")
		list(APPEND WXFILES_ADVANCED_PLATFORM_HDR
			${WXFILES_ADVANCED_GTK_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk1")
		list(APPEND WXFILES_ADVANCED_PLATFORM_HDR
			${WXFILES_ADVANCED_UNIX_HDR}
			${WXFILES_ADVANCED_GTK1_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "x11")
		list(APPEND WXFILES_ADVANCED_PLATFORM_HDR
			${WXFILES_ADVANCED_UNIX_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "os2")
		list(APPEND WXFILES_ADVANCED_PLATFORM_HDR
			${WXFILES_ADVANCED_OS2_HDR}
		)
	endif ()

# ADVANCED_PLATFORM_NATIVE_SRC
set(WXFILES_ADVANCED_PLATFORM_NATIVE_SRC
)
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_ADVANCED_PLATFORM_NATIVE_SRC
			${WXFILES_ADVANCED_GTK_NATIVE_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk3")
		list(APPEND WXFILES_ADVANCED_PLATFORM_NATIVE_SRC
			${WXFILES_ADVANCED_GTK_NATIVE_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_ADVANCED_PLATFORM_NATIVE_SRC
			${WXFILES_ADVANCED_MSW_NATIVE_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_ADVANCED_PLATFORM_NATIVE_SRC
			${WXFILES_ADVANCED_MSW_NATIVE_SRC}
		)
	endif ()

# ADVANCED_PLATFORM_NATIVE_HDR
set(WXFILES_ADVANCED_PLATFORM_NATIVE_HDR
)
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk2")
		list(APPEND WXFILES_ADVANCED_PLATFORM_NATIVE_HDR
			${WXFILES_ADVANCED_GTK_NATIVE_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk" AND "${WXBUILD_SUBPORT}" STREQUAL "gtk3")
		list(APPEND WXFILES_ADVANCED_PLATFORM_NATIVE_HDR
			${WXFILES_ADVANCED_GTK_NATIVE_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_ADVANCED_PLATFORM_NATIVE_HDR
			${WXFILES_ADVANCED_MSW_NATIVE_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_ADVANCED_PLATFORM_NATIVE_HDR
			${WXFILES_ADVANCED_MSW_NATIVE_HDR}
		)
	endif ()

# ADVANCED_SRC
set(WXFILES_ADVANCED_SRC
)
	if (NOT WXBUILD_UNIVERSAL)
		list(APPEND WXFILES_ADVANCED_SRC
			${WXFILES_ADVANCED_CMN_SRC}
			${WXFILES_ADVANCED_PLATFORM_SRC}
			${WXFILES_ADVANCED_PLATFORM_NATIVE_SRC}
		)
	endif ()
	if (WXBUILD_UNIVERSAL)
		list(APPEND WXFILES_ADVANCED_SRC
			${WXFILES_ADVANCED_CMN_SRC}
			${WXFILES_ADVANCED_PLATFORM_SRC}
			${WXFILES_ADVANCED_UNIV_SRC}
		)
	endif ()

# ADVANCED_HDR
set(WXFILES_ADVANCED_HDR
)
	if (NOT WXBUILD_UNIVERSAL)
		list(APPEND WXFILES_ADVANCED_HDR
			${WXFILES_ADVANCED_CMN_HDR}
			${WXFILES_ADVANCED_PLATFORM_HDR}
			${WXFILES_ADVANCED_PLATFORM_NATIVE_HDR}
		)
	endif ()
	if (WXBUILD_UNIVERSAL)
		list(APPEND WXFILES_ADVANCED_HDR
			${WXFILES_ADVANCED_CMN_HDR}
			${WXFILES_ADVANCED_PLATFORM_HDR}
			${WXFILES_ADVANCED_UNIV_HDR}
		)
	endif ()

# MEDIA_PLATFORM_SRC
set(WXFILES_MEDIA_PLATFORM_SRC
)
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_MEDIA_PLATFORM_SRC
			${WXFILES_MEDIA_MSW_SRC}
			${WXFILES_MEDIA_MSW_DESKTOP_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_MEDIA_PLATFORM_SRC
			${WXFILES_MEDIA_MSW_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_MEDIA_PLATFORM_SRC
			${WXFILES_MEDIA_OSX_CARBON_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_MEDIA_PLATFORM_SRC
			${WXFILES_MEDIA_OSX_COCOA_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_iphone")
		list(APPEND WXFILES_MEDIA_PLATFORM_SRC
			${WXFILES_MEDIA_OSX_IPHONE_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "chaud_cacao_cho_cho_cho_chocolat")
		list(APPEND WXFILES_MEDIA_PLATFORM_SRC
			${WXFILES_MEDIA_COCOA_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "motif")
		list(APPEND WXFILES_MEDIA_PLATFORM_SRC
			${WXFILES_MEDIA_UNIX_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk")
		list(APPEND WXFILES_MEDIA_PLATFORM_SRC
			${WXFILES_MEDIA_UNIX_SRC}
			${WXFILES_MEDIA_GTK_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "x11")
		list(APPEND WXFILES_MEDIA_PLATFORM_SRC
			${WXFILES_MEDIA_UNIX_SRC}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "os2")
		list(APPEND WXFILES_MEDIA_PLATFORM_SRC
			${WXFILES_MEDIA_OS2_SRC}
		)
	endif ()

# MEDIA_PLATFORM_HDR
set(WXFILES_MEDIA_PLATFORM_HDR
)
	if ("${WXBUILD_PORT}" STREQUAL "msw")
		list(APPEND WXFILES_MEDIA_PLATFORM_HDR
			${WXFILES_MEDIA_MSW_HDR}
			${WXFILES_MEDIA_MSW_DESKTOP_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "wince")
		list(APPEND WXFILES_MEDIA_PLATFORM_HDR
			${WXFILES_MEDIA_MSW_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_carbon")
		list(APPEND WXFILES_MEDIA_PLATFORM_HDR
			${WXFILES_MEDIA_OSX_CARBON_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_cocoa")
		list(APPEND WXFILES_MEDIA_PLATFORM_HDR
			${WXFILES_MEDIA_OSX_COCOA_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "osx" AND "${WXBUILD_SUBPORT}" STREQUAL "osx_iphone")
		list(APPEND WXFILES_MEDIA_PLATFORM_HDR
			${WXFILES_MEDIA_OSX_IPHONE_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "chaud_cacao_cho_cho_cho_chocolat")
		list(APPEND WXFILES_MEDIA_PLATFORM_HDR
			${WXFILES_MEDIA_COCOA_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "motif")
		list(APPEND WXFILES_MEDIA_PLATFORM_HDR
			${WXFILES_MEDIA_UNIX_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "gtk")
		list(APPEND WXFILES_MEDIA_PLATFORM_HDR
			${WXFILES_MEDIA_UNIX_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "x11")
		list(APPEND WXFILES_MEDIA_PLATFORM_HDR
			${WXFILES_MEDIA_UNIX_HDR}
		)
	endif ()
	if ("${WXBUILD_PORT}" STREQUAL "os2")
		list(APPEND WXFILES_MEDIA_PLATFORM_HDR
			${WXFILES_MEDIA_OS2_HDR}
		)
	endif ()

# MEDIA_SRC
set(WXFILES_MEDIA_SRC
	${WXFILES_MEDIA_CMN_SRC}
	${WXFILES_MEDIA_PLATFORM_SRC}
)

# MEDIA_HDR
set(WXFILES_MEDIA_HDR
	${WXFILES_MEDIA_CMN_HDR}
	${WXFILES_MEDIA_PLATFORM_HDR}
)

# GUI_CORE_HEADERS
set(WXFILES_GUI_CORE_HEADERS
)
	if (WXBUILD_USE_GUI AND NOT WXBUILD_UNIVERSAL)
		list(APPEND WXFILES_GUI_CORE_HEADERS
			${WXFILES_GUI_HDR}
		)
	endif ()
	if (WXBUILD_USE_GUI AND WXBUILD_UNIVERSAL)
		list(APPEND WXFILES_GUI_CORE_HEADERS
			${WXFILES_UNIV_HDR}
		)
	endif ()

# ALL_GUI_HEADERS
set(WXFILES_ALL_GUI_HEADERS
)
	if (WXBUILD_USE_GUI)
		list(APPEND WXFILES_ALL_GUI_HEADERS
			${WXFILES_GUI_CMN_HDR}
			${WXFILES_LOWLEVEL_HDR}
			${WXFILES_GUI_CORE_HEADERS}
			${WXFILES_ADVANCED_HDR}
			${WXFILES_MEDIA_HDR}
			${WXFILES_HTML_HDR}
			${WXFILES_OPENGL_HDR}
			${WXFILES_QA_HDR}
			${WXFILES_XRC_HDR}
			${WXFILES_AUI_HDR}
			${WXFILES_PROPGRID_HDR}
			${WXFILES_RIBBON_HDR}
			${WXFILES_RICHTEXT_HDR}
			${WXFILES_STC_HDR}
			${WXFILES_WEBVIEW_HDR}
		)
	endif ()

# ALL_BASE_HEADERS
set(WXFILES_ALL_BASE_HEADERS
	${WXFILES_BASE_CMN_HDR}
	${WXFILES_BASE_PLATFORM_HDR}
	${WXFILES_NET_CMN_HDR}
	${WXFILES_XML_HDR}
)

# ALL_HEADERS
set(WXFILES_ALL_HEADERS
	${WXFILES_ALL_BASE_HEADERS}
	${WXFILES_ALL_GUI_HEADERS}
)

# ALL_PORTS_BASE_HEADERS
set(WXFILES_ALL_PORTS_BASE_HEADERS
	${WXFILES_BASE_CMN_HDR}
	${WXFILES_BASE_UNIX_HDR}
	${WXFILES_BASE_WIN32_HDR}
	${WXFILES_BASE_WINCE_HDR}
	${WXFILES_BASE_OSX_HDR}
	${WXFILES_BASE_MSDOS_HDR}
	${WXFILES_NET_CMN_HDR}
	${WXFILES_XML_HDR}
)

# ALL_BASE_SOURCES
set(WXFILES_ALL_BASE_SOURCES
	${WXFILES_BASE_CMN_SRC}
	${WXFILES_BASE_UNIX_SRC}
	${WXFILES_BASE_WIN32_SRC}
	${WXFILES_BASE_WINCE_SRC}
	${WXFILES_BASE_OSX_SRC}
	${WXFILES_BASE_OS2_SRC}
	${WXFILES_BASE_MSDOS_SRC}
	${WXFILES_BASE_AND_GUI_CMN_SRC}
	${WXFILES_BASE_AND_GUI_OSX_CARBON_SRC}
	${WXFILES_BASE_AND_GUI_OSX_COCOA_SRC}
	${WXFILES_BASE_AND_GUI_WIN32_SRC}
	${WXFILES_NET_CMN_SRC}
	${WXFILES_NET_UNIX_SRC}
	${WXFILES_NET_OSX_SRC}
	${WXFILES_NET_WIN32_SRC}
	${WXFILES_NET_WINCE_SRC}
	${WXFILES_XML_SRC}
)

# PLUGIN_ADV_SRC
set(WXFILES_PLUGIN_ADV_SRC
)
	if ("${WXBUILD_PLATFORM}" STREQUAL "unix")
		list(APPEND WXFILES_PLUGIN_ADV_SRC
			${WXFILES_UNIX_SOUND_SRC_SDL}
		)
	endif ()

# PLUGIN_MONOLIB_SRC
set(WXFILES_PLUGIN_MONOLIB_SRC
	${WXFILES_PLUGIN_ADV_SRC}
)


