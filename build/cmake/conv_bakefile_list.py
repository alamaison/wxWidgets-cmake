#!/usr/bin/python
# -*- coding: utf-8 -*-

'''
Converts 'files.bkl' into a CMake file

Run in $(TOP)/build/cmake/, redirecting output to 'files.cmake', i.e.
you@$(TOP)/build/cmake> python conv_bakefiles.py > files.cmake
'''

import sys
import os
import xml.etree.ElementTree as ET
import re
import cStringIO as StringIO

	


def run(filename=None, debug=False, legacy=False):
	
	if filename is None:
		filename = os.path.normpath(os.path.join(os.path.dirname(__file__), '..', 'bakefiles', 'files.bkl'))
		
	output = StringIO.StringIO()
	
	if debug:
		print >>sys.stderr, "Reading '%s'" % filename
	tree = ET.parse(filename)
	root = root = tree.getroot()

	# Parse the entire XML file into a Python list with the following format
	# sets = [
	# 		(SETNAME, {
	#			'files': ['file1', 'file2', ..., 'fileN'],
	#			'conds': ([(IDENTIFIER1,VALUE1),...,(IDENTIFIERn,VALUEn)], ['file1', 'file2', ..., 'fileN'])
	#		}), ({
	#			[...]
	#		})
	# ]
	# Filenames can also be $(SETNAME) expressions, in which case they reference another set of files instead.
	# Conditions are tuples (and_expressions, filelist), where an 'and_expression' is a list of conditions
	# that are ANDed together. All conditions are equality tests, and are therefore pairs (IDENTIFIER, VALUE)
	# to express the test IDENTIFIER==VALUE.
	sets = []
	all_ids = {}
	all_ops = set()
	r = re.compile(r'(\w+)(.+?)\'(\w*)\'')
	for child in root:
		#print child, child.tag, child.attrib
		if child.tag == 'set':
			#print child.attrib['var']
			#print child.text.split(None)
			#return 1
			#print  child.attrib['hints']
			#assert child.attrib['hint'] == 'files'
			
			filenames = child.text.split(None)
			this_set = {'conds':[], 'files': filenames}
			
			for grandchild in child:
				if grandchild.tag == 'if':
					cond = grandchild
					subconds = cond.attrib['cond'].split(' ')
					condition = []
					for sc in subconds:
						if sc not in ('and', ):
							m = r.match(sc)
							assert m
							identifier, operator, value = m.groups()
							condition.append((identifier,value))
							# Optional output: store list of all conditions and
							# conditions that can apply (useful to find out the
							# different port and build platforms)
							if identifier not in all_ids:
								all_ids[identifier] = set()
							all_ids[identifier].add(value)
							all_ops.add(operator)

					cond_filenames = cond.text.split(None)
					this_set['conds'].append((condition, cond_filenames))
			
			sets.append((child.attrib['var'], this_set))

			
	
	# Now convert this into an imperative form that CMake is friend with.
	# The idea is to create a list with the 'set' command. Then we unroll
	# the conditions, and add the appropriate files using list(APPEND ...)
	
			
	# This output is crap as it does only a language conversion, but no
	# semantics are changed.
	if legacy:
		# Convert $() on the fly to CMake's syntax ${}
		def conv_expansion(token):	
			if token[:2] == '$(' and token[-1] == ')':
				return '${'+token[2:-1]+'}'
			else:
				return token
		for var, s in sets:
			output.write('# %s\n' % var)
			output.write('set(%s\n' % var)
			for filename in s['files']:
				output.write('\t%s\n' % conv_expansion(filename))
			output.write(')\n')
		
			for condition, files in s['conds']:
				output.write('\tif (%s)\n' % ' AND '.join(['"${%s}" STREQUAL "%s"' % (ident, value) for ident,value in condition]))
				output.write('\t\tlist(APPEND %s\n' % var)
				for filename in files:
					output.write('\t\t\t%s\n' % conv_expansion(filename))
				output.write('\t\t)\n')
				output.write('\tendif ()\n')
			
			output.write('\n')

	# Display debug output if required
	if debug:
		print >>sys.stderr, "Showing conditions with identifiers and possible values that they are compared to"
		for id, values in all_ids.iteritems():
			print >>sys.stderr, "%s \n  %s" % (id, ', '.join(["'%s'" % x for x in values]))
		# What we learn from the output:
		# - what I call "port" is called "TOOLKIT" here
		# - there are overlapping concepts expressed differently, namely the "subport" concept.
		#   For wxOSX, there are toolkits 'OSX_CARBON' and 'OSX_COCOA'.
		# 	For wxGTK, there is only the toolkit 'GTK', but that comes with additional checks for
		#      the version using 'TOOLKIT_VERSION'. We could have had 'GTK1', 'GTK2' and 'GTK3'
		#      instead.
		#	=> I need to introduce WXBUILD_SUBPORT to cope with this (and dump WXBUILD_USE_GTK3
		#      that until now between from GTK2 <-> GTK3)
		# - the 'FORMAT' and 'USE_PLUGINS' both relate to an obscure "plugin" functionality
		#   I have never seen in action. I leave them out entirely for the moment.
		# - WXUNIV and USE_GUI are there, I have to add these as WXBUILD_XXX options in CMake.
		# - Operating system families are expressed as 'PLATFORM_XXX'. I also have to add this
		#   into the CMake system. Possible values are 'WIN32', 'MSDOS', 'UNIX' and 'MACOSX'.
		
		
	# After the discussion above, here is what I came up with.
	# - convert TOOLKIT=='GTK' and TOOLKIT_VERSION=='X' to 'TOOLKIT'=='GTKX'
	# - convert all TOOLKIT=='Y' to WXBUILD_PORT='port' (and perhaps WXBUILD_SUBPORT='subport')
	#   using the map below.
	# - also convert all sets names to WXFILES_ZZZ
	# - prefix all names with ${SRC} / ${HDR} (those are defined at the top
	#   of the file as the path to the sources / headers, respectively)
	port_map = {
		'': None, # Dump this as it is, as stated in files.bkl, a horrible and temporary hack
		'MOTIF': 'motif',
		'MSW': 'msw',
		'GTK': 'gtk',
		'GTK1': ('gtk', 'gtk1'),
		'GTK2': ('gtk', 'gtk2'),
		'GTK3': ('gtk', 'gtk3'),
		'COCOA': 'chaud_cacao_cho_cho_cho_chocolat', # WTF?
		'OSX_IPHONE': ('osx', 'osx_iphone'),
		'OSX_CARBON': ('osx', 'osx_carbon'),
		'OSX_COCOA': ('osx', 'osx_cocoa'),
		'DFB': 'dfb',
		'WINCE': 'wince',
		'X11': 'x11',
		'PM': 'os2',
	}
	
	def platform_conv(pf):
		try:
			return {
				'MACOSX': 'osx',
				}[pf]
		except KeyError:
			return pf.lower()

	if not legacy:
	
		output.write('# Preliminary definitions\n')
		output.write('set(SRC ${PROJECT_SOURCE_DIR})\n')
		output.write('set(HDR ${PROJECT_SOURCE_DIR}/include)\n')
		output.write('\n')
		
		first_dirs = set()
		
		# Convert $() on the fly to CMake's syntax ${} and prefix with WXFILES_
		def conv_expansion(token):	
			if token[:2] == '$(' and token[-1] == ')':
				return '${WXFILES_'+token[2:-1]+'}'
			else:
				fd = token.split('/')[0]
				first_dirs.add(fd)
				is_header = token.split('/', 1)[0] == 'wx'
				prefix = '${HDR}/' if is_header else '${SRC}/'
				return prefix + token
				
		
		for var, s in sets:
			output.write('# %s\n' % var)
			output.write('set(WXFILES_%s\n' % var)
			for filename in s['files']:
				output.write('\t%s\n' % conv_expansion(filename))
			output.write(')\n')
		
			for condition, files in s['conds']:
				# Rewrite GTK+VERSION to GTKVERSION
				is_gtk, gtk_version = False, None
				cond = []
				for ident, value in condition:
					if ident == 'TOOLKIT' and value == 'GTK':
						assert not is_gtk
						is_gtk = True
					elif ident == 'TOOLKIT_VERSION':
						assert is_gtk and gtk_version is None
						gtk_version = 1 if value == '' else int(value)
					else:
						cond.append((ident,value))
				if is_gtk:
					if gtk_version is None:
						cond.insert(0, ('TOOLKIT', 'GTK'))
					else:
						cond.insert(0, ('TOOLKIT', 'GTK'+str(gtk_version)))
				
				# Convert the condition to our build system's (TOOLKIT => WXBUILD_PORT)
				conv_cond = []
				for ident, value in cond:
					if ident == 'TOOLKIT':
						conv = port_map[value]
						if conv is None:
							if debug:
								print >>sys.stderr, "Dropped if() condition", ident, '==', value
							continue
						if isinstance(conv, tuple):
							conv_cond.append('"${WXBUILD_PORT}" STREQUAL "%s"' % conv[0])
							conv_cond.append('"${WXBUILD_SUBPORT}" STREQUAL "%s"' % conv[1])
						else:
							conv_cond.append('"${WXBUILD_PORT}" STREQUAL "%s"' % conv)
					elif ident.startswith('PLATFORM'):
						assert '_' in ident
						suffix = ident.split('_')[1]
						base = '"${WXBUILD_PLATFORM}" STREQUAL "%s"' % platform_conv(suffix)
						if value == '0':
							conv_cond.append('NOT (%s)' % base)
						else:
							conv_cond.append(base)
					elif ident in ('USE_GUI', 'WXUNIV'):
						# TODO: convert this to WXBUILD_XXX as appropriate
						assert value in ('0', '1')
						conv_ident = 'WXBUILD_USE_GUI' if ident == 'USE_GUI' else 'WXBUILD_UNIVERSAL'
						conv_cond.append(conv_ident if value == '1' else 'NOT '+conv_ident)
					else:
						if debug:
							print >>sys.stderr, "Dropped if() condition", ident,'==',value
				
				if not conv_cond:
					if debug:
						print >>sys.stderr, "Dropped files under if condition", cond
					continue
					
				output.write('\tif (%s)\n' % ' AND '.join(conv_cond))
				output.write('\t\tlist(APPEND WXFILES_%s\n' % var)
				for filename in files:
					output.write('\t\t\t%s\n' % conv_expansion(filename))
				output.write('\t\t)\n')
				output.write('\tendif ()\n')
			
			output.write('\n')
		
	return output.getvalue()
	
	
def main():
	print run(None, '--debug' in sys.argv, '--legacy' in sys.argv)
	return 0
	
	
if __name__ == '__main__':
	sys.exit(main())
	