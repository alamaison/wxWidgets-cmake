/////////////////////////////////////////////////////////////////////////////
// Name:        wx/motif/setup.h
// Purpose:     Configuration for the library
// Author:      Julian Smart
// Modified by:
// Created:     01/02/97
// Copyright:   (c) Julian Smart
// Licence:     wxWindows licence
/////////////////////////////////////////////////////////////////////////////

#ifndef _WX_SETUP_H_
#define _WX_SETUP_H_

/* --- start common options --- */
// ----------------------------------------------------------------------------
// global settings
// ----------------------------------------------------------------------------

// define this to 0 when building wxBase library - this can also be done from
// makefile/project file overriding the value here
#ifndef wxUSE_GUI
#define wxUSE_GUI            1 /* (gen_setups.py) Should be overridden on the command-line only, not here */
#endif // wxUSE_GUI

// ----------------------------------------------------------------------------
// compatibility settings
// ----------------------------------------------------------------------------

// This setting determines the compatibility with 2.8 API: set it to 0 to
// flag all cases of using deprecated functions.
//
// Default is 1 but please try building your code with 0 as the default will
// change to 0 in the next version and the deprecated functions will disappear
// in the version after it completely.
//
// Recommended setting: 0 (please update your code)
#cmakedefine01 WXWIN_COMPATIBILITY_2_8

// This setting determines the compatibility with 3.0 API: set it to 0 to
// flag all cases of using deprecated functions.
//
// Default is 1 but please try building your code with 0 as the default will
// change to 0 in the next version and the deprecated functions will disappear
// in the version after it completely.
//
// Recommended setting: 0 (please update your code)
#cmakedefine01 WXWIN_COMPATIBILITY_3_0

// MSW-only: Set to 0 for accurate dialog units, else 1 for old behaviour when
// default system font is used for wxWindow::GetCharWidth/Height() instead of
// the current font.
//
// Default is 0
//
// Recommended setting: 0
#cmakedefine01 wxDIALOG_UNIT_COMPATIBILITY

// ----------------------------------------------------------------------------
// debugging settings
// ----------------------------------------------------------------------------

// wxDEBUG_LEVEL will be defined as 1 in wx/debug.h so normally there is no
// need to define it here. You may do it for two reasons: either completely
// disable/compile out the asserts in release version (then do it inside #ifdef
// NDEBUG) or, on the contrary, enable more asserts, including the usually
// disabled ones, in the debug build (then do it inside #ifndef NDEBUG)
//
// #ifdef NDEBUG
//  #define wxDEBUG_LEVEL 0
// #else
//  #define wxDEBUG_LEVEL 2
// #endif

// wxHandleFatalExceptions() may be used to catch the program faults at run
// time and, instead of terminating the program with a usual GPF message box,
// call the user-defined wxApp::OnFatalException() function. If you set
// wxUSE_ON_FATAL_EXCEPTION to 0, wxHandleFatalExceptions() will not work.
//
// This setting is for Win32 only and can only be enabled if your compiler
// supports Win32 structured exception handling (currently only VC++ does)
//
// Default is 1
//
// Recommended setting: 1 if your compiler supports it.
#cmakedefine01 wxUSE_ON_FATAL_EXCEPTION

// Set this to 1 to be able to generate a human-readable (unlike
// machine-readable minidump created by wxCrashReport::Generate()) stack back
// trace when your program crashes using wxStackWalker
//
// Default is 1 if supported by the compiler.
//
// Recommended setting: 1, set to 0 if your programs never crash
#cmakedefine01 wxUSE_STACKWALKER

// Set this to 1 to compile in wxDebugReport class which allows you to create
// and optionally upload to your web site a debug report consisting of back
// trace of the crash (if wxUSE_STACKWALKER == 1) and other information.
//
// Default is 1 if supported by the compiler.
//
// Recommended setting: 1, it is compiled into a separate library so there
//                         is no overhead if you don't use it
#cmakedefine01 wxUSE_DEBUGREPORT

// Generic comment about debugging settings: they are very useful if you don't
// use any other memory leak detection tools such as Purify/BoundsChecker, but
// are probably redundant otherwise. Also, Visual C++ CRT has the same features
// as wxWidgets memory debugging subsystem built in since version 5.0 and you
// may prefer to use it instead of built in memory debugging code because it is
// faster and more fool proof.
//
// Using VC++ CRT memory debugging is enabled by default in debug build (_DEBUG
// is defined) if wxUSE_GLOBAL_MEMORY_OPERATORS is *not* enabled (i.e. is 0)
// and if __NO_VC_CRTDBG__ is not defined.

// The rest of the options in this section are obsolete and not supported,
// enable them at your own risk.

// If 1, enables wxDebugContext, for writing error messages to file, etc. If
// __WXDEBUG__ is not defined, will still use the normal memory operators.
//
// Default is 0
//
// Recommended setting: 0
#cmakedefine01 wxUSE_DEBUG_CONTEXT

// If 1, enables debugging versions of wxObject::new and wxObject::delete *IF*
// __WXDEBUG__ is also defined.
//
// WARNING: this code may not work with all architectures, especially if
// alignment is an issue. This switch is currently ignored for mingw / cygwin
//
// Default is 0
//
// Recommended setting: 1 if you are not using a memory debugging tool, else 0
#cmakedefine01 wxUSE_MEMORY_TRACING

// In debug mode, cause new and delete to be redefined globally.
// If this causes problems (e.g. link errors which is a common problem
// especially if you use another library which also redefines the global new
// and delete), set this to 0.
// This switch is currently ignored for mingw / cygwin
//
// Default is 0
//
// Recommended setting: 0
#cmakedefine01 wxUSE_GLOBAL_MEMORY_OPERATORS

// In debug mode, causes new to be defined to be WXDEBUG_NEW (see object.h). If
// this causes problems (e.g. link errors), set this to 0. You may need to set
// this to 0 if using templates (at least for VC++). This switch is currently
// ignored for MinGW/Cygwin.
//
// Default is 0
//
// Recommended setting: 0
#cmakedefine01 wxUSE_DEBUG_NEW_ALWAYS


// ----------------------------------------------------------------------------
// Unicode support
// ----------------------------------------------------------------------------

// These settings are obsolete: the library is always built in Unicode mode
// now, only set wxUSE_UNICODE to 0 to compile legacy code in ANSI mode if
// absolutely necessary -- updating it is strongly recommended as the ANSI mode
// will disappear completely in future wxWidgets releases.
#ifndef wxUSE_UNICODE
#define wxUSE_UNICODE 1 /* (gen_setups.py) Should be overridden on the command-line only, not here */
#endif

