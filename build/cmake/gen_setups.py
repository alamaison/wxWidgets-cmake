#!/usr/bin/python
# -*- coding: utf-8 -*-

'''
This program builds the setup0.cmake.h files for all platforms out of
their respective setup0.h files. It also creates the appropriate 
'wxsetup.cmake' files.
'''

import sys
import os
import argparse
import re
import copy

def get_source_root():
	# Find the root of the source tree (defined relatively to this script)
	try:
		whereami = os.path.dirname(os.path.realpath(__file__))
	except NameError:
		whereami = os.getcwd()
	return os.path.abspath(os.path.join(whereami, '..', '..'))

	
def collect_setups(root):
	# Look for 'setup0.h' files - these contain the various settable options
	# we want to be able to tweak. Actually, finding them all will allow us
	# to build the list of ports that are available.
	ports = {}
	for dirpath, dirnames, filenames in os.walk(os.path.join(root, 'include')):
		for filename in filenames:
			if filename == 'setup0.h':
				port = os.path.basename(dirpath)
				ports[port] = {'name': port, 'setup0.h': os.path.join(dirpath, filename)}
	return ports
		
		
def get_tagged_file(filename):
	# RE that matches "#define CONSTANT VALUE" lines, allowing for spaces between
	# the # sign and the define, and keeping trailing characters (comments, mostly)
	define01_re = re.compile(r'(\s*)#(\s*)define(\s+)(\w+)(\s+)(\w+)(.*)')
	
	# RE that matches "#define CONSTANT" lines, allowing for spaces between
	# the # sign and the define
	define_re = re.compile(r'(\s*)#(\s*)define(\s+)(\w+)(.*)')
	
	# RE that matches comments preceding #defines
	comment_re = re.compile(r'//(.*)')

	tags = {
		'defines01': {},
		'defines': {},
		'comments': {},
		'blanks': {},
	}
	
	lines = []
	
	with file(filename, 'r') as f:
		lines = f.readlines()
		
	for lineno, line in enumerate(lines):

			tag = None
			
			define01_found = define01_re.match(line)
			if define01_found:
				indent1, indent2, spacer1, constant, spacer2, value, trailing = define01_found.groups()
				try:
					tag = tags['defines01'][constant]
				except KeyError:
					tag = {'type': 'define01', 'constant': constant, 'values': {}}
					tags['defines01'][constant] = tag
				
				assert lineno not in tag['values']
				tag['values'][lineno] = {'value': value, 'trailing': trailing.strip()}
			
			else:
				define_found = define_re.match(line)
				if define_found:
					indent1, ident2, spacer, constant, trailing = define_found.groups()
					assert constant not in tags['defines']
					tag = {'type': 'define', 'constant': constant, 'lineno': lineno, 'trailing': trailing.strip()}
					tags['defines'][constant] = tag

				else:
					comment_found = comment_re.match(line)
					if comment_found:
						value = comment_found.groups()[0]
						tag = {'type': 'comment', 'value': value.strip(), 'lineno': lineno}
						assert lineno not in tags['comments']
						tags['comments'][lineno] = tag
						
					else:
						is_blank = len(line.strip()) == 0
						if is_blank:
							tag = {'type': 'blank', 'lineno': lineno}
							assert lineno not in tags['blanks']
							tags['blanks'][lineno] = tag
							
	return lines, tags
	

def associate_comments(port, tags):

	def fetch_comments(lineno):
		comments = []
		cur = lineno-1
		while cur >= 0 and cur in tags['comments']:
			comments.append(tags['comments'][cur]['value'])
			cur -= 1
		return comments
		
	for constant, tag in tags['defines01'].iteritems():
		for lineno, occurrence in tag['values'].iteritems():
			occurrence['comments'] = fetch_comments(lineno)
	for constant, tag in tags['defines'].iteritems():
		tag['comments'] = fetch_comments(tag['lineno'])
			

