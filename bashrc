# Defined prompt only if is not already defined
if [ ! -z "$PS1" ]; then
        if [ -r ~/.bashrc.d/bashrc_prompt_1line ]; then
	        # source ~/.bashrc.d/bashrc_prompt
	        source ~/.bashrc.d/bashrc_prompt_1line
	fi
fi

# Global aliases
if [ -r ~/.bashrc.d/bashrc_aliases ]; then
        source ~/.bashrc.d/bashrc_aliases
fi