// wxUSE_WCHAR_T is required by wxWidgets now, don't change.
#cmakedefine01 wxUSE_WCHAR_T

// ----------------------------------------------------------------------------
// global features
// ----------------------------------------------------------------------------

// Compile library in exception-safe mode? If set to 1, the library will try to
// behave correctly in presence of exceptions (even though it still will not
// use the exceptions itself) and notify the user code about any unhandled
// exceptions. If set to 0, propagation of the exceptions through the library
// code will lead to undefined behaviour -- but the code itself will be
// slightly smaller and faster.
//
// Note that like wxUSE_THREADS this option is automatically set to 0 if
// wxNO_EXCEPTIONS is defined.
//
// Default is 1
//
// Recommended setting: depends on whether you intend to use C++ exceptions
//                      in your own code (1 if you do, 0 if you don't)
#cmakedefine01 wxUSE_EXCEPTIONS

// Set wxUSE_EXTENDED_RTTI to 1 to use extended RTTI
//
// Default is 0
//
// Recommended setting: 0 (this is still work in progress...)
#cmakedefine01 wxUSE_EXTENDED_RTTI

// Support for message/error logging. This includes wxLogXXX() functions and
// wxLog and derived classes. Don't set this to 0 unless you really know what
// you are doing.
//
// Default is 1
//
// Recommended setting: 1 (always)
#cmakedefine01 wxUSE_LOG

// Recommended setting: 1
#cmakedefine01 wxUSE_LOGWINDOW

// Recommended setting: 1
#cmakedefine01 wxUSE_LOGGUI

// Recommended setting: 1
#cmakedefine01 wxUSE_LOG_DIALOG

// Support for command line parsing using wxCmdLineParser class.
//
// Default is 1
//
// Recommended setting: 1 (can be set to 0 if you don't use the cmd line)
#cmakedefine01 wxUSE_CMDLINE_PARSER

// Support for multithreaded applications: if 1, compile in thread classes
// (thread.h) and make the library a bit more thread safe. Although thread
// support is quite stable by now, you may still consider recompiling the
// library without it if you have no use for it - this will result in a
// somewhat smaller and faster operation.
//
// Notice that if wxNO_THREADS is defined, wxUSE_THREADS is automatically reset
// to 0 in wx/chkconf.h, so, for example, if you set USE_THREADS to 0 in
// build/msw/config.* file this value will have no effect.
//
// Default is 1
//
// Recommended setting: 0 unless you do plan to develop MT applications
#cmakedefine01 wxUSE_THREADS

// If enabled, compiles wxWidgets streams classes
//
// wx stream classes are used for image IO, process IO redirection, network
// protocols implementation and much more and so disabling this results in a
// lot of other functionality being lost.
//
// Default is 1
//
// Recommended setting: 1 as setting it to 0 disables many other things
#cmakedefine01 wxUSE_STREAMS

// Support for positional parameters (e.g. %1$d, %2$s ...) in wxVsnprintf.
// Note that if the system's implementation does not support positional
// parameters, setting this to 1 forces the use of the wxWidgets implementation
// of wxVsnprintf. The standard vsnprintf() supports positional parameters on
// many Unix systems but usually doesn't under Windows.
//
// Positional parameters are very useful when translating a program since using
// them in formatting strings allow translators to correctly reorder the
// translated sentences.
//
// Default is 1
//
// Recommended setting: 1 if you want to support multiple languages
#cmakedefine01 wxUSE_PRINTF_POS_PARAMS

// Enable the use of compiler-specific thread local storage keyword, if any.
// This is used for wxTLS_XXX() macros implementation and normally should use
// the compiler-provided support as it's simpler and more efficient, but is
// disabled under Windows in wx/msw/chkconf.h as it can't be used if wxWidgets
// is used in a dynamically loaded Win32 DLL (i.e. using LoadLibrary()) under
// XP as this triggers a bug in compiler TLS support that results in crashes
// when any TLS variables are used.
//
// If you're absolutely sure that your build of wxWidgets is never going to be
// used in such situation, either because it's not going to be linked from any
// kind of plugin or because you only target Vista or later systems, you can
// set this to 2 to force the use of compiler TLS even under MSW.
//
// Default is 1 meaning that compiler TLS is used only if it's 100% safe.
//
// Recommended setting: 2 if you want to have maximal performance and don't
// care about the scenario described above.
#cmakedefine01 wxUSE_COMPILER_TLS

// ----------------------------------------------------------------------------
// Interoperability with the standard library.
// ----------------------------------------------------------------------------

// Set wxUSE_STL to 1 to enable maximal interoperability with the standard
// library, even at the cost of backwards compatibility.
//
// Default is 0
//
// Recommended setting: 0 as the options below already provide a relatively
// good level of interoperability and changing this option arguably isn't worth
// diverging from the official builds of the library.
#cmakedefine01 wxUSE_STL

// This is not a real option but is used as the default value for
// wxUSE_STD_IOSTREAM, wxUSE_STD_STRING and wxUSE_STD_CONTAINERS.
//
// Currently the Digital Mars and Watcom compilers come without standard C++
// library headers by default, wxUSE_STD_STRING can be set to 1 if you do have
// them (e.g. from STLPort).
//
// VC++ 5.0 does include standard C++ library headers, however they produce
// many warnings that can't be turned off when compiled at warning level 4.
#if defined(__DMC__) || defined(__WATCOMC__) \
        || (defined(_MSC_VER) && _MSC_VER < 1200)
    #define wxUSE_STD_DEFAULT  0
#else
    #define wxUSE_STD_DEFAULT  1
#endif

// Use standard C++ containers to implement wxVector<>, wxStack<>, wxDList<>
// and wxHashXXX<> classes. If disabled, wxWidgets own (mostly compatible but
// usually more limited) implementations are used which allows to avoid the
// dependency on the C++ run-time library.
//
// Notice that the compilers mentioned in wxUSE_STD_DEFAULT comment above don't
// support using standard containers and that VC6 needs non-default options for
// such build to avoid getting "fatal error C1076: compiler limit : internal
// heap limit reached; use /Zm to specify a higher limit" in its own standard
// headers, so you need to ensure you do increase the heap size before enabling
// this option for this compiler.
//
// Default is 0 for compatibility reasons.
//
// Recommended setting: 1 unless compatibility with the official wxWidgets
// build and/or the existing code is a concern.
#cmakedefine01 wxUSE_STD_CONTAINERS

