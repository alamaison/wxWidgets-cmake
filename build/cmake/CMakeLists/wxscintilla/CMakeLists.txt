set(LIB_NAME wxscintilla)

set(LIB_SRC_DIR "${WX_SOURCE_DIR}/src/stc/scintilla")

add_definitions(-D__WX__ -DSCI_LEXER)

include_directories("${LIB_SRC_DIR}/include" "${LIB_SRC_DIR}/lexlib")

set(LIB_SRC_LEXERS
	${LIB_SRC_DIR}/lexers/LexA68k.cxx
	${LIB_SRC_DIR}/lexers/LexAbaqus.cxx
	${LIB_SRC_DIR}/lexers/LexAda.cxx
	${LIB_SRC_DIR}/lexers/LexAPDL.cxx
	${LIB_SRC_DIR}/lexers/LexAsm.cxx
	${LIB_SRC_DIR}/lexers/LexAsn1.cxx
	${LIB_SRC_DIR}/lexers/LexASY.cxx
	${LIB_SRC_DIR}/lexers/LexAU3.cxx
	${LIB_SRC_DIR}/lexers/LexAVE.cxx
	${LIB_SRC_DIR}/lexers/LexAVS.cxx
	${LIB_SRC_DIR}/lexers/LexBaan.cxx
	${LIB_SRC_DIR}/lexers/LexBash.cxx
	${LIB_SRC_DIR}/lexers/LexBasic.cxx
	${LIB_SRC_DIR}/lexers/LexBullant.cxx
	${LIB_SRC_DIR}/lexers/LexCaml.cxx
	${LIB_SRC_DIR}/lexers/LexCLW.cxx
	${LIB_SRC_DIR}/lexers/LexCmake.cxx
	${LIB_SRC_DIR}/lexers/LexCOBOL.cxx
	${LIB_SRC_DIR}/lexers/LexCoffeeScript.cxx
	${LIB_SRC_DIR}/lexers/LexConf.cxx
	${LIB_SRC_DIR}/lexers/LexCPP.cxx
	${LIB_SRC_DIR}/lexers/LexCrontab.cxx
	${LIB_SRC_DIR}/lexers/LexCsound.cxx
	${LIB_SRC_DIR}/lexers/LexCSS.cxx
	${LIB_SRC_DIR}/lexers/LexD.cxx
	${LIB_SRC_DIR}/lexers/LexDMAP.cxx
	${LIB_SRC_DIR}/lexers/LexECL.cxx
	${LIB_SRC_DIR}/lexers/LexEiffel.cxx
	${LIB_SRC_DIR}/lexers/LexErlang.cxx
	${LIB_SRC_DIR}/lexers/LexEScript.cxx
	${LIB_SRC_DIR}/lexers/LexFlagship.cxx
	${LIB_SRC_DIR}/lexers/LexForth.cxx
	${LIB_SRC_DIR}/lexers/LexFortran.cxx
	${LIB_SRC_DIR}/lexers/LexGAP.cxx
	${LIB_SRC_DIR}/lexers/LexGui4Cli.cxx
	${LIB_SRC_DIR}/lexers/LexHaskell.cxx
	${LIB_SRC_DIR}/lexers/LexHTML.cxx
	${LIB_SRC_DIR}/lexers/LexInno.cxx
	${LIB_SRC_DIR}/lexers/LexKix.cxx
	${LIB_SRC_DIR}/lexers/LexKVIrc.cxx
	${LIB_SRC_DIR}/lexers/LexLaTeX.cxx
	${LIB_SRC_DIR}/lexers/LexLisp.cxx
	${LIB_SRC_DIR}/lexers/LexLout.cxx
	${LIB_SRC_DIR}/lexers/LexLua.cxx
	${LIB_SRC_DIR}/lexers/LexMagik.cxx
	${LIB_SRC_DIR}/lexers/LexMarkdown.cxx
	${LIB_SRC_DIR}/lexers/LexMatlab.cxx
	${LIB_SRC_DIR}/lexers/LexMetapost.cxx
	${LIB_SRC_DIR}/lexers/LexMMIXAL.cxx
	${LIB_SRC_DIR}/lexers/LexModula.cxx
	${LIB_SRC_DIR}/lexers/LexMPT.cxx
	${LIB_SRC_DIR}/lexers/LexMSSQL.cxx
	${LIB_SRC_DIR}/lexers/LexMySQL.cxx
	${LIB_SRC_DIR}/lexers/LexNimrod.cxx
	${LIB_SRC_DIR}/lexers/LexNsis.cxx
	${LIB_SRC_DIR}/lexers/LexOpal.cxx
	${LIB_SRC_DIR}/lexers/LexOScript.cxx
	${LIB_SRC_DIR}/lexers/LexOthers.cxx
	${LIB_SRC_DIR}/lexers/LexPascal.cxx
	${LIB_SRC_DIR}/lexers/LexPB.cxx
	${LIB_SRC_DIR}/lexers/LexPerl.cxx
	${LIB_SRC_DIR}/lexers/LexPLM.cxx
	${LIB_SRC_DIR}/lexers/LexPO.cxx
	${LIB_SRC_DIR}/lexers/LexPOV.cxx
	${LIB_SRC_DIR}/lexers/LexPowerPro.cxx
	${LIB_SRC_DIR}/lexers/LexPowerShell.cxx
	${LIB_SRC_DIR}/lexers/LexProgress.cxx
	${LIB_SRC_DIR}/lexers/LexPS.cxx
	${LIB_SRC_DIR}/lexers/LexPython.cxx
	${LIB_SRC_DIR}/lexers/LexR.cxx
	${LIB_SRC_DIR}/lexers/LexRebol.cxx
	${LIB_SRC_DIR}/lexers/LexRuby.cxx
	${LIB_SRC_DIR}/lexers/LexRust.cxx
	${LIB_SRC_DIR}/lexers/LexScriptol.cxx
	${LIB_SRC_DIR}/lexers/LexSmalltalk.cxx
	${LIB_SRC_DIR}/lexers/LexSML.cxx
	${LIB_SRC_DIR}/lexers/LexSorcus.cxx
	${LIB_SRC_DIR}/lexers/LexSpecman.cxx
	${LIB_SRC_DIR}/lexers/LexSpice.cxx
	${LIB_SRC_DIR}/lexers/LexSQL.cxx
	${LIB_SRC_DIR}/lexers/LexSTTXT.cxx
	${LIB_SRC_DIR}/lexers/LexTACL.cxx
	${LIB_SRC_DIR}/lexers/LexTADS3.cxx
	${LIB_SRC_DIR}/lexers/LexTAL.cxx
	${LIB_SRC_DIR}/lexers/LexTCL.cxx
	${LIB_SRC_DIR}/lexers/LexTCMD.cxx
	${LIB_SRC_DIR}/lexers/LexTeX.cxx
	${LIB_SRC_DIR}/lexers/LexTxt2tags.cxx
	${LIB_SRC_DIR}/lexers/LexVB.cxx
	${LIB_SRC_DIR}/lexers/LexVerilog.cxx
	${LIB_SRC_DIR}/lexers/LexVHDL.cxx
	${LIB_SRC_DIR}/lexers/LexVisualProlog.cxx
	${LIB_SRC_DIR}/lexers/LexYAML.cxx
)

