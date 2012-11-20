# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x1E1E1E;false;false
commentline=0x747474;0x1E1E1E;false;false
number=0x7ECDFF;0x1E1E1E;false;false
string=0xA18651;0x1E1E1E;false;false
character=0xA18651;0x1E1E1E;false;false
word=0xFFCB4F;0x1E1E1E;true;false
operator=0x98BAC5;0x1E1E1E;false;false
identifier=0xffffff;0x1E1E1E;false;false
backticks=0x30FF00;0x504250;false;false
param=0x009f00;0x1E1E1E;false;false
scalar==0x7ECDFF;0x1E1E1E;false;false




[keywords]
primary=break case continue do done elif else esac eval exit export fi for function goto if in integer return set shift then until while


[settings]
# default extension used when saving files
#extension=sh

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start a column 0 of a line, true uses any
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
run_cmd="./%f"
