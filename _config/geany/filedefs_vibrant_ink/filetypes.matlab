# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=comment;0x000000;false;false
command=0x66ff00;0x000000;true;false
number=0xccff33;0x000000;false;false
keyword=0xff6600;0x000000;true;false
string=0x66ff00;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
doublequotedstring=0x66ff00;0x000000;false;false

[keywords]
# all items must be in one line
primary=break case catch continue else elseif end for function global if otherwise persistent return switch try while

[settings]
# default extension used when saving files
#extension=m

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=%
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
run_cmd=octave -q "%f"