// Use standard C++ streams if 1 instead of wx streams in some places. If
// disabled, wx streams are used everywhere and wxWidgets doesn't depend on the
// standard streams library.
//
// Notice that enabling this does not replace wx streams with std streams
// everywhere, in a lot of places wx streams are used no matter what.
//
// Default is 1 if compiler supports it.
//
// Recommended setting: 1 if you use the standard streams anyhow and so
//                      dependency on the standard streams library is not a
//                      problem
#define wxUSE_STD_IOSTREAM  wxUSE_STD_DEFAULT /* (gen_setups.py) Value depends on other parameters, change these instead */

// Enable minimal interoperability with the standard C++ string class if 1.
// "Minimal" means that wxString can be constructed from std::string or
// std::wstring but can't be implicitly converted to them. You need to enable
// the option below for the latter.
//
// Default is 1 for most compilers.
//
// Recommended setting: 1 unless you want to ensure your program doesn't use
//                      the standard C++ library at all.
#define wxUSE_STD_STRING  wxUSE_STD_DEFAULT /* (gen_setups.py) Value depends on other parameters, change these instead */

// Make wxString as much interchangeable with std::[w]string as possible, in
// particular allow implicit conversion of wxString to either of these classes.
// This comes at a price (or a benefit, depending on your point of view) of not
// allowing implicit conversion to "const char *" and "const wchar_t *".
//
// Because a lot of existing code relies on these conversions, this option is
// disabled by default but can be enabled for your build if you don't care
// about compatibility.
//
// Default is 0 if wxUSE_STL has its default value or 1 if it is enabled.
//
// Recommended setting: 0 to remain compatible with the official builds of
// wxWidgets.
#define wxUSE_STD_STRING_CONV_IN_WXSTRING wxUSE_STL /* (gen_setups.py) Value depends on other parameters, change these instead */

// VC++ 4.2 and above allows <iostream> and <iostream.h> but you can't mix
// them. Set this option to 1 to use <iostream.h>, 0 to use <iostream>.
//
// Note that newer compilers (including VC++ 7.1 and later) don't support
// wxUSE_IOSTREAMH == 1 and so <iostream> will be used anyhow.
//
// Default is 0.
//
// Recommended setting: 0, only set to 1 if you use a really old compiler
#cmakedefine01 wxUSE_IOSTREAMH


// ----------------------------------------------------------------------------
// non GUI features selection
// ----------------------------------------------------------------------------

// Set wxUSE_LONGLONG to 1 to compile the wxLongLong class. This is a 64 bit
// integer which is implemented in terms of native 64 bit integers if any or
// uses emulation otherwise.
//
// This class is required by wxDateTime and so you should enable it if you want
// to use wxDateTime. For most modern platforms, it will use the native 64 bit
// integers in which case (almost) all of its functions are inline and it
// almost does not take any space, so there should be no reason to switch it
// off.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_LONGLONG

// Set wxUSE_BASE64 to 1, to compile in Base64 support. This is required for
// storing binary data in wxConfig on most platforms.
//
// Default is 1.
//
// Recommended setting: 1 (but can be safely disabled if you don't use it)
#cmakedefine01 wxUSE_BASE64

// Set this to 1 to be able to use wxEventLoop even in console applications
// (i.e. using base library only, without GUI). This is mostly useful for
// processing socket events but is also necessary to use timers in console
// applications
//
// Default is 1.
//
// Recommended setting: 1 (but can be safely disabled if you don't use it)
#cmakedefine01 wxUSE_CONSOLE_EVENTLOOP

// Set wxUSE_(F)FILE to 1 to compile wx(F)File classes. wxFile uses low level
// POSIX functions for file access, wxFFile uses ANSI C stdio.h functions.
//
// Default is 1
//
// Recommended setting: 1 (wxFile is highly recommended as it is required by
// i18n code, wxFileConfig and others)
#cmakedefine01 wxUSE_FILE
#cmakedefine01 wxUSE_FFILE

// Use wxFSVolume class providing access to the configured/active mount points
//
// Default is 1
//
// Recommended setting: 1 (but may be safely disabled if you don't use it)
#cmakedefine01 wxUSE_FSVOLUME

// Use wxStandardPaths class which allows to retrieve some standard locations
// in the file system
//
// Default is 1
//
// Recommended setting: 1 (may be disabled to save space, but not much)
#cmakedefine01 wxUSE_STDPATHS

// use wxTextBuffer class: required by wxTextFile
#cmakedefine01 wxUSE_TEXTBUFFER

// use wxTextFile class: requires wxFile and wxTextBuffer, required by
// wxFileConfig
#cmakedefine01 wxUSE_TEXTFILE

// i18n support: _() macro, wxLocale class. Requires wxTextFile.
#cmakedefine01 wxUSE_INTL

// Provide wxFoo_l() functions similar to standard foo() functions but taking
// an extra locale parameter.
//
// Notice that this is fully implemented only for the systems providing POSIX
// xlocale support or Microsoft Visual C++ >= 8 (which provides proprietary
// almost-equivalent of xlocale functions), otherwise wxFoo_l() functions will
// only work for the current user locale and "C" locale. You can use
// wxHAS_XLOCALE_SUPPORT to test whether the full support is available.
//
// Default is 1
//
// Recommended setting: 1 but may be disabled if you are writing programs
// running only in C locale anyhow
#cmakedefine01 wxUSE_XLOCALE

// Set wxUSE_DATETIME to 1 to compile the wxDateTime and related classes which
// allow to manipulate dates, times and time intervals. wxDateTime replaces the
// old wxTime and wxDate classes which are still provided for backwards
// compatibility (and implemented in terms of wxDateTime).
//
// Note that this class is relatively new and is still officially in alpha
// stage because some features are not yet (fully) implemented. It is already
// quite useful though and should only be disabled if you are aiming at
// absolutely minimal version of the library.
//
// Requires: wxUSE_LONGLONG
//
// Default is 1
//
// Recommended setting: 1
#cmakedefine01 wxUSE_DATETIME

// Set wxUSE_TIMER to 1 to compile wxTimer class
//
// Default is 1
//
// Recommended setting: 1
#cmakedefine01 wxUSE_TIMER

// Use wxStopWatch clas.
//
// Default is 1
//
// Recommended setting: 1 (needed by wxSocket)
#cmakedefine01 wxUSE_STOPWATCH

// Set wxUSE_FSWATCHER to 1 if you want to enable wxFileSystemWatcher
//
// Default is 1
//
// Recommended setting: 1
#cmakedefine01 wxUSE_FSWATCHER

// Setting wxUSE_CONFIG to 1 enables the use of wxConfig and related classes
// which allow the application to store its settings in the persistent
// storage. Setting this to 1 will also enable on-demand creation of the
// global config object in wxApp.
//
// See also wxUSE_CONFIG_NATIVE below.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_CONFIG