def get_specifics():
	# For the vast majority of options, the default processing is fine: we take the 
	# constant's name and value, put these in the .cmake file and transform it into
	# a #cmakedefine so as to be set by CMake's configure_file().
	# However, there are options that we should treat specially. Values of the dict
	# indicates the type of special treatment:
	# 'ignore': the option is completely ignored (left as-is in the file).
	# 'cmdline': the option is left as-is in the setup.h file. The CMake
	#    variable will still be created. If the user overrides the value in during
	#    configuration, the new value will be appended to the compiler's command
	#    line using -DwxFOO_BAR=user_set_value
	# NUMBER: (only for options appearing multiple times) Only the NUMBERth option
	#    will be considered (certainly because anyway the other definitions is not
	#    reachable thanks to #if checks)
	# 'discard': wipe the definition away from the output file (by commenting it out)
	# 'addif-VALUE': add the constant to the output if it is absent from the input,
	#    using VALUE as the default.
	return {
		'all': {
			# Although this is available to the CMake user, it is never set directly
			# in the file. What setup.h does is defaulting it to 1 if it has not been
			# specified on the compiler's command line (or by a foreign wrapper).
			'wxUSE_GUI': 'cmdline',
			# This is deprecated and should be left to 1 (the default) for all new
			# programs. This can be overridden by the CMake user, though.
			'wxUSE_UNICODE': 'cmdline',
			# This is automatically set through the use of #if defined ()
			'wxUSE_STD_DEFAULT': 'ignore',
			# This is overridden below for MSW, GTK and OSX. For all other ports, we
			# simply ignore these definitions.
			'wxUSE_WEBVIEW_IE': 'ignore',
			'wxUSE_WEBVIEW_WEBKIT': 'ignore',
			# Except for MSW (and OSX), the 3rd instance is the one to modify
			'wxUSE_GRAPHICS_CONTEXT': 2,
			# Except for MSW, the 2nd instance is the one to modify
			'wxUSE_AUTOID_MANAGEMENT': 1,
			# __WXGTKXXX__ do not make any sense here
			'__WXGTK20__': 'discard',
			'__WXGTK210__': 'discard',
			'__WXGTK218__': 'discard',
			'__WXGTK3__': 'discard',
			# We obviously don't want to do anything with the header guard
			'_WX_SETUP_H_': 'ignore',
			# Add this definition for all platforms that do not define it
			'wxUSE_LIBMSPACK': 'addif-${HAVE_LIB_MSPACK}',
			'wxUSE_SELECT_DISPATCHER': 'addif-${HAVE_SYS_SELECT_H}',
			'wxUSE_EPOLL_DISPATCHER': 'addif-${HAVE_SYS_EPOLL_H}',
		},
		'msw': {
			# Use the first definition under MSW
			'wxUSE_WEBVIEW_IE': 0,
			# Use the second definition under MSW
			'wxUSE_WEBVIEW_WEBKIT': 1,
			# First instance is to be modified
			'wxUSE_GRAPHICS_CONTEXT': 0,
			# First instance is to be modified
			'wxUSE_AUTOID_MANAGEMENT': 0,
			'wxUSE_LIBMSPACK': 'default',
			'wxUSE_SELECT_DISPATCHER': 'default',
			'wxUSE_EPOLL_DISPATCHER': 'default',
		},
		'gtk': {
			# Inverse of MSW
			'wxUSE_WEBVIEW_IE': 1,
			'wxUSE_WEBVIEW_WEBKIT': 0,
		},
		'osx': {
			# Same as GTK
			'wxUSE_WEBVIEW_IE': 1,
			'wxUSE_WEBVIEW_WEBKIT': 0,
			# wxUSE_GRAPHICS_CONTEXT will be overridden to 1 regardless of the previous
			# setting, so there is no use for the user to be able to alter this setting
			# in CMake.
			'wxUSE_GRAPHICS_CONTEXT': 'ignore',
			# Same holds true for wxUSE_STACKWALKER, wxUSE_SELECT_DISPATCHER and
			# wxUSE_EPOLL_DISPATCHER
			'wxUSE_STACKWALKER': 'ignore',
			'wxUSE_SELECT_DISPATCHER': 'ignore',
			'wxUSE_EPOLL_DISPATCHER': 'ignore',
		},
		'univ': {
			# This is actually a bug in the setup0.h file: the constants wxUSE_ALL_THEMES
			# and the individual wxUSE_THEME_XXX are listed twice. Weird. So tell our system
			# to leave the 1st occurrence as-is, while the user will actually modify the 2nd.
			# This will indeed trigger a compiler warning (because we're redefining a constant
			# and the correct solution is to remove entirely the first set - or the 2nd)
			'wxUSE_ALL_THEMES': 1,
			'wxUSE_THEME_GTK': 1,
			'wxUSE_THEME_METAL': 1,
			'wxUSE_THEME_MONO': 1,
			'wxUSE_THEME_WIN32': 1,
		},
	}

	
