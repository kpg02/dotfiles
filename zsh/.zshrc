if [[ $(uname -s) == "Darwin" ]];then
    export ZSH="/Users/$USER/.oh-my-zsh"
else
    export ZSH="/home/$USER/.oh-my-zsh"
fi

ZSH_THEME="muse"
HIST_STAMPS="dd/mm/yyyy"
plugins=(git)
source $ZSH/oh-my-zsh.sh