// If wxUSE_CONFIG is 1, you may choose to use either the native config
// classes under Windows (using .INI files under Win16 and the registry under
// Win32) or the portable text file format used by the config classes under
// Unix.
//
// Default is 1 to use native classes. Note that you may still use
// wxFileConfig even if you set this to 1 - just the config object created by
// default for the applications needs will be a wxRegConfig or wxIniConfig and
// not wxFileConfig.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_CONFIG_NATIVE

// If wxUSE_DIALUP_MANAGER is 1, compile in wxDialUpManager class which allows
// to connect/disconnect from the network and be notified whenever the dial-up
// network connection is established/terminated. Requires wxUSE_DYNAMIC_LOADER.
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_DIALUP_MANAGER

// Compile in classes for run-time DLL loading and function calling.
// Required by wxUSE_DIALUP_MANAGER.
//
// This setting is for Win32 only
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_DYNLIB_CLASS

// experimental, don't use for now
#cmakedefine01 wxUSE_DYNAMIC_LOADER

// Set to 1 to use socket classes
#cmakedefine01 wxUSE_SOCKETS

// Set to 1 to use ipv6 socket classes (requires wxUSE_SOCKETS)
//
// Notice that currently setting this option under Windows will result in
// programs which can only run on recent OS versions (with ws2_32.dll
// installed) which is why it is disabled by default.
//
// Default is 1.
//
// Recommended setting: 1 if you need IPv6 support
#cmakedefine01 wxUSE_IPV6

// Set to 1 to enable virtual file systems (required by wxHTML)
#cmakedefine01 wxUSE_FILESYSTEM

// Set to 1 to enable virtual ZIP filesystem (requires wxUSE_FILESYSTEM)
#cmakedefine01 wxUSE_FS_ZIP

// Set to 1 to enable virtual archive filesystem (requires wxUSE_FILESYSTEM)
#cmakedefine01 wxUSE_FS_ARCHIVE

// Set to 1 to enable virtual Internet filesystem (requires wxUSE_FILESYSTEM)
#cmakedefine01 wxUSE_FS_INET

// wxArchive classes for accessing archives such as zip and tar
#cmakedefine01 wxUSE_ARCHIVE_STREAMS

// Set to 1 to compile wxZipInput/OutputStream classes.
#cmakedefine01 wxUSE_ZIPSTREAM

// Set to 1 to compile wxTarInput/OutputStream classes.
#cmakedefine01 wxUSE_TARSTREAM

// Set to 1 to compile wxZlibInput/OutputStream classes. Also required by
// wxUSE_LIBPNG
#cmakedefine01 wxUSE_ZLIB

// If enabled, the code written by Apple will be used to write, in a portable
// way, float on the disk. See extended.c for the license which is different
// from wxWidgets one.
//
// Default is 1.
//
// Recommended setting: 1 unless you don't like the license terms (unlikely)
#cmakedefine01 wxUSE_APPLE_IEEE

// Joystick support class
#cmakedefine01 wxUSE_JOYSTICK

// wxFontEnumerator class
#cmakedefine01 wxUSE_FONTENUM

// wxFontMapper class
#cmakedefine01 wxUSE_FONTMAP

// wxMimeTypesManager class
#cmakedefine01 wxUSE_MIMETYPE

// wxProtocol and related classes: if you want to use either of wxFTP, wxHTTP
// or wxURL you need to set this to 1.
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_PROTOCOL

// The settings for the individual URL schemes
#cmakedefine01 wxUSE_PROTOCOL_FILE
#cmakedefine01 wxUSE_PROTOCOL_FTP
#cmakedefine01 wxUSE_PROTOCOL_HTTP

// Define this to use wxURL class.
#cmakedefine01 wxUSE_URL

// Define this to use native platform url and protocol support.
// Currently valid only for MS-Windows.
// Note: if you set this to 1, you can open ftp/http/gopher sites
// and obtain a valid input stream for these sites
// even when you set wxUSE_PROTOCOL_FTP/HTTP to 0.
// Doing so reduces the code size.
//
// This code is experimental and subject to change.
#cmakedefine01 wxUSE_URL_NATIVE

// Support for wxVariant class used in several places throughout the library,
// notably in wxDataViewCtrl API.
//
// Default is 1.
//
// Recommended setting: 1 unless you want to reduce the library size as much as
// possible in which case setting this to 0 can gain up to 100KB.
#cmakedefine01 wxUSE_VARIANT

// Support for wxAny class, the successor for wxVariant.
//
// Default is 1.
//
// Recommended setting: 1 unless you want to reduce the library size by a small amount,
// or your compiler cannot for some reason cope with complexity of templates used.
#cmakedefine01 wxUSE_ANY

// Support for regular expression matching via wxRegEx class: enable this to
// use POSIX regular expressions in your code. You need to compile regex
// library from src/regex to use it under Windows.
//
// Default is 0
//
// Recommended setting: 1 if your compiler supports it, if it doesn't please
// contribute us a makefile for src/regex for it
#cmakedefine01 wxUSE_REGEX

// wxSystemOptions class
#cmakedefine01 wxUSE_SYSTEM_OPTIONS

// wxSound class
#cmakedefine01 wxUSE_SOUND

// Use wxMediaCtrl
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_MEDIACTRL

// Use wxWidget's XRC XML-based resource system.  Recommended.
//
// Default is 1
//
// Recommended setting: 1 (requires wxUSE_XML)
#cmakedefine01 wxUSE_XRC

// XML parsing classes. Note that their API will change in the future, so
// using wxXmlDocument and wxXmlNode in your app is not recommended.
//
// Default is the same as wxUSE_XRC, i.e. 1 by default.
//
// Recommended setting: 1 (required by XRC)
#define wxUSE_XML       wxUSE_XRC /* (gen_setups.py) Value depends on other parameters, change these instead */

// Use wxWidget's AUI docking system
//
// Default is 1
//
// Recommended setting: 1
#cmakedefine01 wxUSE_AUI

// Use wxWidget's Ribbon classes for interfaces
//
// Default is 1
//
// Recommended setting: 1
#cmakedefine01 wxUSE_RIBBON

// Use wxPropertyGrid.
//
// Default is 1
//
// Recommended setting: 1
#cmakedefine01 wxUSE_PROPGRID

// Use wxStyledTextCtrl, a wxWidgets implementation of Scintilla.
//
// Default is 1
//
// Recommended setting: 1
#cmakedefine01 wxUSE_STC

// Use wxWidget's web viewing classes
//
// Default is 1
//
// Recommended setting: 1
#cmakedefine01 wxUSE_WEBVIEW

