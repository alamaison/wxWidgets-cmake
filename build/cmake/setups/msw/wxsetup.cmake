set(WXSETUP_wxUSE_OLE_HELP "Set this to 1 for generic OLE support: this is required for drag-and-drop,\nclipboard, OLE Automation. Only set it to 0 if your compiler is very old and\ncan't compile/doesn't have the OLE headers.\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_CRASHREPORT_HELP "Set this to 1 to be able to use wxCrashReport::Generate() to create mini\ndumps of your program when it crashes (or at any other moment)\n\nDefault is 1 if supported by the compiler (VC++ and recent BC++ only).\n\nRecommended setting: 1, set to 0 if your programs never crash")

set(WXSETUP_wxUSE_WEBVIEW_IE_HELP "Toggle wxUSE_WEBVIEW_IE")

set(WXSETUP_wxUSE_AUTOID_MANAGEMENT_HELP "Toggle wxUSE_AUTOID_MANAGEMENT")

set(WXSETUP_wxUSE_TASKBARICON_BALLOONS_HELP "Set this to 1 to enable MSW-specific wxTaskBarIcon::ShowBalloon() method. It\nis required by native wxNotificationMessage implementation.\n\nDefault is 1 but disabled in wx/msw/chkconf.h if SDK is too old to contain\nthe necessary declarations.\n\nRecommended setting: 1, set to 0 for a tiny library size reduction")

set(WXSETUP_wxUSE_OWNER_DRAWN_HELP "Set this to 1 to enable support for the owner-drawn menu and listboxes. This\nis required by wxUSE_CHECKLISTBOX.\n\nDefault is 1.\n\nRecommended setting: 1, set to 0 for a small library size reduction")

set(WXSETUP_wxUSE_UNICODE_MSLU_HELP "Toggle wxUSE_UNICODE_MSLU")

set(WXSETUP_wxUSE_RICHEDIT_HELP "Set this to 1 to use RICHEDIT controls for wxTextCtrl with style wxTE_RICH\nwhich allows to put more than ~32Kb of text in it even under Win9x (NT\ndoesn't have such limitation).\n\nDefault is 1 for compilers which support it\n\nRecommended setting: 1, only set it to 0 if your compiler doesn't have\nor can't compile <richedit.h>")

set(WXSETUP_wxUSE_MFC_HELP "Set this to 1 if you want to use wxWidgets and MFC in the same program. This\nwill override some other settings (see below)\n\nDefault is 0.\n\nRecommended setting: 0 unless you really have to use MFC")

set(WXSETUP_wxUSE_DATEPICKCTRL_GENERIC_HELP "Set this to 1 to be able to use wxDatePickerCtrlGeneric in addition to the\nnative wxDatePickerCtrl\n\nDefault is 0.\n\nRecommended setting: 0, this is mainly used for testing")

set(WXSETUP_wxUSE_WXDIB_HELP "Set this to 1 to enable wxDIB class used internally for manipulating\nwxBitmap data.\n\nDefault is 1, set it to 0 only if you don't use wxImage neither\n\nRecommended setting: 1 (without it conversion to/from wxImage won't work)")

set(WXSETUP_wxUSE_ACTIVEX_HELP "Set this to 1 to enable wxActiveXContainer class allowing to embed OLE\ncontrols in wx.\n\nDefault is 1.\n\nRecommended setting: 1, required by wxMediaCtrl")

set(WXSETUP_wxUSE_DC_CACHEING_HELP "wxDC caching implementation")

set(WXSETUP_wxUSE_UXTHEME_HELP "Set to 1 to compile MS Windows XP theme engine support")

set(WXSETUP_wxUSE_RICHEDIT2_HELP "Set this to 1 to use extra features of richedit v2 and later controls\n\nDefault is 1 for compilers which support it\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_INICONF_HELP "Set to 1 to enable .INI files based wxConfig implementation (wxIniConfig)\n\nDefault is 0.\n\nRecommended setting: 0, nobody uses .INI files any more")

set(WXSETUP_wxUSE_INKEDIT_HELP "Set to 1 to use InkEdit control (Tablet PC), if available")

set(WXSETUP_wxUSE_WEBVIEW_WEBKIT_HELP "Toggle wxUSE_WEBVIEW_WEBKIT")

set(WXSETUP_wxUSE_GRAPHICS_CONTEXT_HELP "Toggle wxUSE_GRAPHICS_CONTEXT")

set(WXSETUP_wxUSE_TIMEPICKCTRL_GENERIC_HELP "Set this to 1 to be able to use wxTimePickerCtrlGeneric in addition to the\nnative wxTimePickerCtrl for the platforms that have the latter (MSW).\n\nDefault is 0.\n\nRecommended setting: 0, this is mainly used for testing")

set(WXSETUP_wxUSE_REGKEY_HELP "Set this to 1 to compile in wxRegKey class.\n\nDefault is 1\n\nRecommended setting: 1, this is used internally by wx in a few places")

set(WXSETUP_wxUSE_POSTSCRIPT_ARCHITECTURE_IN_MSW_HELP "Set to 0 to disable PostScript print/preview architecture code under Windows\n(just use Windows printing).")

set(WXSETUP_wxUSE_OLE_AUTOMATION_HELP "Set this to 1 to enable wxAutomationObject class.\n\nDefault is 1.\n\nRecommended setting: 1 if you need to control other applications via OLE\nAutomation, can be safely set to 0 otherwise")

set(WXSETUP_wxUSE_STACKWALKER_HELP "Set this to 1 to be able to generate a human-readable (unlike\nmachine-readable minidump created by wxCrashReport::Generate()) stack back\ntrace when your program crashes using wxStackWalker\n\nDefault is 1 if supported by the compiler.\n\nRecommended setting: 1, set to 0 if your programs never crash")

option(WXSETUP_wxUSE_OLE "${WXSETUP_wxUSE_OLE_HELP}" ON)
option(WXSETUP_wxUSE_CRASHREPORT "${WXSETUP_wxUSE_CRASHREPORT_HELP}" ON)
option(WXSETUP_wxUSE_WEBVIEW_IE "${WXSETUP_wxUSE_WEBVIEW_IE_HELP}" ON)
option(WXSETUP_wxUSE_AUTOID_MANAGEMENT "${WXSETUP_wxUSE_AUTOID_MANAGEMENT_HELP}" ON)
option(WXSETUP_wxUSE_TASKBARICON_BALLOONS "${WXSETUP_wxUSE_TASKBARICON_BALLOONS_HELP}" ON)
option(WXSETUP_wxUSE_OWNER_DRAWN "${WXSETUP_wxUSE_OWNER_DRAWN_HELP}" ON)
option(WXSETUP_wxUSE_UNICODE_MSLU "${WXSETUP_wxUSE_UNICODE_MSLU_HELP}" OFF)
option(WXSETUP_wxUSE_RICHEDIT "${WXSETUP_wxUSE_RICHEDIT_HELP}" ON)
option(WXSETUP_wxUSE_MFC "${WXSETUP_wxUSE_MFC_HELP}" OFF)
option(WXSETUP_wxUSE_DATEPICKCTRL_GENERIC "${WXSETUP_wxUSE_DATEPICKCTRL_GENERIC_HELP}" OFF)
option(WXSETUP_wxUSE_WXDIB "${WXSETUP_wxUSE_WXDIB_HELP}" ON)
option(WXSETUP_wxUSE_ACTIVEX "${WXSETUP_wxUSE_ACTIVEX_HELP}" ON)
option(WXSETUP_wxUSE_DC_CACHEING "${WXSETUP_wxUSE_DC_CACHEING_HELP}" ON)
option(WXSETUP_wxUSE_UXTHEME "${WXSETUP_wxUSE_UXTHEME_HELP}" ON)
option(WXSETUP_wxUSE_RICHEDIT2 "${WXSETUP_wxUSE_RICHEDIT2_HELP}" ON)
option(WXSETUP_wxUSE_INICONF "${WXSETUP_wxUSE_INICONF_HELP}" OFF)
option(WXSETUP_wxUSE_INKEDIT "${WXSETUP_wxUSE_INKEDIT_HELP}" OFF)
option(WXSETUP_wxUSE_WEBVIEW_WEBKIT "${WXSETUP_wxUSE_WEBVIEW_WEBKIT_HELP}" OFF)
option(WXSETUP_wxUSE_GRAPHICS_CONTEXT "${WXSETUP_wxUSE_GRAPHICS_CONTEXT_HELP}" OFF)
option(WXSETUP_wxUSE_TIMEPICKCTRL_GENERIC "${WXSETUP_wxUSE_TIMEPICKCTRL_GENERIC_HELP}" OFF)
option(WXSETUP_wxUSE_REGKEY "${WXSETUP_wxUSE_REGKEY_HELP}" ON)
option(WXSETUP_wxUSE_POSTSCRIPT_ARCHITECTURE_IN_MSW "${WXSETUP_wxUSE_POSTSCRIPT_ARCHITECTURE_IN_MSW_HELP}" ON)
option(WXSETUP_wxUSE_OLE_AUTOMATION "${WXSETUP_wxUSE_OLE_AUTOMATION_HELP}" ON)
option(WXSETUP_wxUSE_STACKWALKER "${WXSETUP_wxUSE_STACKWALKER_HELP}" ON)


list(APPEND WXBUILD_ALL_OPTIONS
	wxUSE_OLE
	wxUSE_CRASHREPORT
	wxUSE_WEBVIEW_IE
	wxUSE_AUTOID_MANAGEMENT
	wxUSE_TASKBARICON_BALLOONS
	wxUSE_OWNER_DRAWN
	wxUSE_UNICODE_MSLU
	wxUSE_RICHEDIT
	wxUSE_MFC
	wxUSE_DATEPICKCTRL_GENERIC
	wxUSE_WXDIB
	wxUSE_ACTIVEX
	wxUSE_DC_CACHEING
	wxUSE_UXTHEME
	wxUSE_RICHEDIT2
	wxUSE_INICONF
	wxUSE_INKEDIT
	wxUSE_WEBVIEW_WEBKIT
	wxUSE_GRAPHICS_CONTEXT
	wxUSE_TIMEPICKCTRL_GENERIC
	wxUSE_REGKEY
	wxUSE_POSTSCRIPT_ARCHITECTURE_IN_MSW
	wxUSE_OLE_AUTOMATION
	wxUSE_STACKWALKER
)
