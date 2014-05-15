set(WXSETUP_wxUSE_HTML_HELP "wxHTML sublibrary allows to display HTML in wxWindow programs and much,\nmuch more.\n\nDefault is 1.\n\nRecommended setting: 1 (wxHTML is great!), set to 0 if you want compile a\nsmaller library.")

set(WXSETUP_wxUSE_STREAMS_HELP "If enabled, compiles wxWidgets streams classes\n\nwx stream classes are used for image IO, process IO redirection, network\nprotocols implementation and much more and so disabling this results in a\nlot of other functionality being lost.\n\nDefault is 1\n\nRecommended setting: 1 as setting it to 0 disables many other things")

set(WXSETUP_wxUSE_EXTENDED_RTTI_HELP "Set wxUSE_EXTENDED_RTTI to 1 to use extended RTTI\n\nDefault is 0\n\nRecommended setting: 0 (this is still work in progress...)")

set(WXSETUP_wxUSE_ARCHIVE_STREAMS_HELP "wxArchive classes for accessing archives such as zip and tar")

set(WXSETUP_wxUSE_THREADS_HELP "Support for multithreaded applications: if 1, compile in thread classes\n(thread.h) and make the library a bit more thread safe. Although thread\nsupport is quite stable by now, you may still consider recompiling the\nlibrary without it if you have no use for it - this will result in a\nsomewhat smaller and faster operation.\n\nNotice that if wxNO_THREADS is defined, wxUSE_THREADS is automatically reset\nto 0 in wx/chkconf.h, so, for example, if you set USE_THREADS to 0 in\nbuild/msw/config.* file this value will have no effect.\n\nDefault is 1\n\nRecommended setting: 0 unless you do plan to develop MT applications")

set(WXSETUP_wxUSE_XPM_HELP "Set to 1 for XPM format support")

set(WXSETUP_wxUSE_IPV6_HELP "Set to 1 to use ipv6 socket classes (requires wxUSE_SOCKETS)\n\nNotice that currently setting this option under Windows will result in\nprograms which can only run on recent OS versions (with ws2_32.dll\ninstalled) which is why it is disabled by default.\n\nDefault is 1.\n\nRecommended setting: 1 if you need IPv6 support")

set(WXSETUP_wxUSE_FILECTRL_HELP "wxFileCtrl")