// Use the IE wxWebView backend
//
// Default is 1 on MSW
//
// Recommended setting: 1
#ifdef __WXMSW__
#define wxUSE_WEBVIEW_IE 1
#else
#define wxUSE_WEBVIEW_IE 0
#endif

// Use the WebKit wxWebView backend
//
// Default is 1 on GTK and OSX
//
// Recommended setting: 1
#if defined(__WXGTK__) || defined(__WXOSX__)
#define wxUSE_WEBVIEW_WEBKIT 1
#else
#define wxUSE_WEBVIEW_WEBKIT 0
#endif

// Enable the new wxGraphicsPath and wxGraphicsContext classes for an advanced
// 2D drawing API.  (Still somewhat experimental)
//
// Please note that on Windows gdiplus.dll is loaded dynamically which means
// that nothing special needs to be done as long as you don't use
// wxGraphicsContext at all or only use it on XP and later systems but you
// still do need to distribute it yourself for an application using
// wxGraphicsContext to be runnable on pre-XP systems.
//
// Default is 1 except if you're using a non-Microsoft compiler under Windows
// as only MSVC7+ is known to ship with gdiplus.h. For other compilers (e.g.
// mingw32) you may need to install the headers (and just the headers)
// yourself. If you do, change the setting below manually.
//
// Recommended setting: 1 if supported by the compilation environment

// notice that we can't use wxCHECK_VISUALC_VERSION() here as this file is
// included from wx/platform.h before wxCHECK_VISUALC_VERSION() is defined
#ifdef _MSC_VER
#   if _MSC_VER >= 1310
        // MSVC7.1+ comes with new enough Platform SDK, enable
        // wxGraphicsContext support for it
#cmakedefine01 wxUSE_GRAPHICS_CONTEXT
#   else
        // MSVC 6 didn't include GDI+ headers so disable by default, enable it
        // here if you use MSVC 6 with a newer SDK
#       define wxUSE_GRAPHICS_CONTEXT 0
#   endif
#else
    // Disable support for other Windows compilers, enable it if your compiler
    // comes with new enough SDK or you installed the headers manually.
    //
    // Notice that this will be set by configure under non-Windows platforms
    // anyhow so the value there is not important.
#   define wxUSE_GRAPHICS_CONTEXT 0
#endif

// Enable wxGraphicsContext implementation using Cairo library.
//
// This is not needed under Windows and detected automatically by configure
// under other systems, however you may set this to 1 manually if you installed
// Cairo under Windows yourself and prefer to use it instead the native GDI+
// implementation.
//
// Default is 0
//
// Recommended setting: 0
#cmakedefine01 wxUSE_CAIRO


// ----------------------------------------------------------------------------
// Individual GUI controls
// ----------------------------------------------------------------------------

// You must set wxUSE_CONTROLS to 1 if you are using any controls at all
// (without it, wxControl class is not compiled)
//
// Default is 1
//
// Recommended setting: 1 (don't change except for very special programs)
#cmakedefine01 wxUSE_CONTROLS

// Support markup in control labels, i.e. provide wxControl::SetLabelMarkup().
// Currently markup is supported only by a few controls and only some ports but
// their number will increase with time.
//
// Default is 1
//
// Recommended setting: 1 (may be set to 0 if you want to save on code size)
#cmakedefine01 wxUSE_MARKUP

// wxPopupWindow class is a top level transient window. It is currently used
// to implement wxTipWindow
//
// Default is 1
//
// Recommended setting: 1 (may be set to 0 if you don't wxUSE_TIPWINDOW)
#cmakedefine01 wxUSE_POPUPWIN

// wxTipWindow allows to implement the custom tooltips, it is used by the
// context help classes. Requires wxUSE_POPUPWIN.
//
// Default is 1
//
// Recommended setting: 1 (may be set to 0)
#cmakedefine01 wxUSE_TIPWINDOW

// Each of the settings below corresponds to one wxWidgets control. They are
// all switched on by default but may be disabled if you are sure that your
// program (including any standard dialogs it can show!) doesn't need them and
// if you desperately want to save some space. If you use any of these you must
// set wxUSE_CONTROLS as well.
//
// Default is 1
//
// Recommended setting: 1
#cmakedefine01 wxUSE_ANIMATIONCTRL
#cmakedefine01 wxUSE_BANNERWINDOW
#cmakedefine01 wxUSE_BUTTON
#cmakedefine01 wxUSE_BMPBUTTON
#cmakedefine01 wxUSE_CALENDARCTRL
#cmakedefine01 wxUSE_CHECKBOX
#cmakedefine01 wxUSE_CHECKLISTBOX
#cmakedefine01 wxUSE_CHOICE
#cmakedefine01 wxUSE_COLLPANE
#cmakedefine01 wxUSE_COLOURPICKERCTRL
#cmakedefine01 wxUSE_COMBOBOX
#cmakedefine01 wxUSE_COMMANDLINKBUTTON
#cmakedefine01 wxUSE_DATAVIEWCTRL
#cmakedefine01 wxUSE_DATEPICKCTRL
#cmakedefine01 wxUSE_DIRPICKERCTRL
#cmakedefine01 wxUSE_EDITABLELISTBOX
#cmakedefine01 wxUSE_FILECTRL
#cmakedefine01 wxUSE_FILEPICKERCTRL
#cmakedefine01 wxUSE_FONTPICKERCTRL
#cmakedefine01 wxUSE_GAUGE
#cmakedefine01 wxUSE_HEADERCTRL
#cmakedefine01 wxUSE_HYPERLINKCTRL
#cmakedefine01 wxUSE_LISTBOX
#cmakedefine01 wxUSE_LISTCTRL
#cmakedefine01 wxUSE_RADIOBOX
#cmakedefine01 wxUSE_RADIOBTN
#cmakedefine01 wxUSE_RICHMSGDLG
#cmakedefine01 wxUSE_SCROLLBAR
#cmakedefine01 wxUSE_SEARCHCTRL
#cmakedefine01 wxUSE_SLIDER
#cmakedefine01 wxUSE_SPINBTN
#cmakedefine01 wxUSE_SPINCTRL
#cmakedefine01 wxUSE_STATBOX
#cmakedefine01 wxUSE_STATLINE
#cmakedefine01 wxUSE_STATTEXT
#cmakedefine01 wxUSE_STATBMP
#cmakedefine01 wxUSE_TEXTCTRL
#cmakedefine01 wxUSE_TIMEPICKCTRL
#cmakedefine01 wxUSE_TOGGLEBTN
#cmakedefine01 wxUSE_TREECTRL
#cmakedefine01 wxUSE_TREELISTCTRL