set(LIB_SRC_LEXLIB
	${LIB_SRC_DIR}/lexlib/Accessor.cxx
	${LIB_SRC_DIR}/lexlib/CharacterCategory.cxx
	${LIB_SRC_DIR}/lexlib/CharacterSet.cxx
	${LIB_SRC_DIR}/lexlib/LexerBase.cxx
	${LIB_SRC_DIR}/lexlib/LexerModule.cxx
	${LIB_SRC_DIR}/lexlib/LexerNoExceptions.cxx
	${LIB_SRC_DIR}/lexlib/LexerSimple.cxx
	${LIB_SRC_DIR}/lexlib/PropSetSimple.cxx
	${LIB_SRC_DIR}/lexlib/StyleContext.cxx
	${LIB_SRC_DIR}/lexlib/WordList.cxx
)

set(LIB_SRC_BASE
	${LIB_SRC_DIR}/src/AutoComplete.cxx
	${LIB_SRC_DIR}/src/CallTip.cxx
	${LIB_SRC_DIR}/src/CaseConvert.cxx
	${LIB_SRC_DIR}/src/CaseFolder.cxx
	${LIB_SRC_DIR}/src/Catalogue.cxx
	${LIB_SRC_DIR}/src/CellBuffer.cxx
	${LIB_SRC_DIR}/src/CharClassify.cxx
	${LIB_SRC_DIR}/src/ContractionState.cxx
	${LIB_SRC_DIR}/src/Decoration.cxx
	${LIB_SRC_DIR}/src/Document.cxx
	${LIB_SRC_DIR}/src/Editor.cxx
	${LIB_SRC_DIR}/src/ExternalLexer.cxx
	${LIB_SRC_DIR}/src/Indicator.cxx
	${LIB_SRC_DIR}/src/KeyMap.cxx
	${LIB_SRC_DIR}/src/LineMarker.cxx
	${LIB_SRC_DIR}/src/PerLine.cxx
	${LIB_SRC_DIR}/src/PositionCache.cxx
	${LIB_SRC_DIR}/src/RESearch.cxx
	${LIB_SRC_DIR}/src/RunStyles.cxx
	${LIB_SRC_DIR}/src/ScintillaBase.cxx
	${LIB_SRC_DIR}/src/Selection.cxx
	${LIB_SRC_DIR}/src/Style.cxx
	${LIB_SRC_DIR}/src/UniConversion.cxx
	${LIB_SRC_DIR}/src/ViewStyle.cxx
	${LIB_SRC_DIR}/src/XPM.cxx
)

set(LIB_SRC
	${LIB_SRC_BASE} ${LIB_SRC_LEXERS} ${LIB_SRC_LEXLIB}
)

add_library(${LIB_NAME} STATIC
	${LIB_SRC}
)

if ((NOT WIN32) AND (CMAKE_SIZEOF_VOID_P EQUAL 8))
	# 64 bit POSIX builds need -fPIC, otherwise you get the "relocation 
	# R_X86_64_32 against `.anysymbol' can not be used when making a 
	# shared object; recompile with -fPIC" error
	set_target_properties(${LIB_NAME} PROPERTIES COMPILE_FLAGS "-fPIC")
endif ()


