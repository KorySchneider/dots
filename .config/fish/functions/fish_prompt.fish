function fish_prompt --description 'Write out the prompt'
	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	# PWD
	set_color '#b8bb26'
	echo -n (prompt_pwd)
	set_color '#ebdbb2'

	printf '%s ' (__fish_git_prompt)

	echo -n '| '

	set_color '#ebdbb2'
end