// Use a status bar class? Depending on the value of wxUSE_NATIVE_STATUSBAR
// below either wxStatusBar95 or a generic wxStatusBar will be used.
//
// Default is 1
//
// Recommended setting: 1
#cmakedefine01 wxUSE_STATUSBAR

// Two status bar implementations are available under Win32: the generic one
// or the wrapper around native control. For native look and feel the native
// version should be used.
//
// Default is 1 for the platforms where native status bar is supported.
//
// Recommended setting: 1 (there is no advantage in using the generic one)
#cmakedefine01 wxUSE_NATIVE_STATUSBAR

// wxToolBar related settings: if wxUSE_TOOLBAR is 0, don't compile any toolbar
// classes at all. Otherwise, use the native toolbar class unless
// wxUSE_TOOLBAR_NATIVE is 0.
//
// Default is 1 for all settings.
//
// Recommended setting: 1 for wxUSE_TOOLBAR and wxUSE_TOOLBAR_NATIVE.
#cmakedefine01 wxUSE_TOOLBAR
#cmakedefine01 wxUSE_TOOLBAR_NATIVE

// wxNotebook is a control with several "tabs" located on one of its sides. It
// may be used to logically organise the data presented to the user instead of
// putting everything in one huge dialog. It replaces wxTabControl and related
// classes of wxWin 1.6x.
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_NOTEBOOK

// wxListbook control is similar to wxNotebook but uses wxListCtrl instead of
// the tabs
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_LISTBOOK

// wxChoicebook control is similar to wxNotebook but uses wxChoice instead of
// the tabs
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_CHOICEBOOK

// wxTreebook control is similar to wxNotebook but uses wxTreeCtrl instead of
// the tabs
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_TREEBOOK

// wxToolbook control is similar to wxNotebook but uses wxToolBar instead of
// tabs
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_TOOLBOOK

// wxTaskBarIcon is a small notification icon shown in the system toolbar or
// dock.
//
// Default is 1.
//
// Recommended setting: 1 (but can be set to 0 if you don't need it)
#cmakedefine01 wxUSE_TASKBARICON

// wxGrid class
//
// Default is 1, set to 0 to cut down compilation time and binaries size if you
// don't use it.
//
// Recommended setting: 1
//
#cmakedefine01 wxUSE_GRID

// wxMiniFrame class: a frame with narrow title bar
//
// Default is 1.
//
// Recommended setting: 1 (it doesn't cost almost anything)
#cmakedefine01 wxUSE_MINIFRAME

// wxComboCtrl and related classes: combobox with custom popup window and
// not necessarily a listbox.
//
// Default is 1.
//
// Recommended setting: 1 but can be safely set to 0 except for wxUniv where it
//                      it used by wxComboBox
#cmakedefine01 wxUSE_COMBOCTRL

// wxOwnerDrawnComboBox is a custom combobox allowing to paint the combobox
// items.
//
// Default is 1.
//
// Recommended setting: 1 but can be safely set to 0, except where it is
//                      needed as a base class for generic wxBitmapComboBox.
#cmakedefine01 wxUSE_ODCOMBOBOX

// wxBitmapComboBox is a combobox that can have images in front of text items.
//
// Default is 1.
//
// Recommended setting: 1 but can be safely set to 0
#cmakedefine01 wxUSE_BITMAPCOMBOBOX

// wxRearrangeCtrl is a wxCheckListBox with two buttons allowing to move items
// up and down in it. It is also used as part of wxRearrangeDialog.
//
// Default is 1.
//
// Recommended setting: 1 but can be safely set to 0 (currently used only by
// wxHeaderCtrl)
#cmakedefine01 wxUSE_REARRANGECTRL

// ----------------------------------------------------------------------------
// Miscellaneous GUI stuff
// ----------------------------------------------------------------------------

// wxAcceleratorTable/Entry classes and support for them in wxMenu(Bar)
#cmakedefine01 wxUSE_ACCEL

// Use the standard art provider. The icons returned by this provider are
// embedded into the library as XPMs so disabling it reduces the library size
// somewhat but this should only be done if you use your own custom art
// provider returning the icons or never use any icons not provided by the
// native art provider (which might not be implemented at all for some
// platforms) or by the Tango icons provider (if it's not itself disabled
// below).
//
// Default is 1.
//
// Recommended setting: 1 unless you use your own custom art provider.
#cmakedefine01 wxUSE_ARTPROVIDER_STD

// Use art provider providing Tango icons: this art provider has higher quality
// icons than the default ones using smaller size XPM icons without
// transparency but the embedded PNG icons add to the library size.
//
// Default is 1 under non-GTK ports. Under wxGTK the native art provider using
// the GTK+ stock icons replaces it so it is normally not necessary.
//
// Recommended setting: 1 but can be turned off to reduce the library size.
#cmakedefine01 wxUSE_ARTPROVIDER_TANGO

// Hotkey support (currently Windows only)
#cmakedefine01 wxUSE_HOTKEY

// Use wxCaret: a class implementing a "cursor" in a text control (called caret
// under Windows).
//
// Default is 1.
//
// Recommended setting: 1 (can be safely set to 0, not used by the library)
#cmakedefine01 wxUSE_CARET

// Use wxDisplay class: it allows enumerating all displays on a system and
// their geometries as well as finding the display on which the given point or
// window lies.
//
// Default is 1.
//
// Recommended setting: 1 if you need it, can be safely set to 0 otherwise
#cmakedefine01 wxUSE_DISPLAY

// Miscellaneous geometry code: needed for Canvas library
#cmakedefine01 wxUSE_GEOMETRY

// Use wxImageList. This class is needed by wxNotebook, wxTreeCtrl and
// wxListCtrl.
//
// Default is 1.
//
// Recommended setting: 1 (set it to 0 if you don't use any of the controls
// enumerated above, then this class is mostly useless too)
#cmakedefine01 wxUSE_IMAGLIST

// Use wxInfoBar class.
//
// Default is 1.
//
// Recommended setting: 1 (but can be disabled without problems as nothing
// depends on it)
#cmakedefine01 wxUSE_INFOBAR

// Use wxMenu, wxMenuBar, wxMenuItem.
//
// Default is 1.
//
// Recommended setting: 1 (can't be disabled under MSW)
#cmakedefine01 wxUSE_MENUS

// Use wxNotificationMessage.
//
// wxNotificationMessage allows to show non-intrusive messages to the user
// using balloons, banners, popups or whatever is the appropriate method for
// the current platform.
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_NOTIFICATION_MESSAGE

