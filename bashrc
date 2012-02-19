# Defined prompt only if is not already defined
if [ ! -z "$PS1" ]; then
	echo "== Define the prompt"
	source .bashrc.d/bashrc_prompt
fi