def run_dump(ports, port_name):
	for port in ports.itervalues():
		if port['name'] != port_name:
			continue
		lines, tags = get_tagged_file(port['setup0.h'])
		print "DEFINES 01"
		for constant, tag in tags['defines01'].iteritems():
			print constant, tag
		print ""
		print "SIMPLE DEFINES"
		for constant, tag in tags['defines'].iteritems():
			print constant, tag
			
		
def run_stats(ports):
	for port in ports.itervalues():
		lines, tags = get_tagged_file(port['setup0.h'])
		print ""
		print "Statistics for '%s':" % port['setup0.h']
		print "               File info : %d lines  (%d comments, %d blanks)" % (len(lines), len(tags['comments']), len(tags['blanks']))
		print "  Num of #define XXX 0|1 : %d" % len(tags['defines01'])
		print "                repeated : %s" % sum([len(x['values']) > 1 for x in tags['defines01'].itervalues()])
		print "   Num of simple defines : %d" % len(tags['defines'])

		
def run(ports):
	
	specifics = get_specifics()
	
	for port in ports.itervalues():
		# Read the file, extract the constants, their values, and their
		# (comment-based) description.
		print "Processing port '%s'" % port['name']
		lines, tags = get_tagged_file(port['setup0.h'])
		associate_comments(port, tags)
		
		# Merge the general specifics with the port's
		port_spec = copy.copy(specifics['all'])
		if port['name'] in specifics:
			for constant, value in specifics[port['name']].iteritems():
				port_spec[constant] = value
				
		# Rework the list by applying the specifics. At the end of this process,
		# we should have a single list in which all constants (whether #define01 
		# or simple #define) are merged, and listed once and only once.
		newtags = {}
		lines_discarded = set()
		for constant, tag in tags['defines01'].iteritems():
			is_cmdline_only = False
			if constant in port_spec:
				action = port_spec[constant]
			else:
				action = 'default'
				
			if action == 'ignore':
				continue
			elif action == 'discard':
				for lineno in tag['values']:
					lines_discarded.add(lineno)
				continue
			elif action == 'cmdline':
				assert len(tag['values']) == 1 # Doesn't make any sense to have this defined more than once if 'cmdline' is wanted
				is_cmdline_only = True
			elif isinstance(action, str) and action.startswith('addif-'):
				# We treat this normally - addif is only meaningful if the constant is *not* in the input file
				pass
			elif action == 'default':
				if len(tag['values']) > 1:
					print tag['values']
					raise ValueError("constant '%s' appears multiple times. Don't know what to do. Data dump is printed above." % constant)
			else:
				assert isinstance(action, int)
				assert action >= 0 and action < len(tag['values'])
				kept_key = tag['values'].keys()[action]
				tag['values'] = {kept_key: tag['values'][kept_key]}

				
			assert len(tag['values']) == 1
			newtag = copy.copy(tag)
			del newtag['values']
			lineno, val = tag['values'].items()[0]
			newtag['value'] = val['value']
			newtag['trailing'] = val['trailing']
			newtag['lineno'] = lineno
			newtag['comments'] = val['comments']
			newtag['cmdline'] = is_cmdline_only
			newtags[constant] = newtag
		
		for constant, tag in tags['defines'].iteritems():
			if constant in port_spec:
				action = port_spec[constant]
				if action == 'ignore':
					continue
				elif action == 'discard':
					lines_discarded.add(tag['lineno'])
					continue
				else:
					raise ValueError("action '%s' is not valid for simple defines" % action)
			assert constant not in newtags
			newtags[constant] = tag
		
		# Add the list of constants that are absent but set to be 'addif-ed'
		# To do this, we find a spot where we can insert stuff, and update
		# the lines accordingly. We must make sure we don't break anything
		# in the constant-line-discard associations while doing so.
		insertion_point = max(max([t['lineno'] for t in newtags.itervalues()]), max(lines_discarded) if lines_discarded else 0) + 1
		addif_prefix = 'addif-'
		addif_prefix_l = len(addif_prefix)
		for constant, action in port_spec.iteritems():
			if constant not in newtags and isinstance(action, str) and action.startswith(addif_prefix):
				value = action[addif_prefix_l:]
				lines.insert(insertion_point, '%s /* (gen_setups.py) Value for %s [Will be replaced just later, you should never see this. If you do, there is a bug in the script]\n' % (value, constant))
				newtags[constant] = {'type': 'define01', 'constant':constant, 'lineno': insertion_point, 'comments': [], 'trailing': '', 'value': value, 'cmdline': False}
				insertion_point += 1
			
		# Make sure we have an equivalence between line numbers and constants
		all_tagged_lines = [t['lineno'] for t in newtags.itervalues()]
		all_tagged_lines_set = set(all_tagged_lines)
		assert len(all_tagged_lines) == len(all_tagged_lines_set)
		
		# Make sure we don't discard lines that we've worked so hard on above
		assert len(all_tagged_lines_set & lines_discarded) == 0
		
		port['lines'] = lines
		port['tags'] = newtags

		# Make a list of tuples (line, discard, tag) with each line of the file, and
		# what we should do with it (keep it? associate special behaviour ?)
		tags_by_lineno = {t['lineno']:t for t in newtags.itervalues()}
		port['tagged_lines'] = [(l, i in lines_discarded, tags_by_lineno[i] if i in tags_by_lineno else None) for i,l in enumerate(lines)]
		
		
	print "Merging common options"
	sets = [set(port['tags'].keys()) for port in ports.itervalues()]
	
	# This is the list of all distinct options, across all ports
	all = reduce(lambda x,y: x|y, sets, set())
	
	# The list of options common to all ports
	common = reduce(lambda x,y: x&y, sets)
	assert common <= all # Obviously
	
	# The list of common options that have equal default values
	common_with_values = set()
	for constant in common:
		values = set()
		names = set()
		helps = set()
		for p in ports.itervalues():
			assert constant in p['tags'] # If this ever fails, you probably have a short TTL as the universe is collapsing
			tag = p['tags'][constant]
			if 'value' in tag:
				values.add(tag['value'])
				names.add(p['name'])
			helphash = tag['trailing']+'\n'.join(tag['comments'])
			helps.add(helphash)
		if len(values) == 1:
			common_with_values.add(constant)
		if len(helps) != 1:
			print "WARNING: descriptions differ between ports for constant '%s'" % constant
			# Do we need to assert() here and bail out ? Because I'm assuming later that any help
			# string (from any port, that is) can be used to describe the option.
	assert common_with_values <= common # Indeed
			
	# Collect some stats for potential display
	usage = {}
	for constant in all:
		used_by = set()
		for p in ports.itervalues():
			if constant in p['tags']:
				used_by.add(p['name'])
		assert used_by
		usage[constant] = used_by
	
	# Helper function to return a filename inside ${TOP}/build/cmake,
	# whereby the container directory is created if needed.
	# arguments are passed to os.path.join() after get_source_root()
	def get_filename_create_dir(*args):
		filename = os.path.join(get_source_root(), 'build', 'cmake', *args)
		dirname = os.path.dirname(filename)
		if not os.path.isdir(dirname):
			os.makedirs(dirname)
		return filename
		
	# Now we can (finally) create the files
	# We'll create one huge file containing all help strings that are shared by at 
	# least 2 ports. This common file will also host all common options with the
	# same default values for all ports.
	# Then each port will contain a file with its specific options/values and the
	# help strings for options that are unique to this port.
	common_dirname = 'setups'
	
	def write_helps(f, port, constants):
		for constant in constants:
			helpvar = 'WXSETUP_%s_HELP' % constant
			tag = port['tags'][constant]
			if len(tag['comments']):
				help = '\\n'.join(reversed(tag['comments']))
			else:
				help = tag['trailing'].strip().lstrip('/').lstrip()
				if len(help) == 0:
					help = 'Toggle '+constant
			# escape quotes in help string, abusing repr(), see:
			# https://mail.python.org/pipermail/python-list/2003-April/235714.html
			help = '"%s"' % help.replace('"', '\\"')#'"' + help.replace('"', '') + '"'
			f.write('set(%s %s)\n\n' % (helpvar, help))
			
	def write_values(f, port, constants):
		for constant in constants:
			tag = port['tags'][constant]
			var = 'WXSETUP_%s' % constant
			helpvar = var+'_HELP'
			if tag['value'] in ('0', '1'):
				value = 'ON' if tag['value'] == '1' else 'OFF'
			else:
				value = tag['value']
			f.write('option(%s "${%s}" %s)\n' % (var, helpvar, value))
		f.write('\n')
		#for constant in constants:
			#var = 'WXSETUP_%s' % constant
			#f.write('mark_as_advanced(%s)\n' % var)
			
	common_cmake_filename = get_filename_create_dir(common_dirname, 'wxsetup.cmake')
	prefix_strip_len = len(get_source_root())+1
	anyport = ports.values()[0]
	with file(common_cmake_filename, 'wb') as f:
		write_helps(f, anyport, common_with_values)
		write_values(f, anyport, common_with_values)
		f.write('\nset(WXBUILD_ALL_OPTIONS\n')
		for constant in common_with_values:
			f.write('\t%s\n' % constant)
		f.write(')\n')
	print "Created '%s'" % common_cmake_filename[prefix_strip_len:]

	for port in ports.itervalues():
		port_cmake_filename = get_filename_create_dir(common_dirname, port['name'], 'wxsetup.cmake')
		constants = set(port['tags'].keys()) - common_with_values
		with file(port_cmake_filename, 'wb') as f:
			write_helps(f, port, constants)
			write_values(f, port, constants)
			f.write('\nlist(APPEND WXBUILD_ALL_OPTIONS\n')
			for constant in constants:
				f.write('\t%s\n' % constant)
			f.write(')\n')
		print "Created '%s'" % port_cmake_filename[prefix_strip_len:]
		
		port_setup_filename = get_filename_create_dir(common_dirname, port['name'], 'setup0.cmake.h')
		with file(port_setup_filename, 'wb') as f:
			for line, discard, tag in port['tagged_lines']:
				if discard:
					f.write('/* %s */ /* (gen_setups.py) Definition discarded */\n' % line.strip())
				elif tag:
					if tag['cmdline']:
						# Keep the line, but tag has been added to wxsetup.cmake
							f.write('%s /* %s */\n' % (line.strip(), '(gen_setups.py) Should be overridden on the command-line only, not here'))
					elif tag['type'] == 'define01':
						if tag['value'] in ('0', '1') or (tag['value'].startswith('${') and tag['value'].endswith('}')):
							f.write('#cmakedefine01 %s\n' % tag['constant'])
						else:
							f.write('%s /* %s */\n' % (line.strip(), '(gen_setups.py) Value depends on other parameters, change these instead'))
					elif tag['type'] == 'define':
						# Nothing special to do ?
						f.write(line)
				else:
					f.write(line)
		print "Created '%s'" % port_setup_filename[prefix_strip_len:]
		
		
def main():
	
	parser = argparse.ArgumentParser()
	parser.add_argument('--stats', action='store_true', help='Print statistics for all files')
	parser.add_argument('--dump', metavar='PORT', help='Dumps all information found in the setup0.h file of port PORT')
	
	args = parser.parse_args()
	
	root = get_source_root()
	ports = collect_setups(root)
	
	if args.stats:
		run_stats(ports)
	
	elif args.dump:
		run_dump(ports, args.dump)
		
	else:
		run(ports)
		
		
	return 0
   

		
if __name__ == '__main__':
	sys.exit(main())