// wxPreferencesEditor provides a common API for different ways of presenting
// the standard "Preferences" or "Properties" dialog under different platforms
// (e.g. some use modal dialogs, some use modeless ones; some apply the changes
// immediately while others require an explicit "Apply" button).
//
// Default is 1.
//
// Recommended setting: 1 (but can be safely disabled if you don't use it)
#cmakedefine01 wxUSE_PREFERENCES_EDITOR

// wxRichToolTip is a customizable tooltip class which has more functionality
// than the stock (but native, unlike this class) wxToolTip.
//
// Default is 1.
//
// Recommended setting: 1 (but can be safely set to 0 if you don't need it)
#cmakedefine01 wxUSE_RICHTOOLTIP

// Use wxSashWindow class.
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_SASH

// Use wxSplitterWindow class.
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_SPLITTER

// Use wxToolTip and wxWindow::Set/GetToolTip() methods.
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_TOOLTIPS

// wxValidator class and related methods
#cmakedefine01 wxUSE_VALIDATORS

// Use reference counted ID management: this means that wxWidgets will track
// the automatically allocated ids (those used when you use wxID_ANY when
// creating a window, menu or toolbar item &c) instead of just supposing that
// the program never runs out of them. This is mostly useful only under wxMSW
// where the total ids range is limited to SHRT_MIN..SHRT_MAX and where
// long-running programs can run into problems with ids reuse without this. On
// the other platforms, where the ids have the full int range, this shouldn't
// be necessary.
#ifdef __WXMSW__
#define wxUSE_AUTOID_MANAGEMENT 1
#else
#cmakedefine01 wxUSE_AUTOID_MANAGEMENT
#endif

// ----------------------------------------------------------------------------
// common dialogs
// ----------------------------------------------------------------------------

// On rare occasions (e.g. using DJGPP) may want to omit common dialogs (e.g.
// file selector, printer dialog). Switching this off also switches off the
// printing architecture and interactive wxPrinterDC.
//
// Default is 1
//
// Recommended setting: 1 (unless it really doesn't work)
#cmakedefine01 wxUSE_COMMON_DIALOGS

// wxBusyInfo displays window with message when app is busy. Works in same way
// as wxBusyCursor
#cmakedefine01 wxUSE_BUSYINFO

// Use single/multiple choice dialogs.
//
// Default is 1
//
// Recommended setting: 1 (used in the library itself)
#cmakedefine01 wxUSE_CHOICEDLG

// Use colour picker dialog
//
// Default is 1
//
// Recommended setting: 1
#cmakedefine01 wxUSE_COLOURDLG

// wxDirDlg class for getting a directory name from user
#cmakedefine01 wxUSE_DIRDLG

// TODO: setting to choose the generic or native one

// Use file open/save dialogs.
//
// Default is 1
//
// Recommended setting: 1 (used in many places in the library itself)
#cmakedefine01 wxUSE_FILEDLG

// Use find/replace dialogs.
//
// Default is 1
//
// Recommended setting: 1 (but may be safely set to 0)
#cmakedefine01 wxUSE_FINDREPLDLG

// Use font picker dialog
//
// Default is 1
//
// Recommended setting: 1 (used in the library itself)
#cmakedefine01 wxUSE_FONTDLG

// Use wxMessageDialog and wxMessageBox.
//
// Default is 1
//
// Recommended setting: 1 (used in the library itself)
#cmakedefine01 wxUSE_MSGDLG

// progress dialog class for lengthy operations
#cmakedefine01 wxUSE_PROGRESSDLG

// support for startup tips (wxShowTip &c)
#cmakedefine01 wxUSE_STARTUP_TIPS

// text entry dialog and wxGetTextFromUser function
#cmakedefine01 wxUSE_TEXTDLG

// number entry dialog
#cmakedefine01 wxUSE_NUMBERDLG

// splash screen class
#cmakedefine01 wxUSE_SPLASH

// wizards
#cmakedefine01 wxUSE_WIZARDDLG

// Compile in wxAboutBox() function showing the standard "About" dialog.
//
// Default is 1
//
// Recommended setting: 1 but can be set to 0 to save some space if you don't
//                      use this function
#cmakedefine01 wxUSE_ABOUTDLG

// wxFileHistory class
//
// Default is 1
//
// Recommended setting: 1
#cmakedefine01 wxUSE_FILE_HISTORY

// ----------------------------------------------------------------------------
// Metafiles support
// ----------------------------------------------------------------------------

// Windows supports the graphics format known as metafile which is, though not
// portable, is widely used under Windows and so is supported by wxWin (under
// Windows only, of course). Win16 (Win3.1) used the so-called "Window
// MetaFiles" or WMFs which were replaced with "Enhanced MetaFiles" or EMFs in
// Win32 (Win9x, NT, 2000). Both of these are supported in wxWin and, by
// default, WMFs will be used under Win16 and EMFs under Win32. This may be
// changed by setting wxUSE_WIN_METAFILES_ALWAYS to 1 and/or setting
// wxUSE_ENH_METAFILE to 0. You may also set wxUSE_METAFILE to 0 to not compile
// in any metafile related classes at all.
//
// Default is 1 for wxUSE_ENH_METAFILE and 0 for wxUSE_WIN_METAFILES_ALWAYS.
//
// Recommended setting: default or 0 for everything for portable programs.
#cmakedefine01 wxUSE_METAFILE
#cmakedefine01 wxUSE_ENH_METAFILE
#cmakedefine01 wxUSE_WIN_METAFILES_ALWAYS

// ----------------------------------------------------------------------------
// Big GUI components
// ----------------------------------------------------------------------------

// Set to 0 to disable MDI support.
//
// Requires wxUSE_NOTEBOOK under platforms other than MSW.
//
// Default is 1.
//
// Recommended setting: 1, can be safely set to 0.
#cmakedefine01 wxUSE_MDI

// Set to 0 to disable document/view architecture
#cmakedefine01 wxUSE_DOC_VIEW_ARCHITECTURE

// Set to 0 to disable MDI document/view architecture
//
// Requires wxUSE_MDI && wxUSE_DOC_VIEW_ARCHITECTURE
#cmakedefine01 wxUSE_MDI_ARCHITECTURE

// Set to 0 to disable print/preview architecture code
#cmakedefine01 wxUSE_PRINTING_ARCHITECTURE

// wxHTML sublibrary allows to display HTML in wxWindow programs and much,
// much more.
//
// Default is 1.
//
// Recommended setting: 1 (wxHTML is great!), set to 0 if you want compile a
// smaller library.
#cmakedefine01 wxUSE_HTML

