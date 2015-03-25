A CMake build system for wxWidgets
==================================

This is a new build system for wxWidgets based on CMake instead of autotools/bakefiles/etc.

The goal is to provide a unified build system on all platforms/ports. This should not only ease the porting of applications from one platform to another, but also help with the maintenance of platform-specific files (e.g. MSVC projects).

Quick how to:
------------------------

Dummy workflow (tarball of wxWidgets)
- clone in /some/dir =
- unpack wxWidgets in /some/dir as well
- [optional] adjust ./git/info/exclude as desribed in build/cmake/doc/technote-....txt
- (x) cd into build/cmake
- run gen_setups.py
- run conv_bakefile_list.py > files.cmake
- create build dir, e.g. _build-msvc-x86/
- cmake configure, generate
- build with your tool

Nice workflow with submodules:
- clone wxWidgets and git submodule add wxWidgets-cmake
- or is it the other way around?
- when you're done, go back to step (x) above
Note: help would be appreciated :)

Current status (updated)
------------------------

The system can now be considered in late alpha/early beta stage, as all core libraries (base, core, net, adv, aui, etc.) and embedded dependencies (zlib, png, etc.) are functional on at least MSW and GTK, using either Windows or Linux. A dozen samples (at least one per core library) are also included.

The following OS/compiler/port/CPU have been tested:
- Win7/wxMSW/MSVC12/x64      -> OK 
- Debian 7/wxGTK/Linux/x64   -> OK, both with GTK2 and GTK3
- Win7/wxGTK/Cygwin/x86      -> OK (but only tested GTK2)
- Win7/wxMSW/MinGW/x86       -> mostly OK (had to patch MinGW)
- OSX 10.8/wxOSX-cocoa/x64   -> not ready (see roadmap)
- Debian 7/wxGTK/Linux/ARM   -> my QEMU emulator is so slow it is still installing the OS

Now, keep in mind this is a still an alpha and 'OK' means: the code compiles, links and runs but there is still quite a lot of functionalities to test, that are currently not covered by the few samples.


How to use
----------

You must first run gen_setups.py and conv_bakefile_lists.py in ${TOP}/build/cmake. This will generate the appropriate files that CMake will include. These files will hopefully be generated once and kept under version control, as the importation is a one-time operation. (e.g. adding new files would require modifying ${TOP}/build/cmake/files.cmake instead of ${TOP}/build/bakefiles/files.bkl)

You should then create a directory (e.g. ${TOP}/linux-gtk) and run 'ccmake ..' or 'cmake-gui ..' from there.

After running the initial Configuration step, there are two main categories you can modify:
- WXBUILD_XXX: these are the "general" settings, such as the port to build, whether you want to build the samples, and so on.
- WXSETUP_XXX: these are all options that you could modify by editing 'setup.h' on Windows, or using '--use-xxx' and/or '--with-yyy' options to 'configure' on other platforms.

Options that you have selected and that are not possible to build due to missing dependencies generate warnings, which you can turn off (see the WXWARNS_XXX options).

How it works
------------

The top-level CMakeLists.txt runs, in that order:
- wxwidgets.cmake: contains all platform/port independent settings
- init_platform.cmake: contains all platform/compiler related settings
- init_port.cmake: select a default port if run for the first time
- ${port}/wxsetup.cmake: read all port-specific options (WXSETUP_XXX)
- wxconfigure.cmake: the configuration utilities (check system capabilities, etc.)
- the setup.h generation based on the detected features and the selected options
- the subdirectories' CMakeLists.txt for the various modules (wxBase, wxCore, etc.)

Roadmap
-------

Here are some items in my top priority list - not necessarily sorted, but that need to be done before the system goes into real beta.

1) Integrate the wxOSX port, with its 3 variants (Carbon, Cocoa and iPhone)

2) Support universal (wxUNIV=1) builds for all relevant ports

3) Support more options (and add corresponding checks), such as printing

4) Add support for more ports, platforms, compilers, and combinations thereof.

5) wxPython !

Open questions
--------------

- Do we need to support *all* ports ? Win16, MS-DOS ?
- Same question for variants: what about GTK1 ? MacOS "classic" ?
- Does wxUSE_UNICODE=0 make any sense ?


Problems with the current implementation
----------------------------------------

* The ports and corresponding setup.h template files are loaded from setup0.h files that can be found in the source tree. Although Windows builds actually use these files, I'm not sure they are used at all on other systems (i.e. configure generates its output based on setup.h.in). These setup0.h indeed lack many options, and those options get injected by wxconfigure.cmake. Not all of them are, here be dragons.

* Probably many more :)
