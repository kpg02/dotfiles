#!/bin/bash
# Name: autoinstall.sh
# Purpose: Install everything I need and my configs on my macbook

readonly ARG1="$1"
if [[ $(pwd) == $HOME/.dotfiles ]]; then
    readonly SAFEFOLDER=false
else
    readonly SAFEFOLDER=true
fi

function git_alias() {
    git config --global alias.s "status -s -b"
    git config --global alias.lg "log --oneline --decorate --all --graph"
    git config --global core.pager cat
}

function ssh_config() {
    ssh-keygen -t rsa -b 4096 -C "kevinpigar@protonmail.com"
    eval "$(ssh-agent -s)"
    echo 'Host *'> ~/.ssh/config
    echo  '  AddKeysToAgent yes' >> ~/.ssh/config
    echo  '  UseKeychain yes' >> ~/.ssh/config
    echo  '  IdentityFile ~/.ssh/id_rsa '>> ~/.ssh/config
    ssh-add -K ~/.ssh/id_rsa
    pbcopy < ~/.ssh/id_rsa.pub
}

function git_push() {
    if [[ $SAFEFOLDER == false ]]; then
        git remote remove origin
        git remote add origin git@github.com:kpg02/dotfiles.git
        git push -u origin master
    else
        return 1
    fi
}

function git_clone(){
    if [[ $SAFEFOLDER == true ]]; then
        if [[ -d ~/.config/nvim ]]; then
            rm -rf ~/.config/nvim
        fi

        if [[ -d ~/.dotfiles ]]; then
            rm -rf ~/.dotfiles
        fi

        mkdir -p ~/.dotfiles
        mkdir -p ~/.config/nvim

        rm ~/.zshrc

        git clone https://github.com/kpg02/dotfiles ~/.dotfiles
        ln -s ~/.dotfiles/.zshrc ~/.zshrc
        ln -s ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
        ln -s ~/.dotfiles/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
    else
        echo "Estás dentro de $HOME/.dotfiles"
        return 1
    fi
}


function full_macos() {
    # Check if xcode is installed
    if [[ -d $(xcode-select -p 2>/dev/null) ]]; then

        # Check if the script is being ran on ~/.dotfiles
        if [[ $SAFEFOLDER == false ]]; then
            # If it is, exit
            echo "Estás ejecutando esto en la carpeta equivocada"
            exit 1
        fi
        echo "Estás a punto de ejecutar el script de instalación"
        read -n 1 -s -r -p "Pulsa cualquier tecla para continuar"

        # Check if brew is installed and do it if it isn't, else update it
        if [[ $(command -v brew) == "" ]]; then
            echo "Instalando Homebrew"
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        else
            echo "Actualizando Homebrew"
            brew update
            brew upgrade
        fi

        # Accept xcode license
        sudo xcodebuild -license accept

        # Install needed programs
        brew install ripgrep python3 gpg nvim nodejs git wget checkstyle lua tree

        # Upgrade pip3 and install needed modules
        sudo pip3 install --upgrade pip
        sudo pip3 install isort python-language-server flake8 yapf autopep8 neovim

        # Install needed node modules
        sudo npm i -g yarn neovim prettier fixjson eslint xmllint csslint typescript vim-language-server markdownlint stylelint stylelint-config-standard

        # Clean folders if they exist and clone configs
        git_clone

        # Install vim-plug for neovim
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

        # Read name and email to put it to git config
        echo "\nLos siguientes datos son para git\nNombre:"
        read nombre
        echo "email:"
        read email
        git config --global user.name "$nombre"
        git config --global user.email "$email"
        git_alias

        # Put nvim as default editor and insatll oh-my-zsh
        export EDITOR=nvim
        export VISUAL=nvim
        if [[ ! -d ~/.oh-my-zsh ]]; then
            export ZSH=
            sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        fi


    else
        echo "Command Line Tools no están instaladas"
    fi

}

# ARGS start

case $ARG1 in
    -a|--alias) git_alias
        echo "\nAlias añadidos"
        echo "Ahora se puede usar git lg y git s\n"
        exit 0
        ;;
    -c|--clone) echo "\nClonando...\n"
        git_clone
        if [[ $? != 1 ]]; then
            echo "\nClonado con éxito"
        else
            echo "\nSal de ~/.dotfiles para clonar"
            echo "No se completó el clonado"
        fi
        exit 0
        ;;
    -p|--push) echo "\nAñadiendo nuevo remote por ssh...\n"
        git_push
        if [[ $? != 1 ]]; then
            echo "\nNuevo remote añadido y push hecho"
        else
            echo "\n No estás en ~/.dotfiles"
            echo "No se añadío el nuevo remote por ssh"
        fi
        exit 0
        ;;
    -s|--ssh) ssh_config
        echo "\n Clave creada y copiada al portapapeles"
        exit 0
        ;;

    -h|--help)
        echo "\n Esta es una lista de todos los argumentos que se pueden pasasr"
        echo "-a | --alias  Añade los alias que uso para git log y git status junto a establecer cat como pager"
        echo "-c | --clone  Clona y hace un symlink de los archivos de configuración de zsh y nvim"
        echo "-p | --push   Añade el remote por ssh y hace un push"
        echo "-s | --ssh    Crea una clave ssh y copia la clave pública al portapapeles"
        echo "-h | --help   Muestra esta lista de argumentos\n"

    esac


# ARGS end



function main() {
    if [[ $(uname -s) == Darwin ]]; then
        full_macos
    else
        echo "Aún no está hecho el script para este SO"
    fi
}

main