// Setting wxUSE_GLCANVAS to 1 enables OpenGL support. You need to have OpenGL
// headers and libraries to be able to compile the library with wxUSE_GLCANVAS
// set to 1 and, under Windows, also to add opengl32.lib and glu32.lib to the
// list of libraries used to link your application (although this is done
// implicitly for Microsoft Visual C++ users).
//
// Default is 1 unless the compiler is known to ship without the necessary
// headers (Digital Mars) or the platform doesn't support OpenGL (Windows CE).
//
// Recommended setting: 1 if you intend to use OpenGL, can be safely set to 0
// otherwise.
#cmakedefine01 wxUSE_GLCANVAS

// wxRichTextCtrl allows editing of styled text.
//
// Default is 1.
//
// Recommended setting: 1, set to 0 if you want compile a
// smaller library.
#cmakedefine01 wxUSE_RICHTEXT

// ----------------------------------------------------------------------------
// Data transfer
// ----------------------------------------------------------------------------

// Use wxClipboard class for clipboard copy/paste.
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_CLIPBOARD

// Use wxDataObject and related classes. Needed for clipboard and OLE drag and
// drop
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_DATAOBJ

// Use wxDropTarget and wxDropSource classes for drag and drop (this is
// different from "built in" drag and drop in wxTreeCtrl which is always
// available). Requires wxUSE_DATAOBJ.
//
// Default is 1.
//
// Recommended setting: 1
#cmakedefine01 wxUSE_DRAG_AND_DROP

// Use wxAccessible for enhanced and customisable accessibility.
// Depends on wxUSE_OLE.
//
// Default is 0.
//
// Recommended setting (at present): 0
#cmakedefine01 wxUSE_ACCESSIBILITY

// ----------------------------------------------------------------------------
// miscellaneous settings
// ----------------------------------------------------------------------------

// wxSingleInstanceChecker class allows to verify at startup if another program
// instance is running.
//
// Default is 1
//
// Recommended setting: 1 (the class is tiny, disabling it won't save much
// space)
#cmakedefine01 wxUSE_SNGLINST_CHECKER

#cmakedefine01 wxUSE_DRAGIMAGE

#cmakedefine01 wxUSE_IPC
                                // 0 for no interprocess comms
#cmakedefine01 wxUSE_HELP
                                // 0 for no help facility

// Should we use MS HTML help for wxHelpController? If disabled, neither
// wxCHMHelpController nor wxBestHelpController are available.
//
// Default is 1 under MSW, 0 is always used for the other platforms.
//
// Recommended setting: 1, only set to 0 if you have trouble compiling
// wxCHMHelpController (could be a problem with really ancient compilers)
#cmakedefine01 wxUSE_MS_HTML_HELP


// Use wxHTML-based help controller?
#cmakedefine01 wxUSE_WXHTML_HELP

#cmakedefine01 wxUSE_CONSTRAINTS
                                // 0 for no window layout constraint system

#cmakedefine01 wxUSE_SPLINES
                                // 0 for no splines

#cmakedefine01 wxUSE_MOUSEWHEEL
                                // Include mouse wheel support

// Compile wxUIActionSimulator class?
#cmakedefine01 wxUSE_UIACTIONSIMULATOR

// ----------------------------------------------------------------------------
// wxDC classes for various output formats
// ----------------------------------------------------------------------------

// Set to 1 for PostScript device context.
#cmakedefine01 wxUSE_POSTSCRIPT

// Set to 1 to use font metric files in GetTextExtent
#cmakedefine01 wxUSE_AFM_FOR_POSTSCRIPT

// Set to 1 to compile in support for wxSVGFileDC, a wxDC subclass which allows
// to create files in SVG (Scalable Vector Graphics) format.
#cmakedefine01 wxUSE_SVG

// Should wxDC provide SetTransformMatrix() and related methods?
//
// Default is 1 but can be set to 0 if this functionality is not used. Notice
// that currently only wxMSW supports this so setting this to 0 doesn't change
// much for non-MSW platforms (although it will still save a few bytes
// probably).
//
// Recommended setting: 1.
#cmakedefine01 wxUSE_DC_TRANSFORM_MATRIX

// ----------------------------------------------------------------------------
// image format support
// ----------------------------------------------------------------------------

// wxImage supports many different image formats which can be configured at
// compile-time. BMP is always supported, others are optional and can be safely
// disabled if you don't plan to use images in such format sometimes saving
// substantial amount of code in the final library.
//
// Some formats require an extra library which is included in wxWin sources
// which is mentioned if it is the case.

// Set to 1 for wxImage support (recommended).
#cmakedefine01 wxUSE_IMAGE

// Set to 1 for PNG format support (requires libpng). Also requires wxUSE_ZLIB.
#cmakedefine01 wxUSE_LIBPNG

// Set to 1 for JPEG format support (requires libjpeg)
#cmakedefine01 wxUSE_LIBJPEG

// Set to 1 for TIFF format support (requires libtiff)
#cmakedefine01 wxUSE_LIBTIFF

// Set to 1 for TGA format support (loading only)
#cmakedefine01 wxUSE_TGA

// Set to 1 for GIF format support
#cmakedefine01 wxUSE_GIF

// Set to 1 for PNM format support
#cmakedefine01 wxUSE_PNM

// Set to 1 for PCX format support
#cmakedefine01 wxUSE_PCX

// Set to 1 for IFF format support (Amiga format)
#cmakedefine01 wxUSE_IFF

// Set to 1 for XPM format support
#cmakedefine01 wxUSE_XPM

// Set to 1 for MS Icons and Cursors format support
#cmakedefine01 wxUSE_ICO_CUR

// Set to 1 to compile in wxPalette class
#cmakedefine01 wxUSE_PALETTE

// ----------------------------------------------------------------------------
// wxUniversal-only options
// ----------------------------------------------------------------------------

// Set to 1 to enable compilation of all themes, this is the default
#cmakedefine01 wxUSE_ALL_THEMES

// Set to 1 to enable the compilation of individual theme if wxUSE_ALL_THEMES
// is unset, if it is set these options are not used; notice that metal theme
// uses Win32 one
#cmakedefine01 wxUSE_THEME_GTK
#cmakedefine01 wxUSE_THEME_METAL
#cmakedefine01 wxUSE_THEME_MONO
#cmakedefine01 wxUSE_THEME_WIN32
#cmakedefine01 wxUSE_EPOLL_DISPATCHER
#cmakedefine01 wxUSE_SELECT_DISPATCHER
#cmakedefine01 wxUSE_LIBMSPACK


/* --- end common options --- */

#endif // _WX_SETUP_H_

