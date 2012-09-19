# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xeeeeec;0x2e3436;false;false
comment=0x888a85;0x2e3436;false;false
commentline=0x888a85;0x2e3436;false;false
commentdoc=0x888a85;0x2e3436;false;false
number=0x8ae234;0x2e3436;false;false
word=0x729fcf;0x2e3436;false;false
word2=0x729fcf;0x2e3436;false;false
string=0x8ae234;0x2e3436;false;false
character=0x8ae234;0x2e3436;false;false
uuid=0x404080;0x2e3436;false;false
preprocessor=0x007F7F;0x2e3436;false;false
operator=0xfcaf3e;0x2e3436;false;false
identifier=0xeeeeec;0x2e3436;false;false
stringeol=0xeeeeec;0x2e3436;false;false
verbatim=0xd3d7cf;0x2e3436;false;false
regex=0x3465a4;0x2e3436;false;false
commentlinedoc=0x888a85;0x2e3436;false;false
commentdockeyword=0x888a85;0x2e3436;false;true
commentdockeyworderror=0x888a85;0x2e3436;false;false
globalclass=0xeeeeec;0x2e3436;false;false

[keywords]
# all items must be in one line
primary=abs abstract acos anchor asin atan atan2 big bold boolean break byte case catch ceil char charAt charCodeAt class concat const continue cos Date debugger default delete do double else enum escape eval exp export extends false final finally fixed float floor fontcolor fontsize for fromCharCode function goto if implements import in indexOf Infinity instanceof int interface isFinite isNaN italics join lastIndexOf length link log long Math max MAX_VALUE min MIN_VALUE NaN native NEGATIVE_INFINITY new null Number package parseFloat parseInt pop POSITIVE_INFINITY pow private protected public push random return reverse round shift short sin slice small sort splice split sqrt static strike string String sub substr substring sup super switch synchronized tan this throw throws toLowerCase toString toUpperCase transient true try typeof undefined unescape unshift valueOf var void volatile while with

[settings]
# default extension used when saving files
#extension=js

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=//
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=
run=


