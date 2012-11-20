# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false
commentline=0x9933cc;0x000000;false;false
number=0xccff33;0x000000;false;false
string=0x66ff00;0x000000;false;false
character=0x66ff00;0x000000;false;false
word=0xff6600;0x000000;true;false
global=0xffcc00;0x000000;false;false
symbol=0x339999;0x000000;false;false
classname=0xffffff;0x000000;true;false
defname=0xffffff;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
modulename=0xedf8f9;0x000000;true;false
backticks=0x000000;0xcccc33;false;false
instancevar=0xffffff;0x000000;false;true
classvar=0xffffff;0x000000;true;true
heredelim=0xff6600;0xff0000;false;false
worddemoted=0xffffff;0x000000;false;false
stdin=0xffffff;0x000000;false;false
stdout=0xffffff;0x000000;false;false
stderr=0xffffff;0x000000;false;false
datasection=0x600000;0xfff0d8;false;false
regex=0x44b4cc;0x000000;false;false
here_q=0x339999;0x000000;false;false
here_qq=0x339999;0x000000;true;false
here_qx=0x339999;0x000000;false;true
string_q=0x66ff00;0x000000;false;false
string_qq=0x66ff00;0x000000;false;false
string_qx=0x66ff00;0x000000;false;false
string_qr=0x66ff00;0x000000;false;false
string_qw=0x66ff00;0x000000;false;false
upper_bound=0xffffff;0x000000;false;false
error=0xffffff;0x000000;false;false
pod=0x772cb7;0x070707;false;false

[keywords]
# all items must be in one line
primary=__FILE__ load define_method attr_accessor attr_writer attr_reader and def end in or self unless __LINE__ begin defined? ensure module redo super until BEGIN break do false next rescue then when END case else for nil include require retry true while alias class elsif if not return undef yield


[settings]
# default extension used when saving files
#extension=rb

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
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
compiler=ruby -c "%f"
run_cmd=ruby "%f"
