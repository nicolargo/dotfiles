# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=default
comment=comment
number=0xccff33;0x000000;false;false
string=0x66ff00;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
cpuinstruction=0xff6600;0x000000;true;false
mathinstruction=0x0080c0;0x000000;true;false
register=0x8080ff;0xfffcc;true;false
directive=0x339999;0x000000;true;false
directiveoperand=0x66ff00;0x000000;false;false
commentblock=0x9933cc;0x000000;false;false
character=0x808000;0x000000;false;false
stringeol=0x66ff00;0x000000;false;false
extinstruction=0xedf8f9;0x000000;false;false

[keywords]
# all items must be in one line
# this is by default a very simple instruction set; not of Intel or so
instructions=hlt lad spi add sub mul div jmp jez jgz jlz swap jsr ret pushac popac addst subst mulst divst lsa lds push pop cli ldi ink lia dek ldx
registers=
directives=org list nolist page equivalent word text


[settings]
# default extension used when saving files
#extension=asm

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=;
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
compiler=nasm "%f"

