# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0xffffff;0x000000;false;false
comment=comment;0x000000;false;false
comment_line_bang=0x9933cc;0x000000;false;false;
number=0xccff33;0x000000;false;false
string=0x66ff00;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
stringeol=0x66ff00;0x000000;false;false
keyword=0xff6600;0x000000;true;false
stdoperator=0x0080c0;0x000000;false;false
attribute=0x8080ff;0xffffcc;false;false
stdfunction=0x339999;0x000000;true;false
stdpackage=0x800000;0x000000;false;false
stdtype=0x66ff00;0x000000;false;false
userword=0xb5e71f;0x000000;true;false

[keywords]
# all items must be in one line
keywords=access after alias all architecture array assert attribute begin block body buffer bus case component configuration constant disconnect downto else elsif end entity exit file for function generate generic group guarded if impure in inertial inout is label library linkage literal loop map new next null of on open others out package port postponed procedure process pure range record register reject report return select severity shared signal subtype then to transport type unaffected units until use variable wait when while with
operators=abs and mod nand nor not or rem rol ror sla sll sra srl xnor xor
attributes=left right low high ascending image value pos val succ pred leftof rightof base range reverse_range length delayed stable quiet transaction event active last_event last_active last_value driving driving_value simple_name path_name instance_name
std_functions=now readline read writeline write endfile resolved to_bit to_bitvector to_stdulogic to_stdlogicvector to_stdulogicvector to_x01 to_x01z to_UX01 rising_edge falling_edge is_x shift_left shift_right rotate_left rotate_right resize to_integer to_unsigned to_signed std_match to_01
std_packages=std ieee work standard textio std_logic_1164 std_logic_arith std_logic_misc std_logic_signed std_logic_textio std_logic_unsigned numeric_bit numeric_std math_complex math_real vital_primitives vital_timing
std_types=boolean bit character severity_level integer real time delay_length natural positive string bit_vector file_open_kind file_open_status line text side width std_ulogic std_ulogic_vector std_logic std_logic_vector X01 X01Z UX01 UX01Z unsigned signed
userwords=

[settings]
# default extension used when saving files
#extension=vhd

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=--
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


