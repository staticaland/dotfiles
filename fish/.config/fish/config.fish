function t
	tmsu files (tmsu tags | fzf -m)
end

alias n="nvim"

alias ,pshell="pipenv shell"
alias ,pinstall="pipenv install"

function ,psitepackages
	cd (python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
end

set -gx PATH ~/bin ~/.local/bin $PATH
