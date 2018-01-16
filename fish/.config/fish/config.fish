function t
	tmsu files (tmsu tags | fzf -m)
end

alias ,tm="t | xargs -d '\n' mpv"

alias n="nvim"

alias ,pshell="pipenv shell"
alias ,pinstall="pipenv install"

alias ,serve="python3 -m http.server 8000"

alias ,regex="regex"

function regex
	cd ~/projects/regex101
	python3 -m http.server 8000
end

function ,psitepackages
	cd (python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
end

set -gx PATH ~/bin ~/.local/bin $PATH
