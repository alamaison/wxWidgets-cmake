set(WXSETUP_wxUSE_GRAPHICS_CONTEXT_HELP "Toggle wxUSE_GRAPHICS_CONTEXT")

set(WXSETUP_wxUSE_UTF8_LOCALE_ONLY_HELP "Toggle wxUSE_UTF8_LOCALE_ONLY")

set(WXSETUP_wxUSE_EPOLL_DISPATCHER_HELP "Toggle wxUSE_EPOLL_DISPATCHER")

set(WXSETUP_wxUSE_SELECT_DISPATCHER_HELP "Toggle wxUSE_SELECT_DISPATCHER")

set(WXSETUP_wxUSE_AUTOID_MANAGEMENT_HELP "Toggle wxUSE_AUTOID_MANAGEMENT")

set(WXSETUP_wxUSE_LIBMSPACK_HELP "Toggle wxUSE_LIBMSPACK")

set(WXSETUP_wxUSE_STACKWALKER_HELP "Set this to 1 to be able to generate a human-readable (unlike\nmachine-readable minidump created by wxCrashReport::Generate()) stack back\ntrace when your program crashes using wxStackWalker\n\nDefault is 1 if supported by the compiler.\n\nRecommended setting: 1, set to 0 if your programs never crash")

set(WXSETUP_wxUSE_UNICODE_UTF8_HELP "Toggle wxUSE_UNICODE_UTF8")

option(WXSETUP_wxUSE_GRAPHICS_CONTEXT "${WXSETUP_wxUSE_GRAPHICS_CONTEXT_HELP}" ON)
option(WXSETUP_wxUSE_UTF8_LOCALE_ONLY "${WXSETUP_wxUSE_UTF8_LOCALE_ONLY_HELP}" OFF)
option(WXSETUP_wxUSE_EPOLL_DISPATCHER "${WXSETUP_wxUSE_EPOLL_DISPATCHER_HELP}" OFF)
option(WXSETUP_wxUSE_SELECT_DISPATCHER "${WXSETUP_wxUSE_SELECT_DISPATCHER_HELP}" ON)
option(WXSETUP_wxUSE_AUTOID_MANAGEMENT "${WXSETUP_wxUSE_AUTOID_MANAGEMENT_HELP}" OFF)
option(WXSETUP_wxUSE_LIBMSPACK "${WXSETUP_wxUSE_LIBMSPACK_HELP}" ${HAVE_LIB_MSPACK})
option(WXSETUP_wxUSE_STACKWALKER "${WXSETUP_wxUSE_STACKWALKER_HELP}" ON)
option(WXSETUP_wxUSE_UNICODE_UTF8 "${WXSETUP_wxUSE_UNICODE_UTF8_HELP}" OFF)


list(APPEND WXBUILD_ALL_OPTIONS
	wxUSE_GRAPHICS_CONTEXT
	wxUSE_UTF8_LOCALE_ONLY
	wxUSE_EPOLL_DISPATCHER
	wxUSE_SELECT_DISPATCHER
	wxUSE_AUTOID_MANAGEMENT
	wxUSE_LIBMSPACK
	wxUSE_STACKWALKER
	wxUSE_UNICODE_UTF8
)