set(WXSETUP_wxUSE_FSWATCHER_HELP "Set wxUSE_FSWATCHER to 1 if you want to enable wxFileSystemWatcher\n\nDefault is 1\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_FS_INET_HELP "Set to 1 to enable virtual Internet filesystem (requires wxUSE_FILESYSTEM)")

set(WXSETUP_wxUSE_DRAGIMAGE_HELP "Toggle wxUSE_DRAGIMAGE")

set(WXSETUP_wxUSE_LISTCTRL_HELP "wxListCtrl")

set(WXSETUP_wxUSE_FFILE_HELP "Toggle wxUSE_FFILE")

set(WXSETUP_wxUSE_CONSTRAINTS_HELP "Toggle wxUSE_CONSTRAINTS")

set(WXSETUP_wxUSE_PROTOCOL_HELP "wxProtocol and related classes: if you want to use either of wxFTP, wxHTTP\nor wxURL you need to set this to 1.\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_CONFIG_NATIVE_HELP "If wxUSE_CONFIG is 1, you may choose to use either the native config\nclasses under Windows (using .INI files under Win16 and the registry under\nWin32) or the portable text file format used by the config classes under\nUnix.\n\nDefault is 1 to use native classes. Note that you may still use\nwxFileConfig even if you set this to 1 - just the config object created by\ndefault for the applications needs will be a wxRegConfig or wxIniConfig and\nnot wxFileConfig.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_CHOICEDLG_HELP "Use single/multiple choice dialogs.\n\nDefault is 1\n\nRecommended setting: 1 (used in the library itself)")

set(WXSETUP_wxUSE_EDITABLELISTBOX_HELP "wxEditableListBox")

set(WXSETUP_wxUSE_GRID_HELP "wxGrid class\n\nDefault is 1, set to 0 to cut down compilation time and binaries size if you\ndon't use it.\n\nRecommended setting: 1\n")

set(WXSETUP_wxUSE_SYSTEM_OPTIONS_HELP "wxSystemOptions class")

set(WXSETUP_wxUSE_TEXTCTRL_HELP "wxTextCtrl")

set(WXSETUP_wxUSE_MEDIACTRL_HELP "Use wxMediaCtrl\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_BUTTON_HELP "wxButton")

set(WXSETUP_wxUSE_APPLE_IEEE_HELP "If enabled, the code written by Apple will be used to write, in a portable\nway, float on the disk. See extended.c for the license which is different\nfrom wxWidgets one.\n\nDefault is 1.\n\nRecommended setting: 1 unless you don't like the license terms (unlikely)")

set(WXSETUP_wxUSE_INTL_HELP "i18n support: _() macro, wxLocale class. Requires wxTextFile.")

set(WXSETUP_wxUSE_PROTOCOL_HTTP_HELP "Toggle wxUSE_PROTOCOL_HTTP")

set(WXSETUP_wxUSE_DISPLAY_HELP "Use wxDisplay class: it allows enumerating all displays on a system and\ntheir geometries as well as finding the display on which the given point or\nwindow lies.\n\nDefault is 1.\n\nRecommended setting: 1 if you need it, can be safely set to 0 otherwise")

set(WXSETUP_wxUSE_COMPILER_TLS_HELP "Enable the use of compiler-specific thread local storage keyword, if any.\nThis is used for wxTLS_XXX() macros implementation and normally should use\nthe compiler-provided support as it's simpler and more efficient, but is\ndisabled under Windows in wx/msw/chkconf.h as it can't be used if wxWidgets\nis used in a dynamically loaded Win32 DLL (i.e. using LoadLibrary()) under\nXP as this triggers a bug in compiler TLS support that results in crashes\nwhen any TLS variables are used.\n\nIf you're absolutely sure that your build of wxWidgets is never going to be\nused in such situation, either because it's not going to be linked from any\nkind of plugin or because you only target Vista or later systems, you can\nset this to 2 to force the use of compiler TLS even under MSW.\n\nDefault is 1 meaning that compiler TLS is used only if it's 100% safe.\n\nRecommended setting: 2 if you want to have maximal performance and don't\ncare about the scenario described above.")

set(WXSETUP_wxUSE_THEME_WIN32_HELP "Toggle wxUSE_THEME_WIN32")

set(WXSETUP_wxUSE_COMMON_DIALOGS_HELP "On rare occasions (e.g. using DJGPP) may want to omit common dialogs (e.g.\nfile selector, printer dialog). Switching this off also switches off the\nprinting architecture and interactive wxPrinterDC.\n\nDefault is 1\n\nRecommended setting: 1 (unless it really doesn't work)")

set(WXSETUP_wxUSE_METAFILE_HELP "Windows supports the graphics format known as metafile which is, though not\nportable, is widely used under Windows and so is supported by wxWin (under\nWindows only, of course). Win16 (Win3.1) used the so-called \"Window\nMetaFiles\" or WMFs which were replaced with \"Enhanced MetaFiles\" or EMFs in\nWin32 (Win9x, NT, 2000). Both of these are supported in wxWin and, by\ndefault, WMFs will be used under Win16 and EMFs under Win32. This may be\nchanged by setting wxUSE_WIN_METAFILES_ALWAYS to 1 and/or setting\nwxUSE_ENH_METAFILE to 0. You may also set wxUSE_METAFILE to 0 to not compile\nin any metafile related classes at all.\n\nDefault is 1 for wxUSE_ENH_METAFILE and 0 for wxUSE_WIN_METAFILES_ALWAYS.\n\nRecommended setting: default or 0 for everything for portable programs.")

set(WXSETUP_wxUSE_FILEPICKERCTRL_HELP "wxFilePickerCtrl")

set(WXSETUP_wxUSE_CHECKBOX_HELP "wxCheckBox")

set(WXSETUP_wxUSE_CMDLINE_PARSER_HELP "Support for command line parsing using wxCmdLineParser class.\n\nDefault is 1\n\nRecommended setting: 1 (can be set to 0 if you don't use the cmd line)")

set(WXSETUP_wxUSE_HELP_HELP "Toggle wxUSE_HELP")

set(WXSETUP_wxUSE_GEOMETRY_HELP "Miscellaneous geometry code: needed for Canvas library")

set(WXSETUP_wxDIALOG_UNIT_COMPATIBILITY_HELP "MSW-only: Set to 0 for accurate dialog units, else 1 for old behaviour when\ndefault system font is used for wxWindow::GetCharWidth/Height() instead of\nthe current font.\n\nDefault is 0\n\nRecommended setting: 0")

set(WXSETUP_wxUSE_BANNERWINDOW_HELP "wxBannerWindow")

set(WXSETUP_wxUSE_CAIRO_HELP "Enable wxGraphicsContext implementation using Cairo library.\n\nThis is not needed under Windows and detected automatically by configure\nunder other systems, however you may set this to 1 manually if you installed\nCairo under Windows yourself and prefer to use it instead the native GDI+\nimplementation.\n\nDefault is 0\n\nRecommended setting: 0")

set(WXSETUP_wxUSE_MOUSEWHEEL_HELP "Toggle wxUSE_MOUSEWHEEL")

set(WXSETUP_wxUSE_ARTPROVIDER_STD_HELP "Use the standard art provider. The icons returned by this provider are\nembedded into the library as XPMs so disabling it reduces the library size\nsomewhat but this should only be done if you use your own custom art\nprovider returning the icons or never use any icons not provided by the\nnative art provider (which might not be implemented at all for some\nplatforms) or by the Tango icons provider (if it's not itself disabled\nbelow).\n\nDefault is 1.\n\nRecommended setting: 1 unless you use your own custom art provider.")

set(WXSETUP_wxUSE_RICHTOOLTIP_HELP "wxRichToolTip is a customizable tooltip class which has more functionality\nthan the stock (but native, unlike this class) wxToolTip.\n\nDefault is 1.\n\nRecommended setting: 1 (but can be safely set to 0 if you don't need it)")

set(WXSETUP_wxUSE_TOOLBOOK_HELP "wxToolbook control is similar to wxNotebook but uses wxToolBar instead of\ntabs\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_TREEBOOK_HELP "wxTreebook control is similar to wxNotebook but uses wxTreeCtrl instead of\nthe tabs\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_SPINCTRL_HELP "wxSpinCtrl")

set(WXSETUP_wxUSE_HEADERCTRL_HELP "wxHeaderCtrl")

set(WXSETUP_wxUSE_MINIFRAME_HELP "wxMiniFrame class: a frame with narrow title bar\n\nDefault is 1.\n\nRecommended setting: 1 (it doesn't cost almost anything)")

set(WXSETUP_wxUSE_STATUSBAR_HELP "Use a status bar class? Depending on the value of wxUSE_NATIVE_STATUSBAR\nbelow either wxStatusBar95 or a generic wxStatusBar will be used.\n\nDefault is 1\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_REARRANGECTRL_HELP "wxRearrangeCtrl is a wxCheckListBox with two buttons allowing to move items\nup and down in it. It is also used as part of wxRearrangeDialog.\n\nDefault is 1.\n\nRecommended setting: 1 but can be safely set to 0 (currently used only by\nwxHeaderCtrl)")

set(WXSETUP_wxUSE_SCROLLBAR_HELP "wxScrollBar")

set(WXSETUP_wxUSE_THEME_GTK_HELP "Set to 1 to enable the compilation of individual theme if wxUSE_ALL_THEMES\nis unset, if it is set these options are not used; notice that metal theme\nuses Win32 one")

set(WXSETUP_wxUSE_WEBVIEW_HELP "Use wxWidget's web viewing classes\n\nDefault is 1\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_THEME_MONO_HELP "Toggle wxUSE_THEME_MONO")

set(WXSETUP_wxUSE_STARTUP_TIPS_HELP "support for startup tips (wxShowTip &c)")

set(WXSETUP_wxUSE_SOCKETS_HELP "Set to 1 to use socket classes")

set(WXSETUP_wxUSE_CARET_HELP "Use wxCaret: a class implementing a \"cursor\" in a text control (called caret\nunder Windows).\n\nDefault is 1.\n\nRecommended setting: 1 (can be safely set to 0, not used by the library)")

set(WXSETUP_wxUSE_CHECKLISTBOX_HELP "wxCheckListBox (requires wxUSE_OWNER_DRAWN)")

set(WXSETUP_wxUSE_ARTPROVIDER_TANGO_HELP "Use art provider providing Tango icons: this art provider has higher quality\nicons than the default ones using smaller size XPM icons without\ntransparency but the embedded PNG icons add to the library size.\n\nDefault is 1 under non-GTK ports. Under wxGTK the native art provider using\nthe GTK+ stock icons replaces it so it is normally not necessary.\n\nRecommended setting: 1 but can be turned off to reduce the library size.")

set(WXSETUP_wxUSE_XRC_HELP "Use wxWidget's XRC XML-based resource system.  Recommended.\n\nDefault is 1\n\nRecommended setting: 1 (requires wxUSE_XML)")

set(WXSETUP_wxUSE_NOTEBOOK_HELP "wxNotebook is a control with several \"tabs\" located on one of its sides. It\nmay be used to logically organise the data presented to the user instead of\nputting everything in one huge dialog. It replaces wxTabControl and related\nclasses of wxWin 1.6x.\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_LISTBOOK_HELP "wxListbook control is similar to wxNotebook but uses wxListCtrl instead of\nthe tabs\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_MDI_HELP "Set to 0 to disable MDI support.\n\nRequires wxUSE_NOTEBOOK under platforms other than MSW.\n\nDefault is 1.\n\nRecommended setting: 1, can be safely set to 0.")

set(WXSETUP_wxUSE_DATAVIEWCTRL_HELP "wxDataViewCtrl")

set(WXSETUP_wxUSE_LIBPNG_HELP "Set to 1 for PNG format support (requires libpng). Also requires wxUSE_ZLIB.")

set(WXSETUP_wxUSE_FS_ZIP_HELP "Set to 1 to enable virtual ZIP filesystem (requires wxUSE_FILESYSTEM)")

set(WXSETUP_wxUSE_LISTBOX_HELP "wxListBox")

set(WXSETUP_wxUSE_TIMEPICKCTRL_HELP "wxTimePickerCtrl")

set(WXSETUP_wxUSE_DIRDLG_HELP "wxDirDlg class for getting a directory name from user")

set(WXSETUP_wxUSE_DOC_VIEW_ARCHITECTURE_HELP "Set to 0 to disable document/view architecture")

set(WXSETUP_wxUSE_WCHAR_T_HELP "wxUSE_WCHAR_T is required by wxWidgets now, don't change.")

set(WXSETUP_wxUSE_LONGLONG_HELP "Set wxUSE_LONGLONG to 1 to compile the wxLongLong class. This is a 64 bit\ninteger which is implemented in terms of native 64 bit integers if any or\nuses emulation otherwise.\n\nThis class is required by wxDateTime and so you should enable it if you want\nto use wxDateTime. For most modern platforms, it will use the native 64 bit\nintegers in which case (almost) all of its functions are inline and it\nalmost does not take any space, so there should be no reason to switch it\noff.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_ANY_HELP "Support for wxAny class, the successor for wxVariant.\n\nDefault is 1.\n\nRecommended setting: 1 unless you want to reduce the library size by a small amount,\nor your compiler cannot for some reason cope with complexity of templates used.")

set(WXSETUP_wxUSE_STATBMP_HELP "wxStaticBitmap")

set(WXSETUP_wxUSE_MEMORY_TRACING_HELP "If 1, enables debugging versions of wxObject::new and wxObject::delete *IF*\n__WXDEBUG__ is also defined.\n\nWARNING: this code may not work with all architectures, especially if\nalignment is an issue. This switch is currently ignored for mingw / cygwin\n\nDefault is 0\n\nRecommended setting: 1 if you are not using a memory debugging tool, else 0")

set(WXSETUP_wxUSE_XLOCALE_HELP "Provide wxFoo_l() functions similar to standard foo() functions but taking\nan extra locale parameter.\n\nNotice that this is fully implemented only for the systems providing POSIX\nxlocale support or Microsoft Visual C++ >= 8 (which provides proprietary\nalmost-equivalent of xlocale functions), otherwise wxFoo_l() functions will\nonly work for the current user locale and \"C\" locale. You can use\nwxHAS_XLOCALE_SUPPORT to test whether the full support is available.\n\nDefault is 1\n\nRecommended setting: 1 but may be disabled if you are writing programs\nrunning only in C locale anyhow")

set(WXSETUP_wxUSE_JOYSTICK_HELP "Joystick support class")

set(WXSETUP_wxUSE_POSTSCRIPT_HELP "Set to 1 for PostScript device context.")

set(WXSETUP_wxUSE_MSGDLG_HELP "Use wxMessageDialog and wxMessageBox.\n\nDefault is 1\n\nRecommended setting: 1 (used in the library itself)")

set(WXSETUP_wxUSE_SPLASH_HELP "splash screen class")

set(WXSETUP_wxUSE_LIBJPEG_HELP "Set to 1 for JPEG format support (requires libjpeg)")

set(WXSETUP_wxUSE_WXHTML_HELP_HELP "Use wxHTML-based help controller?")

set(WXSETUP_WXWIN_COMPATIBILITY_3_0_HELP "This setting determines the compatibility with 3.0 API: set it to 0 to\nflag all cases of using deprecated functions.\n\nDefault is 1 but please try building your code with 0 as the default will\nchange to 0 in the next version and the deprecated functions will disappear\nin the version after it completely.\n\nRecommended setting: 0 (please update your code)")

set(WXSETUP_wxUSE_FSVOLUME_HELP "Use wxFSVolume class providing access to the configured/active mount points\n\nDefault is 1\n\nRecommended setting: 1 (but may be safely disabled if you don't use it)")

set(WXSETUP_wxUSE_SVG_HELP "Set to 1 to compile in support for wxSVGFileDC, a wxDC subclass which allows\nto create files in SVG (Scalable Vector Graphics) format.")

set(WXSETUP_wxUSE_STD_CONTAINERS_HELP "Use standard C++ containers to implement wxVector<>, wxStack<>, wxDList<>\nand wxHashXXX<> classes. If disabled, wxWidgets own (mostly compatible but\nusually more limited) implementations are used which allows to avoid the\ndependency on the C++ run-time library.\n\nNotice that the compilers mentioned in wxUSE_STD_DEFAULT comment above don't\nsupport using standard containers and that VC6 needs non-default options for\nsuch build to avoid getting \"fatal error C1076: compiler limit : internal\nheap limit reached; use /Zm to specify a higher limit\" in its own standard\nheaders, so you need to ensure you do increase the heap size before enabling\nthis option for this compiler.\n\nDefault is 0 for compatibility reasons.\n\nRecommended setting: 1 unless compatibility with the official wxWidgets\nbuild and/or the existing code is a concern.")

set(WXSETUP_wxUSE_DEBUG_CONTEXT_HELP "If 1, enables wxDebugContext, for writing error messages to file, etc. If\n__WXDEBUG__ is not defined, will still use the normal memory operators.\n\nDefault is 0\n\nRecommended setting: 0")

set(WXSETUP_wxUSE_NUMBERDLG_HELP "number entry dialog")

set(WXSETUP_wxUSE_THEME_METAL_HELP "Toggle wxUSE_THEME_METAL")

set(WXSETUP_wxUSE_PROGRESSDLG_HELP "progress dialog class for lengthy operations")

set(WXSETUP_wxUSE_STD_IOSTREAM_HELP "Use standard C++ streams if 1 instead of wx streams in some places. If\ndisabled, wx streams are used everywhere and wxWidgets doesn't depend on the\nstandard streams library.\n\nNotice that enabling this does not replace wx streams with std streams\neverywhere, in a lot of places wx streams are used no matter what.\n\nDefault is 1 if compiler supports it.\n\nRecommended setting: 1 if you use the standard streams anyhow and so\ndependency on the standard streams library is not a\nproblem")

set(WXSETUP_wxUSE_BUSYINFO_HELP "wxBusyInfo displays window with message when app is busy. Works in same way\nas wxBusyCursor")

set(WXSETUP_wxUSE_RICHMSGDLG_HELP "wxRichMessageDialog")

set(WXSETUP_wxUSE_HOTKEY_HELP "Hotkey support (currently Windows only)")

set(WXSETUP_wxUSE_CONTROLS_HELP "You must set wxUSE_CONTROLS to 1 if you are using any controls at all\n(without it, wxControl class is not compiled)\n\nDefault is 1\n\nRecommended setting: 1 (don't change except for very special programs)")

set(WXSETUP_wxUSE_ANIMATIONCTRL_HELP "Each of the settings below corresponds to one wxWidgets control. They are\nall switched on by default but may be disabled if you are sure that your\nprogram (including any standard dialogs it can show!) doesn't need them and\nif you desperately want to save some space. If you use any of these you must\nset wxUSE_CONTROLS as well.\n\nDefault is 1\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_FILEDLG_HELP "Use file open/save dialogs.\n\nDefault is 1\n\nRecommended setting: 1 (used in many places in the library itself)")

set(WXSETUP_wxUSE_SPLITTER_HELP "Use wxSplitterWindow class.\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_MENUS_HELP "Use wxMenu, wxMenuBar, wxMenuItem.\n\nDefault is 1.\n\nRecommended setting: 1 (can't be disabled under MSW)")

set(WXSETUP_wxUSE_DEBUG_NEW_ALWAYS_HELP "In debug mode, causes new to be defined to be WXDEBUG_NEW (see object.h). If\nthis causes problems (e.g. link errors), set this to 0. You may need to set\nthis to 0 if using templates (at least for VC++). This switch is currently\nignored for MinGW/Cygwin.\n\nDefault is 0\n\nRecommended setting: 0")

set(WXSETUP_wxUSE_MDI_ARCHITECTURE_HELP "Set to 0 to disable MDI document/view architecture\n\nRequires wxUSE_MDI && wxUSE_DOC_VIEW_ARCHITECTURE")

set(WXSETUP_wxUSE_SLIDER_HELP "wxSlider")

set(WXSETUP_wxUSE_STATLINE_HELP "wxStaticLine")

set(WXSETUP_wxUSE_NATIVE_STATUSBAR_HELP "Two status bar implementations are available under Win32: the generic one\nor the wrapper around native control. For native look and feel the native\nversion should be used.\n\nDefault is 1 for the platforms where native status bar is supported.\n\nRecommended setting: 1 (there is no advantage in using the generic one)")

set(WXSETUP_wxUSE_MS_HTML_HELP_HELP "Should we use MS HTML help for wxHelpController? If disabled, neither\nwxCHMHelpController nor wxBestHelpController are available.\n\nDefault is 1 under MSW, 0 is always used for the other platforms.\n\nRecommended setting: 1, only set to 0 if you have trouble compiling\nwxCHMHelpController (could be a problem with really ancient compilers)")

set(WXSETUP_wxUSE_BASE64_HELP "Set wxUSE_BASE64 to 1, to compile in Base64 support. This is required for\nstoring binary data in wxConfig on most platforms.\n\nDefault is 1.\n\nRecommended setting: 1 (but can be safely disabled if you don't use it)")

set(WXSETUP_wxUSE_FONTMAP_HELP "wxFontMapper class")

set(WXSETUP_wxUSE_CALENDARCTRL_HELP "wxCalendarCtrl")

set(WXSETUP_wxUSE_VALIDATORS_HELP "wxValidator class and related methods")

set(WXSETUP_wxUSE_URL_HELP "Define this to use wxURL class.")

set(WXSETUP_wxUSE_CHOICEBOOK_HELP "wxChoicebook control is similar to wxNotebook but uses wxChoice instead of\nthe tabs\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_TOOLBAR_NATIVE_HELP "Toggle wxUSE_TOOLBAR_NATIVE")

set(WXSETUP_wxUSE_CHOICE_HELP "wxChoice")

set(WXSETUP_wxUSE_AFM_FOR_POSTSCRIPT_HELP "Set to 1 to use font metric files in GetTextExtent")

set(WXSETUP_wxUSE_GLOBAL_MEMORY_OPERATORS_HELP "In debug mode, cause new and delete to be redefined globally.\nIf this causes problems (e.g. link errors which is a common problem\nespecially if you use another library which also redefines the global new\nand delete), set this to 0.\nThis switch is currently ignored for mingw / cygwin\n\nDefault is 0\n\nRecommended setting: 0")

set(WXSETUP_wxUSE_IPC_HELP "Toggle wxUSE_IPC")

set(WXSETUP_wxUSE_PNM_HELP "Set to 1 for PNM format support")

set(WXSETUP_wxUSE_WIN_METAFILES_ALWAYS_HELP "Toggle wxUSE_WIN_METAFILES_ALWAYS")

set(WXSETUP_wxUSE_UIACTIONSIMULATOR_HELP "Compile wxUIActionSimulator class?")

set(WXSETUP_wxUSE_FONTDLG_HELP "Use font picker dialog\n\nDefault is 1\n\nRecommended setting: 1 (used in the library itself)")

set(WXSETUP_wxUSE_WIZARDDLG_HELP "wizards")

set(WXSETUP_wxUSE_MIMETYPE_HELP "wxMimeTypesManager class")

set(WXSETUP_wxUSE_TREELISTCTRL_HELP "wxTreeListCtrl")

set(WXSETUP_wxUSE_CLIPBOARD_HELP "Use wxClipboard class for clipboard copy/paste.\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_LIBTIFF_HELP "Set to 1 for TIFF format support (requires libtiff)")

set(WXSETUP_wxUSE_POPUPWIN_HELP "wxPopupWindow class is a top level transient window. It is currently used\nto implement wxTipWindow\n\nDefault is 1\n\nRecommended setting: 1 (may be set to 0 if you don't wxUSE_TIPWINDOW)")

set(WXSETUP_wxUSE_TARSTREAM_HELP "Set to 1 to compile wxTarInput/OutputStream classes.")

set(WXSETUP_wxUSE_TEXTBUFFER_HELP "use wxTextBuffer class: required by wxTextFile")

set(WXSETUP_wxUSE_COMMANDLINKBUTTON_HELP "wxCommandLinkButton")

set(WXSETUP_wxUSE_LOG_DIALOG_HELP "Recommended setting: 1")

set(WXSETUP_wxUSE_GAUGE_HELP "wxGauge")

set(WXSETUP_wxUSE_TEXTDLG_HELP "text entry dialog and wxGetTextFromUser function")

set(WXSETUP_wxUSE_FONTPICKERCTRL_HELP "wxFontPickerCtrl")

set(WXSETUP_wxUSE_TIMER_HELP "Set wxUSE_TIMER to 1 to compile wxTimer class\n\nDefault is 1\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_SNGLINST_CHECKER_HELP "wxSingleInstanceChecker class allows to verify at startup if another program\ninstance is running.\n\nDefault is 1\n\nRecommended setting: 1 (the class is tiny, disabling it won't save much\nspace)")

set(WXSETUP_wxUSE_LOG_HELP "Support for message/error logging. This includes wxLogXXX() functions and\nwxLog and derived classes. Don't set this to 0 unless you really know what\nyou are doing.\n\nDefault is 1\n\nRecommended setting: 1 (always)")

set(WXSETUP_wxUSE_ABOUTDLG_HELP "Compile in wxAboutBox() function showing the standard \"About\" dialog.\n\nDefault is 1\n\nRecommended setting: 1 but can be set to 0 to save some space if you don't\nuse this function")

set(WXSETUP_wxUSE_DC_TRANSFORM_MATRIX_HELP "Should wxDC provide SetTransformMatrix() and related methods?\n\nDefault is 1 but can be set to 0 if this functionality is not used. Notice\nthat currently only wxMSW supports this so setting this to 0 doesn't change\nmuch for non-MSW platforms (although it will still save a few bytes\nprobably).\n\nRecommended setting: 1.")

set(WXSETUP_wxUSE_DATAOBJ_HELP "Use wxDataObject and related classes. Needed for clipboard and OLE drag and\ndrop\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_STATBOX_HELP "wxStaticBox")

set(WXSETUP_wxUSE_DRAG_AND_DROP_HELP "Use wxDropTarget and wxDropSource classes for drag and drop (this is\ndifferent from \"built in\" drag and drop in wxTreeCtrl which is always\navailable). Requires wxUSE_DATAOBJ.\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_XML_HELP "XML parsing classes. Note that their API will change in the future, so\nusing wxXmlDocument and wxXmlNode in your app is not recommended.\n\nDefault is the same as wxUSE_XRC, i.e. 1 by default.\n\nRecommended setting: 1 (required by XRC)")

set(WXSETUP_wxUSE_SOUND_HELP "wxSound class")

set(WXSETUP_wxUSE_RICHTEXT_HELP "wxRichTextCtrl allows editing of styled text.\n\nDefault is 1.\n\nRecommended setting: 1, set to 0 if you want compile a\nsmaller library.")

set(WXSETUP_wxUSE_VARIANT_HELP "Support for wxVariant class used in several places throughout the library,\nnotably in wxDataViewCtrl API.\n\nDefault is 1.\n\nRecommended setting: 1 unless you want to reduce the library size as much as\npossible in which case setting this to 0 can gain up to 100KB.")

set(WXSETUP_WXWIN_COMPATIBILITY_2_8_HELP "This setting determines the compatibility with 2.8 API: set it to 0 to\nflag all cases of using deprecated functions.\n\nDefault is 1 but please try building your code with 0 as the default will\nchange to 0 in the next version and the deprecated functions will disappear\nin the version after it completely.\n\nRecommended setting: 0 (please update your code)")

set(WXSETUP_wxUSE_PREFERENCES_EDITOR_HELP "wxPreferencesEditor provides a common API for different ways of presenting\nthe standard \"Preferences\" or \"Properties\" dialog under different platforms\n(e.g. some use modal dialogs, some use modeless ones; some apply the changes\nimmediately while others require an explicit \"Apply\" button).\n\nDefault is 1.\n\nRecommended setting: 1 (but can be safely disabled if you don't use it)")

set(WXSETUP_wxUSE_PROPGRID_HELP "Use wxPropertyGrid.\n\nDefault is 1\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_URL_NATIVE_HELP "Define this to use native platform url and protocol support.\nCurrently valid only for MS-Windows.\nNote: if you set this to 1, you can open ftp/http/gopher sites\nand obtain a valid input stream for these sites\neven when you set wxUSE_PROTOCOL_FTP/HTTP to 0.\nDoing so reduces the code size.\n\nThis code is experimental and subject to change.")

set(WXSETUP_wxUSE_FILESYSTEM_HELP "Set to 1 to enable virtual file systems (required by wxHTML)")

set(WXSETUP_wxUSE_STD_STRING_HELP "Enable minimal interoperability with the standard C++ string class if 1.\n\"Minimal\" means that wxString can be constructed from std::string or\nstd::wstring but can't be implicitly converted to them. You need to enable\nthe option below for the latter.\n\nDefault is 1 for most compilers.\n\nRecommended setting: 1 unless you want to ensure your program doesn't use\nthe standard C++ library at all.")

set(WXSETUP_wxUSE_GLCANVAS_HELP "Setting wxUSE_GLCANVAS to 1 enables OpenGL support. You need to have OpenGL\nheaders and libraries to be able to compile the library with wxUSE_GLCANVAS\nset to 1 and, under Windows, also to add opengl32.lib and glu32.lib to the\nlist of libraries used to link your application (although this is done\nimplicitly for Microsoft Visual C++ users).\n\nDefault is 1 unless the compiler is known to ship without the necessary\nheaders (Digital Mars) or the platform doesn't support OpenGL (Windows CE).\n\nRecommended setting: 1 if you intend to use OpenGL, can be safely set to 0\notherwise.")

set(WXSETUP_wxUSE_ICO_CUR_HELP "Set to 1 for MS Icons and Cursors format support")

set(WXSETUP_wxUSE_GUI_HELP "Toggle wxUSE_GUI")

set(WXSETUP_wxUSE_RIBBON_HELP "Use wxWidget's Ribbon classes for interfaces\n\nDefault is 1\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_COLOURPICKERCTRL_HELP "wxColourPickerCtrl")

set(WXSETUP_wxUSE_RADIOBTN_HELP "wxRadioButton")

set(WXSETUP_wxUSE_ALL_THEMES_HELP "Set to 1 to enable compilation of all themes, this is the default")

set(WXSETUP_wxUSE_IOSTREAMH_HELP "VC++ 4.2 and above allows <iostream> and <iostream.h> but you can't mix\nthem. Set this option to 1 to use <iostream.h>, 0 to use <iostream>.\n\nNote that newer compilers (including VC++ 7.1 and later) don't support\nwxUSE_IOSTREAMH == 1 and so <iostream> will be used anyhow.\n\nDefault is 0.\n\nRecommended setting: 0, only set to 1 if you use a really old compiler")

set(WXSETUP_wxUSE_IMAGLIST_HELP "Use wxImageList. This class is needed by wxNotebook, wxTreeCtrl and\nwxListCtrl.\n\nDefault is 1.\n\nRecommended setting: 1 (set it to 0 if you don't use any of the controls\nenumerated above, then this class is mostly useless too)")

set(WXSETUP_wxUSE_REGEX_HELP "Support for regular expression matching via wxRegEx class: enable this to\nuse POSIX regular expressions in your code. You need to compile regex\nlibrary from src/regex to use it under Windows.\n\nDefault is 0\n\nRecommended setting: 1 if your compiler supports it, if it doesn't please\ncontribute us a makefile for src/regex for it")

set(WXSETUP_wxUSE_CONSOLE_EVENTLOOP_HELP "Set this to 1 to be able to use wxEventLoop even in console applications\n(i.e. using base library only, without GUI). This is mostly useful for\nprocessing socket events but is also necessary to use timers in console\napplications\n\nDefault is 1.\n\nRecommended setting: 1 (but can be safely disabled if you don't use it)")

set(WXSETUP_wxUSE_DYNAMIC_LOADER_HELP "experimental, don't use for now")

set(WXSETUP_wxUSE_PALETTE_HELP "Set to 1 to compile in wxPalette class")

set(WXSETUP_wxUSE_ACCEL_HELP "wxAcceleratorTable/Entry classes and support for them in wxMenu(Bar)")

set(WXSETUP_wxUSE_HYPERLINKCTRL_HELP "wxHyperlinkCtrl")

set(WXSETUP_wxUSE_PROTOCOL_FILE_HELP "The settings for the individual URL schemes")

set(WXSETUP_wxUSE_DATETIME_HELP "Set wxUSE_DATETIME to 1 to compile the wxDateTime and related classes which\nallow to manipulate dates, times and time intervals. wxDateTime replaces the\nold wxTime and wxDate classes which are still provided for backwards\ncompatibility (and implemented in terms of wxDateTime).\n\nNote that this class is relatively new and is still officially in alpha\nstage because some features are not yet (fully) implemented. It is already\nquite useful though and should only be disabled if you are aiming at\nabsolutely minimal version of the library.\n\nRequires: wxUSE_LONGLONG\n\nDefault is 1\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_TGA_HELP "Set to 1 for TGA format support (loading only)")

set(WXSETUP_wxUSE_TIPWINDOW_HELP "wxTipWindow allows to implement the custom tooltips, it is used by the\ncontext help classes. Requires wxUSE_POPUPWIN.\n\nDefault is 1\n\nRecommended setting: 1 (may be set to 0)")

set(WXSETUP_wxUSE_COMBOCTRL_HELP "wxComboCtrl and related classes: combobox with custom popup window and\nnot necessarily a listbox.\n\nDefault is 1.\n\nRecommended setting: 1 but can be safely set to 0 except for wxUniv where it\nit used by wxComboBox")

set(WXSETUP_wxUSE_COLLPANE_HELP "wxCollapsiblePane")

set(WXSETUP_wxUSE_FILE_HELP "Set wxUSE_(F)FILE to 1 to compile wx(F)File classes. wxFile uses low level\nPOSIX functions for file access, wxFFile uses ANSI C stdio.h functions.\n\nDefault is 1\n\nRecommended setting: 1 (wxFile is highly recommended as it is required by\ni18n code, wxFileConfig and others)")

set(WXSETUP_wxUSE_FS_ARCHIVE_HELP "Set to 1 to enable virtual archive filesystem (requires wxUSE_FILESYSTEM)")

set(WXSETUP_wxUSE_NOTIFICATION_MESSAGE_HELP "Use wxNotificationMessage.\n\nwxNotificationMessage allows to show non-intrusive messages to the user\nusing balloons, banners, popups or whatever is the appropriate method for\nthe current platform.\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_SEARCHCTRL_HELP "wxSearchCtrl")

set(WXSETUP_wxUSE_BITMAPCOMBOBOX_HELP "wxBitmapComboBox is a combobox that can have images in front of text items.\n\nDefault is 1.\n\nRecommended setting: 1 but can be safely set to 0")

set(WXSETUP_wxUSE_IFF_HELP "Set to 1 for IFF format support (Amiga format)")

set(WXSETUP_wxUSE_FONTENUM_HELP "wxFontEnumerator class")

set(WXSETUP_wxUSE_EXCEPTIONS_HELP "Compile library in exception-safe mode? If set to 1, the library will try to\nbehave correctly in presence of exceptions (even though it still will not\nuse the exceptions itself) and notify the user code about any unhandled\nexceptions. If set to 0, propagation of the exceptions through the library\ncode will lead to undefined behaviour -- but the code itself will be\nslightly smaller and faster.\n\nNote that like wxUSE_THREADS this option is automatically set to 0 if\nwxNO_EXCEPTIONS is defined.\n\nDefault is 1\n\nRecommended setting: depends on whether you intend to use C++ exceptions\nin your own code (1 if you do, 0 if you don't)")

set(WXSETUP_wxUSE_ENH_METAFILE_HELP "Toggle wxUSE_ENH_METAFILE")

set(WXSETUP_wxUSE_UNICODE_HELP "Toggle wxUSE_UNICODE")

set(WXSETUP_wxUSE_TOGGLEBTN_HELP "requires wxButton")

set(WXSETUP_wxUSE_IMAGE_HELP "Set to 1 for wxImage support (recommended).")

set(WXSETUP_wxUSE_MARKUP_HELP "Support markup in control labels, i.e. provide wxControl::SetLabelMarkup().\nCurrently markup is supported only by a few controls and only some ports but\ntheir number will increase with time.\n\nDefault is 1\n\nRecommended setting: 1 (may be set to 0 if you want to save on code size)")

set(WXSETUP_wxUSE_TOOLTIPS_HELP "Use wxToolTip and wxWindow::Set/GetToolTip() methods.\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_TEXTFILE_HELP "use wxTextFile class: requires wxFile and wxTextBuffer, required by\nwxFileConfig")

set(WXSETUP_wxUSE_PRINTING_ARCHITECTURE_HELP "Set to 0 to disable print/preview architecture code")

set(WXSETUP_wxUSE_ZLIB_HELP "Set to 1 to compile wxZlibInput/OutputStream classes. Also required by\nwxUSE_LIBPNG")

set(WXSETUP_wxUSE_DYNLIB_CLASS_HELP "Compile in classes for run-time DLL loading and function calling.\nRequired by wxUSE_DIALUP_MANAGER.\n\nThis setting is for Win32 only\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_SASH_HELP "Use wxSashWindow class.\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_COLOURDLG_HELP "Use colour picker dialog\n\nDefault is 1\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_STC_HELP "Use wxStyledTextCtrl, a wxWidgets implementation of Scintilla.\n\nDefault is 1\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_PROTOCOL_FTP_HELP "Toggle wxUSE_PROTOCOL_FTP")

set(WXSETUP_wxUSE_STL_HELP "Set wxUSE_STL to 1 to enable maximal interoperability with the standard\nlibrary, even at the cost of backwards compatibility.\n\nDefault is 0\n\nRecommended setting: 0 as the options below already provide a relatively\ngood level of interoperability and changing this option arguably isn't worth\ndiverging from the official builds of the library.")

set(WXSETUP_wxUSE_LOGGUI_HELP "Recommended setting: 1")

set(WXSETUP_wxUSE_ODCOMBOBOX_HELP "wxOwnerDrawnComboBox is a custom combobox allowing to paint the combobox\nitems.\n\nDefault is 1.\n\nRecommended setting: 1 but can be safely set to 0, except where it is\nneeded as a base class for generic wxBitmapComboBox.")

set(WXSETUP_wxUSE_SPLINES_HELP "Toggle wxUSE_SPLINES")

set(WXSETUP_wxUSE_STD_STRING_CONV_IN_WXSTRING_HELP "Make wxString as much interchangeable with std::[w]string as possible, in\nparticular allow implicit conversion of wxString to either of these classes.\nThis comes at a price (or a benefit, depending on your point of view) of not\nallowing implicit conversion to \"const char *\" and \"const wchar_t *\".\n\nBecause a lot of existing code relies on these conversions, this option is\ndisabled by default but can be enabled for your build if you don't care\nabout compatibility.\n\nDefault is 0 if wxUSE_STL has its default value or 1 if it is enabled.\n\nRecommended setting: 0 to remain compatible with the official builds of\nwxWidgets.")

set(WXSETUP_wxUSE_FILE_HISTORY_HELP "wxFileHistory class\n\nDefault is 1\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_COMBOBOX_HELP "wxComboBox")

set(WXSETUP_wxUSE_DIALUP_MANAGER_HELP "If wxUSE_DIALUP_MANAGER is 1, compile in wxDialUpManager class which allows\nto connect/disconnect from the network and be notified whenever the dial-up\nnetwork connection is established/terminated. Requires wxUSE_DYNAMIC_LOADER.\n\nDefault is 1.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_GIF_HELP "Set to 1 for GIF format support")

set(WXSETUP_wxUSE_STOPWATCH_HELP "Use wxStopWatch clas.\n\nDefault is 1\n\nRecommended setting: 1 (needed by wxSocket)")

set(WXSETUP_wxUSE_STDPATHS_HELP "Use wxStandardPaths class which allows to retrieve some standard locations\nin the file system\n\nDefault is 1\n\nRecommended setting: 1 (may be disabled to save space, but not much)")

set(WXSETUP_wxUSE_PRINTF_POS_PARAMS_HELP "Support for positional parameters (e.g. %1$d, %2$s ...) in wxVsnprintf.\nNote that if the system's implementation does not support positional\nparameters, setting this to 1 forces the use of the wxWidgets implementation\nof wxVsnprintf. The standard vsnprintf() supports positional parameters on\nmany Unix systems but usually doesn't under Windows.\n\nPositional parameters are very useful when translating a program since using\nthem in formatting strings allow translators to correctly reorder the\ntranslated sentences.\n\nDefault is 1\n\nRecommended setting: 1 if you want to support multiple languages")

set(WXSETUP_wxUSE_BMPBUTTON_HELP "wxBitmapButton")

set(WXSETUP_wxUSE_LOGWINDOW_HELP "Recommended setting: 1")

set(WXSETUP_wxUSE_TASKBARICON_HELP "wxTaskBarIcon is a small notification icon shown in the system toolbar or\ndock.\n\nDefault is 1.\n\nRecommended setting: 1 (but can be set to 0 if you don't need it)")

set(WXSETUP_wxUSE_ACCESSIBILITY_HELP "Use wxAccessible for enhanced and customisable accessibility.\nDepends on wxUSE_OLE.\n\nDefault is 0.\n\nRecommended setting (at present): 0")

set(WXSETUP_wxUSE_PCX_HELP "Set to 1 for PCX format support")

set(WXSETUP_wxUSE_SPINBTN_HELP "wxSpinButton")

set(WXSETUP_wxUSE_INFOBAR_HELP "Use wxInfoBar class.\n\nDefault is 1.\n\nRecommended setting: 1 (but can be disabled without problems as nothing\ndepends on it)")

set(WXSETUP_wxUSE_DIRPICKERCTRL_HELP "wxDirPickerCtrl")

set(WXSETUP_wxUSE_ZIPSTREAM_HELP "Set to 1 to compile wxZipInput/OutputStream classes.")

set(WXSETUP_wxUSE_FINDREPLDLG_HELP "Use find/replace dialogs.\n\nDefault is 1\n\nRecommended setting: 1 (but may be safely set to 0)")

set(WXSETUP_wxUSE_ON_FATAL_EXCEPTION_HELP "wxHandleFatalExceptions() may be used to catch the program faults at run\ntime and, instead of terminating the program with a usual GPF message box,\ncall the user-defined wxApp::OnFatalException() function. If you set\nwxUSE_ON_FATAL_EXCEPTION to 0, wxHandleFatalExceptions() will not work.\n\nThis setting is for Win32 only and can only be enabled if your compiler\nsupports Win32 structured exception handling (currently only VC++ does)\n\nDefault is 1\n\nRecommended setting: 1 if your compiler supports it.")

set(WXSETUP_wxUSE_AUI_HELP "Use wxWidget's AUI docking system\n\nDefault is 1\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_STATTEXT_HELP "wxStaticText")

set(WXSETUP_wxUSE_DEBUGREPORT_HELP "Set this to 1 to compile in wxDebugReport class which allows you to create\nand optionally upload to your web site a debug report consisting of back\ntrace of the crash (if wxUSE_STACKWALKER == 1) and other information.\n\nDefault is 1 if supported by the compiler.\n\nRecommended setting: 1, it is compiled into a separate library so there\nis no overhead if you don't use it")

set(WXSETUP_wxUSE_DATEPICKCTRL_HELP "wxDatePickerCtrl")

set(WXSETUP_wxUSE_TREECTRL_HELP "wxTreeCtrl")

set(WXSETUP_wxUSE_CONFIG_HELP "Setting wxUSE_CONFIG to 1 enables the use of wxConfig and related classes\nwhich allow the application to store its settings in the persistent\nstorage. Setting this to 1 will also enable on-demand creation of the\nglobal config object in wxApp.\n\nSee also wxUSE_CONFIG_NATIVE below.\n\nRecommended setting: 1")

set(WXSETUP_wxUSE_TOOLBAR_HELP "wxToolBar related settings: if wxUSE_TOOLBAR is 0, don't compile any toolbar\nclasses at all. Otherwise, use the native toolbar class unless\nwxUSE_TOOLBAR_NATIVE is 0.\n\nDefault is 1 for all settings.\n\nRecommended setting: 1 for wxUSE_TOOLBAR and wxUSE_TOOLBAR_NATIVE.")

set(WXSETUP_wxUSE_RADIOBOX_HELP "wxRadioBox")

option(WXSETUP_wxUSE_HTML "${WXSETUP_wxUSE_HTML_HELP}" ON)
option(WXSETUP_wxUSE_STREAMS "${WXSETUP_wxUSE_STREAMS_HELP}" ON)
option(WXSETUP_wxUSE_EXTENDED_RTTI "${WXSETUP_wxUSE_EXTENDED_RTTI_HELP}" OFF)
option(WXSETUP_wxUSE_ARCHIVE_STREAMS "${WXSETUP_wxUSE_ARCHIVE_STREAMS_HELP}" ON)
option(WXSETUP_wxUSE_THREADS "${WXSETUP_wxUSE_THREADS_HELP}" ON)
option(WXSETUP_wxUSE_XPM "${WXSETUP_wxUSE_XPM_HELP}" ON)
option(WXSETUP_wxUSE_IPV6 "${WXSETUP_wxUSE_IPV6_HELP}" OFF)
option(WXSETUP_wxUSE_FILECTRL "${WXSETUP_wxUSE_FILECTRL_HELP}" ON)
option(WXSETUP_wxUSE_FSWATCHER "${WXSETUP_wxUSE_FSWATCHER_HELP}" ON)
option(WXSETUP_wxUSE_FS_INET "${WXSETUP_wxUSE_FS_INET_HELP}" ON)
option(WXSETUP_wxUSE_DRAGIMAGE "${WXSETUP_wxUSE_DRAGIMAGE_HELP}" ON)
option(WXSETUP_wxUSE_LISTCTRL "${WXSETUP_wxUSE_LISTCTRL_HELP}" ON)
option(WXSETUP_wxUSE_FFILE "${WXSETUP_wxUSE_FFILE_HELP}" ON)
option(WXSETUP_wxUSE_CONSTRAINTS "${WXSETUP_wxUSE_CONSTRAINTS_HELP}" ON)
option(WXSETUP_wxUSE_PROTOCOL "${WXSETUP_wxUSE_PROTOCOL_HELP}" ON)
option(WXSETUP_wxUSE_CONFIG_NATIVE "${WXSETUP_wxUSE_CONFIG_NATIVE_HELP}" ON)
option(WXSETUP_wxUSE_CHOICEDLG "${WXSETUP_wxUSE_CHOICEDLG_HELP}" ON)
option(WXSETUP_wxUSE_EDITABLELISTBOX "${WXSETUP_wxUSE_EDITABLELISTBOX_HELP}" ON)
option(WXSETUP_wxUSE_GRID "${WXSETUP_wxUSE_GRID_HELP}" ON)
option(WXSETUP_wxUSE_SYSTEM_OPTIONS "${WXSETUP_wxUSE_SYSTEM_OPTIONS_HELP}" ON)
option(WXSETUP_wxUSE_TEXTCTRL "${WXSETUP_wxUSE_TEXTCTRL_HELP}" ON)
option(WXSETUP_wxUSE_MEDIACTRL "${WXSETUP_wxUSE_MEDIACTRL_HELP}" ON)
option(WXSETUP_wxUSE_BUTTON "${WXSETUP_wxUSE_BUTTON_HELP}" ON)
option(WXSETUP_wxUSE_APPLE_IEEE "${WXSETUP_wxUSE_APPLE_IEEE_HELP}" ON)
option(WXSETUP_wxUSE_INTL "${WXSETUP_wxUSE_INTL_HELP}" ON)
option(WXSETUP_wxUSE_PROTOCOL_HTTP "${WXSETUP_wxUSE_PROTOCOL_HTTP_HELP}" ON)
option(WXSETUP_wxUSE_DISPLAY "${WXSETUP_wxUSE_DISPLAY_HELP}" ON)
option(WXSETUP_wxUSE_COMPILER_TLS "${WXSETUP_wxUSE_COMPILER_TLS_HELP}" ON)
option(WXSETUP_wxUSE_THEME_WIN32 "${WXSETUP_wxUSE_THEME_WIN32_HELP}" OFF)
option(WXSETUP_wxUSE_COMMON_DIALOGS "${WXSETUP_wxUSE_COMMON_DIALOGS_HELP}" ON)
option(WXSETUP_wxUSE_METAFILE "${WXSETUP_wxUSE_METAFILE_HELP}" ON)
option(WXSETUP_wxUSE_FILEPICKERCTRL "${WXSETUP_wxUSE_FILEPICKERCTRL_HELP}" ON)
option(WXSETUP_wxUSE_CHECKBOX "${WXSETUP_wxUSE_CHECKBOX_HELP}" ON)
option(WXSETUP_wxUSE_CMDLINE_PARSER "${WXSETUP_wxUSE_CMDLINE_PARSER_HELP}" ON)
option(WXSETUP_wxUSE_HELP "${WXSETUP_wxUSE_HELP_HELP}" ON)
option(WXSETUP_wxUSE_GEOMETRY "${WXSETUP_wxUSE_GEOMETRY_HELP}" ON)
option(WXSETUP_wxDIALOG_UNIT_COMPATIBILITY "${WXSETUP_wxDIALOG_UNIT_COMPATIBILITY_HELP}" OFF)
option(WXSETUP_wxUSE_BANNERWINDOW "${WXSETUP_wxUSE_BANNERWINDOW_HELP}" ON)
option(WXSETUP_wxUSE_CAIRO "${WXSETUP_wxUSE_CAIRO_HELP}" OFF)
option(WXSETUP_wxUSE_MOUSEWHEEL "${WXSETUP_wxUSE_MOUSEWHEEL_HELP}" ON)
option(WXSETUP_wxUSE_ARTPROVIDER_STD "${WXSETUP_wxUSE_ARTPROVIDER_STD_HELP}" ON)
option(WXSETUP_wxUSE_RICHTOOLTIP "${WXSETUP_wxUSE_RICHTOOLTIP_HELP}" ON)
option(WXSETUP_wxUSE_TOOLBOOK "${WXSETUP_wxUSE_TOOLBOOK_HELP}" ON)
option(WXSETUP_wxUSE_TREEBOOK "${WXSETUP_wxUSE_TREEBOOK_HELP}" ON)
option(WXSETUP_wxUSE_SPINCTRL "${WXSETUP_wxUSE_SPINCTRL_HELP}" ON)
option(WXSETUP_wxUSE_HEADERCTRL "${WXSETUP_wxUSE_HEADERCTRL_HELP}" ON)
option(WXSETUP_wxUSE_MINIFRAME "${WXSETUP_wxUSE_MINIFRAME_HELP}" ON)
option(WXSETUP_wxUSE_STATUSBAR "${WXSETUP_wxUSE_STATUSBAR_HELP}" ON)
option(WXSETUP_wxUSE_REARRANGECTRL "${WXSETUP_wxUSE_REARRANGECTRL_HELP}" ON)
option(WXSETUP_wxUSE_SCROLLBAR "${WXSETUP_wxUSE_SCROLLBAR_HELP}" ON)
option(WXSETUP_wxUSE_THEME_GTK "${WXSETUP_wxUSE_THEME_GTK_HELP}" OFF)
option(WXSETUP_wxUSE_WEBVIEW "${WXSETUP_wxUSE_WEBVIEW_HELP}" ON)
option(WXSETUP_wxUSE_THEME_MONO "${WXSETUP_wxUSE_THEME_MONO_HELP}" OFF)
option(WXSETUP_wxUSE_STARTUP_TIPS "${WXSETUP_wxUSE_STARTUP_TIPS_HELP}" ON)
option(WXSETUP_wxUSE_SOCKETS "${WXSETUP_wxUSE_SOCKETS_HELP}" ON)
option(WXSETUP_wxUSE_CARET "${WXSETUP_wxUSE_CARET_HELP}" ON)
option(WXSETUP_wxUSE_CHECKLISTBOX "${WXSETUP_wxUSE_CHECKLISTBOX_HELP}" ON)
option(WXSETUP_wxUSE_ARTPROVIDER_TANGO "${WXSETUP_wxUSE_ARTPROVIDER_TANGO_HELP}" ON)
option(WXSETUP_wxUSE_XRC "${WXSETUP_wxUSE_XRC_HELP}" ON)
option(WXSETUP_wxUSE_NOTEBOOK "${WXSETUP_wxUSE_NOTEBOOK_HELP}" ON)
option(WXSETUP_wxUSE_LISTBOOK "${WXSETUP_wxUSE_LISTBOOK_HELP}" ON)
option(WXSETUP_wxUSE_MDI "${WXSETUP_wxUSE_MDI_HELP}" ON)
option(WXSETUP_wxUSE_DATAVIEWCTRL "${WXSETUP_wxUSE_DATAVIEWCTRL_HELP}" ON)
option(WXSETUP_wxUSE_LIBPNG "${WXSETUP_wxUSE_LIBPNG_HELP}" ON)
option(WXSETUP_wxUSE_FS_ZIP "${WXSETUP_wxUSE_FS_ZIP_HELP}" ON)
option(WXSETUP_wxUSE_LISTBOX "${WXSETUP_wxUSE_LISTBOX_HELP}" ON)
option(WXSETUP_wxUSE_TIMEPICKCTRL "${WXSETUP_wxUSE_TIMEPICKCTRL_HELP}" ON)
option(WXSETUP_wxUSE_DIRDLG "${WXSETUP_wxUSE_DIRDLG_HELP}" ON)
option(WXSETUP_wxUSE_DOC_VIEW_ARCHITECTURE "${WXSETUP_wxUSE_DOC_VIEW_ARCHITECTURE_HELP}" ON)
option(WXSETUP_wxUSE_WCHAR_T "${WXSETUP_wxUSE_WCHAR_T_HELP}" ON)
option(WXSETUP_wxUSE_LONGLONG "${WXSETUP_wxUSE_LONGLONG_HELP}" ON)
option(WXSETUP_wxUSE_ANY "${WXSETUP_wxUSE_ANY_HELP}" ON)
option(WXSETUP_wxUSE_STATBMP "${WXSETUP_wxUSE_STATBMP_HELP}" ON)
option(WXSETUP_wxUSE_MEMORY_TRACING "${WXSETUP_wxUSE_MEMORY_TRACING_HELP}" OFF)
option(WXSETUP_wxUSE_XLOCALE "${WXSETUP_wxUSE_XLOCALE_HELP}" ON)
option(WXSETUP_wxUSE_JOYSTICK "${WXSETUP_wxUSE_JOYSTICK_HELP}" ON)
option(WXSETUP_wxUSE_POSTSCRIPT "${WXSETUP_wxUSE_POSTSCRIPT_HELP}" OFF)
option(WXSETUP_wxUSE_MSGDLG "${WXSETUP_wxUSE_MSGDLG_HELP}" ON)
option(WXSETUP_wxUSE_SPLASH "${WXSETUP_wxUSE_SPLASH_HELP}" ON)
option(WXSETUP_wxUSE_LIBJPEG "${WXSETUP_wxUSE_LIBJPEG_HELP}" ON)
option(WXSETUP_wxUSE_WXHTML_HELP "${WXSETUP_wxUSE_WXHTML_HELP_HELP}" ON)
option(WXSETUP_WXWIN_COMPATIBILITY_3_0 "${WXSETUP_WXWIN_COMPATIBILITY_3_0_HELP}" ON)
option(WXSETUP_wxUSE_FSVOLUME "${WXSETUP_wxUSE_FSVOLUME_HELP}" ON)
option(WXSETUP_wxUSE_SVG "${WXSETUP_wxUSE_SVG_HELP}" ON)
option(WXSETUP_wxUSE_STD_CONTAINERS "${WXSETUP_wxUSE_STD_CONTAINERS_HELP}" OFF)
option(WXSETUP_wxUSE_DEBUG_CONTEXT "${WXSETUP_wxUSE_DEBUG_CONTEXT_HELP}" OFF)
option(WXSETUP_wxUSE_NUMBERDLG "${WXSETUP_wxUSE_NUMBERDLG_HELP}" ON)
option(WXSETUP_wxUSE_THEME_METAL "${WXSETUP_wxUSE_THEME_METAL_HELP}" OFF)
option(WXSETUP_wxUSE_PROGRESSDLG "${WXSETUP_wxUSE_PROGRESSDLG_HELP}" ON)
option(WXSETUP_wxUSE_STD_IOSTREAM "${WXSETUP_wxUSE_STD_IOSTREAM_HELP}" wxUSE_STD_DEFAULT)
option(WXSETUP_wxUSE_BUSYINFO "${WXSETUP_wxUSE_BUSYINFO_HELP}" ON)
option(WXSETUP_wxUSE_RICHMSGDLG "${WXSETUP_wxUSE_RICHMSGDLG_HELP}" ON)
option(WXSETUP_wxUSE_HOTKEY "${WXSETUP_wxUSE_HOTKEY_HELP}" ON)
option(WXSETUP_wxUSE_CONTROLS "${WXSETUP_wxUSE_CONTROLS_HELP}" ON)
option(WXSETUP_wxUSE_ANIMATIONCTRL "${WXSETUP_wxUSE_ANIMATIONCTRL_HELP}" ON)
option(WXSETUP_wxUSE_FILEDLG "${WXSETUP_wxUSE_FILEDLG_HELP}" ON)
option(WXSETUP_wxUSE_SPLITTER "${WXSETUP_wxUSE_SPLITTER_HELP}" ON)
option(WXSETUP_wxUSE_MENUS "${WXSETUP_wxUSE_MENUS_HELP}" ON)
option(WXSETUP_wxUSE_DEBUG_NEW_ALWAYS "${WXSETUP_wxUSE_DEBUG_NEW_ALWAYS_HELP}" OFF)
option(WXSETUP_wxUSE_MDI_ARCHITECTURE "${WXSETUP_wxUSE_MDI_ARCHITECTURE_HELP}" ON)
option(WXSETUP_wxUSE_SLIDER "${WXSETUP_wxUSE_SLIDER_HELP}" ON)
option(WXSETUP_wxUSE_STATLINE "${WXSETUP_wxUSE_STATLINE_HELP}" ON)
option(WXSETUP_wxUSE_NATIVE_STATUSBAR "${WXSETUP_wxUSE_NATIVE_STATUSBAR_HELP}" ON)
option(WXSETUP_wxUSE_MS_HTML_HELP "${WXSETUP_wxUSE_MS_HTML_HELP_HELP}" ON)
option(WXSETUP_wxUSE_BASE64 "${WXSETUP_wxUSE_BASE64_HELP}" ON)
option(WXSETUP_wxUSE_FONTMAP "${WXSETUP_wxUSE_FONTMAP_HELP}" ON)
option(WXSETUP_wxUSE_CALENDARCTRL "${WXSETUP_wxUSE_CALENDARCTRL_HELP}" ON)
option(WXSETUP_wxUSE_VALIDATORS "${WXSETUP_wxUSE_VALIDATORS_HELP}" ON)
option(WXSETUP_wxUSE_URL "${WXSETUP_wxUSE_URL_HELP}" ON)
option(WXSETUP_wxUSE_CHOICEBOOK "${WXSETUP_wxUSE_CHOICEBOOK_HELP}" ON)
option(WXSETUP_wxUSE_TOOLBAR_NATIVE "${WXSETUP_wxUSE_TOOLBAR_NATIVE_HELP}" ON)
option(WXSETUP_wxUSE_CHOICE "${WXSETUP_wxUSE_CHOICE_HELP}" ON)
option(WXSETUP_wxUSE_AFM_FOR_POSTSCRIPT "${WXSETUP_wxUSE_AFM_FOR_POSTSCRIPT_HELP}" ON)
option(WXSETUP_wxUSE_GLOBAL_MEMORY_OPERATORS "${WXSETUP_wxUSE_GLOBAL_MEMORY_OPERATORS_HELP}" OFF)
option(WXSETUP_wxUSE_IPC "${WXSETUP_wxUSE_IPC_HELP}" ON)
option(WXSETUP_wxUSE_PNM "${WXSETUP_wxUSE_PNM_HELP}" ON)
option(WXSETUP_wxUSE_WIN_METAFILES_ALWAYS "${WXSETUP_wxUSE_WIN_METAFILES_ALWAYS_HELP}" OFF)
option(WXSETUP_wxUSE_UIACTIONSIMULATOR "${WXSETUP_wxUSE_UIACTIONSIMULATOR_HELP}" ON)
option(WXSETUP_wxUSE_FONTDLG "${WXSETUP_wxUSE_FONTDLG_HELP}" ON)
option(WXSETUP_wxUSE_WIZARDDLG "${WXSETUP_wxUSE_WIZARDDLG_HELP}" ON)
option(WXSETUP_wxUSE_MIMETYPE "${WXSETUP_wxUSE_MIMETYPE_HELP}" ON)
option(WXSETUP_wxUSE_TREELISTCTRL "${WXSETUP_wxUSE_TREELISTCTRL_HELP}" ON)
option(WXSETUP_wxUSE_CLIPBOARD "${WXSETUP_wxUSE_CLIPBOARD_HELP}" ON)
option(WXSETUP_wxUSE_LIBTIFF "${WXSETUP_wxUSE_LIBTIFF_HELP}" ON)
option(WXSETUP_wxUSE_POPUPWIN "${WXSETUP_wxUSE_POPUPWIN_HELP}" ON)
option(WXSETUP_wxUSE_TARSTREAM "${WXSETUP_wxUSE_TARSTREAM_HELP}" ON)
option(WXSETUP_wxUSE_TEXTBUFFER "${WXSETUP_wxUSE_TEXTBUFFER_HELP}" ON)
option(WXSETUP_wxUSE_COMMANDLINKBUTTON "${WXSETUP_wxUSE_COMMANDLINKBUTTON_HELP}" ON)
option(WXSETUP_wxUSE_LOG_DIALOG "${WXSETUP_wxUSE_LOG_DIALOG_HELP}" ON)
option(WXSETUP_wxUSE_GAUGE "${WXSETUP_wxUSE_GAUGE_HELP}" ON)
option(WXSETUP_wxUSE_TEXTDLG "${WXSETUP_wxUSE_TEXTDLG_HELP}" ON)
option(WXSETUP_wxUSE_FONTPICKERCTRL "${WXSETUP_wxUSE_FONTPICKERCTRL_HELP}" ON)
option(WXSETUP_wxUSE_TIMER "${WXSETUP_wxUSE_TIMER_HELP}" ON)
option(WXSETUP_wxUSE_SNGLINST_CHECKER "${WXSETUP_wxUSE_SNGLINST_CHECKER_HELP}" ON)
option(WXSETUP_wxUSE_LOG "${WXSETUP_wxUSE_LOG_HELP}" ON)
option(WXSETUP_wxUSE_ABOUTDLG "${WXSETUP_wxUSE_ABOUTDLG_HELP}" ON)
option(WXSETUP_wxUSE_DC_TRANSFORM_MATRIX "${WXSETUP_wxUSE_DC_TRANSFORM_MATRIX_HELP}" ON)
option(WXSETUP_wxUSE_DATAOBJ "${WXSETUP_wxUSE_DATAOBJ_HELP}" ON)
option(WXSETUP_wxUSE_STATBOX "${WXSETUP_wxUSE_STATBOX_HELP}" ON)
option(WXSETUP_wxUSE_DRAG_AND_DROP "${WXSETUP_wxUSE_DRAG_AND_DROP_HELP}" ON)
option(WXSETUP_wxUSE_XML "${WXSETUP_wxUSE_XML_HELP}" wxUSE_XRC)
option(WXSETUP_wxUSE_SOUND "${WXSETUP_wxUSE_SOUND_HELP}" ON)
option(WXSETUP_wxUSE_RICHTEXT "${WXSETUP_wxUSE_RICHTEXT_HELP}" ON)
option(WXSETUP_wxUSE_VARIANT "${WXSETUP_wxUSE_VARIANT_HELP}" ON)
option(WXSETUP_WXWIN_COMPATIBILITY_2_8 "${WXSETUP_WXWIN_COMPATIBILITY_2_8_HELP}" OFF)
option(WXSETUP_wxUSE_PREFERENCES_EDITOR "${WXSETUP_wxUSE_PREFERENCES_EDITOR_HELP}" ON)
option(WXSETUP_wxUSE_PROPGRID "${WXSETUP_wxUSE_PROPGRID_HELP}" ON)
option(WXSETUP_wxUSE_URL_NATIVE "${WXSETUP_wxUSE_URL_NATIVE_HELP}" OFF)
option(WXSETUP_wxUSE_FILESYSTEM "${WXSETUP_wxUSE_FILESYSTEM_HELP}" ON)
option(WXSETUP_wxUSE_STD_STRING "${WXSETUP_wxUSE_STD_STRING_HELP}" wxUSE_STD_DEFAULT)
option(WXSETUP_wxUSE_GLCANVAS "${WXSETUP_wxUSE_GLCANVAS_HELP}" ON)
option(WXSETUP_wxUSE_ICO_CUR "${WXSETUP_wxUSE_ICO_CUR_HELP}" ON)
option(WXSETUP_wxUSE_GUI "${WXSETUP_wxUSE_GUI_HELP}" ON)
option(WXSETUP_wxUSE_RIBBON "${WXSETUP_wxUSE_RIBBON_HELP}" ON)
option(WXSETUP_wxUSE_COLOURPICKERCTRL "${WXSETUP_wxUSE_COLOURPICKERCTRL_HELP}" ON)
option(WXSETUP_wxUSE_RADIOBTN "${WXSETUP_wxUSE_RADIOBTN_HELP}" ON)
option(WXSETUP_wxUSE_ALL_THEMES "${WXSETUP_wxUSE_ALL_THEMES_HELP}" ON)
option(WXSETUP_wxUSE_IOSTREAMH "${WXSETUP_wxUSE_IOSTREAMH_HELP}" OFF)
option(WXSETUP_wxUSE_IMAGLIST "${WXSETUP_wxUSE_IMAGLIST_HELP}" ON)
option(WXSETUP_wxUSE_REGEX "${WXSETUP_wxUSE_REGEX_HELP}" ON)
option(WXSETUP_wxUSE_CONSOLE_EVENTLOOP "${WXSETUP_wxUSE_CONSOLE_EVENTLOOP_HELP}" ON)
option(WXSETUP_wxUSE_DYNAMIC_LOADER "${WXSETUP_wxUSE_DYNAMIC_LOADER_HELP}" ON)
option(WXSETUP_wxUSE_PALETTE "${WXSETUP_wxUSE_PALETTE_HELP}" ON)
option(WXSETUP_wxUSE_ACCEL "${WXSETUP_wxUSE_ACCEL_HELP}" ON)
option(WXSETUP_wxUSE_HYPERLINKCTRL "${WXSETUP_wxUSE_HYPERLINKCTRL_HELP}" ON)
option(WXSETUP_wxUSE_PROTOCOL_FILE "${WXSETUP_wxUSE_PROTOCOL_FILE_HELP}" ON)
option(WXSETUP_wxUSE_DATETIME "${WXSETUP_wxUSE_DATETIME_HELP}" ON)
option(WXSETUP_wxUSE_TGA "${WXSETUP_wxUSE_TGA_HELP}" ON)
option(WXSETUP_wxUSE_TIPWINDOW "${WXSETUP_wxUSE_TIPWINDOW_HELP}" ON)
option(WXSETUP_wxUSE_COMBOCTRL "${WXSETUP_wxUSE_COMBOCTRL_HELP}" ON)
option(WXSETUP_wxUSE_COLLPANE "${WXSETUP_wxUSE_COLLPANE_HELP}" ON)
option(WXSETUP_wxUSE_FILE "${WXSETUP_wxUSE_FILE_HELP}" ON)
option(WXSETUP_wxUSE_FS_ARCHIVE "${WXSETUP_wxUSE_FS_ARCHIVE_HELP}" ON)
option(WXSETUP_wxUSE_NOTIFICATION_MESSAGE "${WXSETUP_wxUSE_NOTIFICATION_MESSAGE_HELP}" ON)
option(WXSETUP_wxUSE_SEARCHCTRL "${WXSETUP_wxUSE_SEARCHCTRL_HELP}" ON)
option(WXSETUP_wxUSE_BITMAPCOMBOBOX "${WXSETUP_wxUSE_BITMAPCOMBOBOX_HELP}" ON)
option(WXSETUP_wxUSE_IFF "${WXSETUP_wxUSE_IFF_HELP}" OFF)
option(WXSETUP_wxUSE_FONTENUM "${WXSETUP_wxUSE_FONTENUM_HELP}" ON)
option(WXSETUP_wxUSE_EXCEPTIONS "${WXSETUP_wxUSE_EXCEPTIONS_HELP}" ON)
option(WXSETUP_wxUSE_ENH_METAFILE "${WXSETUP_wxUSE_ENH_METAFILE_HELP}" ON)
option(WXSETUP_wxUSE_UNICODE "${WXSETUP_wxUSE_UNICODE_HELP}" ON)
option(WXSETUP_wxUSE_TOGGLEBTN "${WXSETUP_wxUSE_TOGGLEBTN_HELP}" ON)
option(WXSETUP_wxUSE_IMAGE "${WXSETUP_wxUSE_IMAGE_HELP}" ON)
option(WXSETUP_wxUSE_MARKUP "${WXSETUP_wxUSE_MARKUP_HELP}" ON)
option(WXSETUP_wxUSE_TOOLTIPS "${WXSETUP_wxUSE_TOOLTIPS_HELP}" ON)
option(WXSETUP_wxUSE_TEXTFILE "${WXSETUP_wxUSE_TEXTFILE_HELP}" ON)
option(WXSETUP_wxUSE_PRINTING_ARCHITECTURE "${WXSETUP_wxUSE_PRINTING_ARCHITECTURE_HELP}" ON)
option(WXSETUP_wxUSE_ZLIB "${WXSETUP_wxUSE_ZLIB_HELP}" ON)
option(WXSETUP_wxUSE_DYNLIB_CLASS "${WXSETUP_wxUSE_DYNLIB_CLASS_HELP}" ON)
option(WXSETUP_wxUSE_SASH "${WXSETUP_wxUSE_SASH_HELP}" ON)
option(WXSETUP_wxUSE_COLOURDLG "${WXSETUP_wxUSE_COLOURDLG_HELP}" ON)
option(WXSETUP_wxUSE_STC "${WXSETUP_wxUSE_STC_HELP}" ON)
option(WXSETUP_wxUSE_PROTOCOL_FTP "${WXSETUP_wxUSE_PROTOCOL_FTP_HELP}" ON)
option(WXSETUP_wxUSE_STL "${WXSETUP_wxUSE_STL_HELP}" OFF)
option(WXSETUP_wxUSE_LOGGUI "${WXSETUP_wxUSE_LOGGUI_HELP}" ON)
option(WXSETUP_wxUSE_ODCOMBOBOX "${WXSETUP_wxUSE_ODCOMBOBOX_HELP}" ON)
option(WXSETUP_wxUSE_SPLINES "${WXSETUP_wxUSE_SPLINES_HELP}" ON)
option(WXSETUP_wxUSE_STD_STRING_CONV_IN_WXSTRING "${WXSETUP_wxUSE_STD_STRING_CONV_IN_WXSTRING_HELP}" wxUSE_STL)
option(WXSETUP_wxUSE_FILE_HISTORY "${WXSETUP_wxUSE_FILE_HISTORY_HELP}" ON)
option(WXSETUP_wxUSE_COMBOBOX "${WXSETUP_wxUSE_COMBOBOX_HELP}" ON)
option(WXSETUP_wxUSE_DIALUP_MANAGER "${WXSETUP_wxUSE_DIALUP_MANAGER_HELP}" ON)
option(WXSETUP_wxUSE_GIF "${WXSETUP_wxUSE_GIF_HELP}" ON)
option(WXSETUP_wxUSE_STOPWATCH "${WXSETUP_wxUSE_STOPWATCH_HELP}" ON)
option(WXSETUP_wxUSE_STDPATHS "${WXSETUP_wxUSE_STDPATHS_HELP}" ON)
option(WXSETUP_wxUSE_PRINTF_POS_PARAMS "${WXSETUP_wxUSE_PRINTF_POS_PARAMS_HELP}" ON)
option(WXSETUP_wxUSE_BMPBUTTON "${WXSETUP_wxUSE_BMPBUTTON_HELP}" ON)
option(WXSETUP_wxUSE_LOGWINDOW "${WXSETUP_wxUSE_LOGWINDOW_HELP}" ON)
option(WXSETUP_wxUSE_TASKBARICON "${WXSETUP_wxUSE_TASKBARICON_HELP}" ON)
option(WXSETUP_wxUSE_ACCESSIBILITY "${WXSETUP_wxUSE_ACCESSIBILITY_HELP}" OFF)
option(WXSETUP_wxUSE_PCX "${WXSETUP_wxUSE_PCX_HELP}" ON)
option(WXSETUP_wxUSE_SPINBTN "${WXSETUP_wxUSE_SPINBTN_HELP}" ON)
option(WXSETUP_wxUSE_INFOBAR "${WXSETUP_wxUSE_INFOBAR_HELP}" ON)
option(WXSETUP_wxUSE_DIRPICKERCTRL "${WXSETUP_wxUSE_DIRPICKERCTRL_HELP}" ON)
option(WXSETUP_wxUSE_ZIPSTREAM "${WXSETUP_wxUSE_ZIPSTREAM_HELP}" ON)
option(WXSETUP_wxUSE_FINDREPLDLG "${WXSETUP_wxUSE_FINDREPLDLG_HELP}" ON)
option(WXSETUP_wxUSE_ON_FATAL_EXCEPTION "${WXSETUP_wxUSE_ON_FATAL_EXCEPTION_HELP}" ON)
option(WXSETUP_wxUSE_AUI "${WXSETUP_wxUSE_AUI_HELP}" ON)
option(WXSETUP_wxUSE_STATTEXT "${WXSETUP_wxUSE_STATTEXT_HELP}" ON)
option(WXSETUP_wxUSE_DEBUGREPORT "${WXSETUP_wxUSE_DEBUGREPORT_HELP}" ON)
option(WXSETUP_wxUSE_DATEPICKCTRL "${WXSETUP_wxUSE_DATEPICKCTRL_HELP}" ON)
option(WXSETUP_wxUSE_TREECTRL "${WXSETUP_wxUSE_TREECTRL_HELP}" ON)
option(WXSETUP_wxUSE_CONFIG "${WXSETUP_wxUSE_CONFIG_HELP}" ON)
option(WXSETUP_wxUSE_TOOLBAR "${WXSETUP_wxUSE_TOOLBAR_HELP}" ON)
option(WXSETUP_wxUSE_RADIOBOX "${WXSETUP_wxUSE_RADIOBOX_HELP}" ON)


set(WXBUILD_ALL_OPTIONS
	wxUSE_HTML
	wxUSE_STREAMS
	wxUSE_EXTENDED_RTTI
	wxUSE_ARCHIVE_STREAMS
	wxUSE_THREADS
	wxUSE_XPM
	wxUSE_IPV6
	wxUSE_FILECTRL
	wxUSE_FSWATCHER
	wxUSE_FS_INET
	wxUSE_DRAGIMAGE
	wxUSE_LISTCTRL
	wxUSE_FFILE
	wxUSE_CONSTRAINTS
	wxUSE_PROTOCOL
	wxUSE_CONFIG_NATIVE
	wxUSE_CHOICEDLG
	wxUSE_EDITABLELISTBOX
	wxUSE_GRID
	wxUSE_SYSTEM_OPTIONS
	wxUSE_TEXTCTRL
	wxUSE_MEDIACTRL
	wxUSE_BUTTON
	wxUSE_APPLE_IEEE
	wxUSE_INTL
	wxUSE_PROTOCOL_HTTP
	wxUSE_DISPLAY
	wxUSE_COMPILER_TLS
	wxUSE_THEME_WIN32
	wxUSE_COMMON_DIALOGS
	wxUSE_METAFILE
	wxUSE_FILEPICKERCTRL
	wxUSE_CHECKBOX
	wxUSE_CMDLINE_PARSER
	wxUSE_HELP
	wxUSE_GEOMETRY
	wxDIALOG_UNIT_COMPATIBILITY
	wxUSE_BANNERWINDOW
	wxUSE_CAIRO
	wxUSE_MOUSEWHEEL
	wxUSE_ARTPROVIDER_STD
	wxUSE_RICHTOOLTIP
	wxUSE_TOOLBOOK
	wxUSE_TREEBOOK
	wxUSE_SPINCTRL
	wxUSE_HEADERCTRL
	wxUSE_MINIFRAME
	wxUSE_STATUSBAR
	wxUSE_REARRANGECTRL
	wxUSE_SCROLLBAR
	wxUSE_THEME_GTK
	wxUSE_WEBVIEW
	wxUSE_THEME_MONO
	wxUSE_STARTUP_TIPS
	wxUSE_SOCKETS
	wxUSE_CARET
	wxUSE_CHECKLISTBOX
	wxUSE_ARTPROVIDER_TANGO
	wxUSE_XRC
	wxUSE_NOTEBOOK
	wxUSE_LISTBOOK
	wxUSE_MDI
	wxUSE_DATAVIEWCTRL
	wxUSE_LIBPNG
	wxUSE_FS_ZIP
	wxUSE_LISTBOX
	wxUSE_TIMEPICKCTRL
	wxUSE_DIRDLG
	wxUSE_DOC_VIEW_ARCHITECTURE
	wxUSE_WCHAR_T
	wxUSE_LONGLONG
	wxUSE_ANY
	wxUSE_STATBMP
	wxUSE_MEMORY_TRACING
	wxUSE_XLOCALE
	wxUSE_JOYSTICK
	wxUSE_POSTSCRIPT
	wxUSE_MSGDLG
	wxUSE_SPLASH
	wxUSE_LIBJPEG
	wxUSE_WXHTML_HELP
	WXWIN_COMPATIBILITY_3_0
	wxUSE_FSVOLUME
	wxUSE_SVG
	wxUSE_STD_CONTAINERS
	wxUSE_DEBUG_CONTEXT
	wxUSE_NUMBERDLG
	wxUSE_THEME_METAL
	wxUSE_PROGRESSDLG
	wxUSE_STD_IOSTREAM
	wxUSE_BUSYINFO
	wxUSE_RICHMSGDLG
	wxUSE_HOTKEY
	wxUSE_CONTROLS
	wxUSE_ANIMATIONCTRL
	wxUSE_FILEDLG
	wxUSE_SPLITTER
	wxUSE_MENUS
	wxUSE_DEBUG_NEW_ALWAYS
	wxUSE_MDI_ARCHITECTURE
	wxUSE_SLIDER
	wxUSE_STATLINE
	wxUSE_NATIVE_STATUSBAR
	wxUSE_MS_HTML_HELP
	wxUSE_BASE64
	wxUSE_FONTMAP
	wxUSE_CALENDARCTRL
	wxUSE_VALIDATORS
	wxUSE_URL
	wxUSE_CHOICEBOOK
	wxUSE_TOOLBAR_NATIVE
	wxUSE_CHOICE
	wxUSE_AFM_FOR_POSTSCRIPT
	wxUSE_GLOBAL_MEMORY_OPERATORS
	wxUSE_IPC
	wxUSE_PNM
	wxUSE_WIN_METAFILES_ALWAYS
	wxUSE_UIACTIONSIMULATOR
	wxUSE_FONTDLG
	wxUSE_WIZARDDLG
	wxUSE_MIMETYPE
	wxUSE_TREELISTCTRL
	wxUSE_CLIPBOARD
	wxUSE_LIBTIFF
	wxUSE_POPUPWIN
	wxUSE_TARSTREAM
	wxUSE_TEXTBUFFER
	wxUSE_COMMANDLINKBUTTON
	wxUSE_LOG_DIALOG
	wxUSE_GAUGE
	wxUSE_TEXTDLG
	wxUSE_FONTPICKERCTRL
	wxUSE_TIMER
	wxUSE_SNGLINST_CHECKER
	wxUSE_LOG
	wxUSE_ABOUTDLG
	wxUSE_DC_TRANSFORM_MATRIX
	wxUSE_DATAOBJ
	wxUSE_STATBOX
	wxUSE_DRAG_AND_DROP
	wxUSE_XML
	wxUSE_SOUND
	wxUSE_RICHTEXT
	wxUSE_VARIANT
	WXWIN_COMPATIBILITY_2_8
	wxUSE_PREFERENCES_EDITOR
	wxUSE_PROPGRID
	wxUSE_URL_NATIVE
	wxUSE_FILESYSTEM
	wxUSE_STD_STRING
	wxUSE_GLCANVAS
	wxUSE_ICO_CUR
	wxUSE_GUI
	wxUSE_RIBBON
	wxUSE_COLOURPICKERCTRL
	wxUSE_RADIOBTN
	wxUSE_ALL_THEMES
	wxUSE_IOSTREAMH
	wxUSE_IMAGLIST
	wxUSE_REGEX
	wxUSE_CONSOLE_EVENTLOOP
	wxUSE_DYNAMIC_LOADER
	wxUSE_PALETTE
	wxUSE_ACCEL
	wxUSE_HYPERLINKCTRL
	wxUSE_PROTOCOL_FILE
	wxUSE_DATETIME
	wxUSE_TGA
	wxUSE_TIPWINDOW
	wxUSE_COMBOCTRL
	wxUSE_COLLPANE
	wxUSE_FILE
	wxUSE_FS_ARCHIVE
	wxUSE_NOTIFICATION_MESSAGE
	wxUSE_SEARCHCTRL
	wxUSE_BITMAPCOMBOBOX
	wxUSE_IFF
	wxUSE_FONTENUM
	wxUSE_EXCEPTIONS
	wxUSE_ENH_METAFILE
	wxUSE_UNICODE
	wxUSE_TOGGLEBTN
	wxUSE_IMAGE
	wxUSE_MARKUP
	wxUSE_TOOLTIPS
	wxUSE_TEXTFILE
	wxUSE_PRINTING_ARCHITECTURE
	wxUSE_ZLIB
	wxUSE_DYNLIB_CLASS
	wxUSE_SASH
	wxUSE_COLOURDLG
	wxUSE_STC
	wxUSE_PROTOCOL_FTP
	wxUSE_STL
	wxUSE_LOGGUI
	wxUSE_ODCOMBOBOX
	wxUSE_SPLINES
	wxUSE_STD_STRING_CONV_IN_WXSTRING
	wxUSE_FILE_HISTORY
	wxUSE_COMBOBOX
	wxUSE_DIALUP_MANAGER
	wxUSE_GIF
	wxUSE_STOPWATCH
	wxUSE_STDPATHS
	wxUSE_PRINTF_POS_PARAMS
	wxUSE_BMPBUTTON
	wxUSE_LOGWINDOW
	wxUSE_TASKBARICON
	wxUSE_ACCESSIBILITY
	wxUSE_PCX
	wxUSE_SPINBTN
	wxUSE_INFOBAR
	wxUSE_DIRPICKERCTRL
	wxUSE_ZIPSTREAM
	wxUSE_FINDREPLDLG
	wxUSE_ON_FATAL_EXCEPTION
	wxUSE_AUI
	wxUSE_STATTEXT
	wxUSE_DEBUGREPORT
	wxUSE_DATEPICKCTRL
	wxUSE_TREECTRL
	wxUSE_CONFIG
	wxUSE_TOOLBAR
	wxUSE_RADIOBOX
)
