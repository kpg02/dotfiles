if [[ $1 == -push ]]; then
	if [[ $(pwd) == /Users/$USER/.dotfiles ]]; then
		git remote remove origin
		git remote add origin git@github.com:kpg02/dotfiles.git
		git push origin master
	else
		echo No estás en .dotfiles
	fi

	exit 0
fi


if [[ $1 == -update ]]; then
	git pull

	rm ~/.zshrc
	hln .zshrc ~/.zshrc

	rm ~/.config/nvim/init.vim
	hln .config/nvim/init.vim ~/.config/nvim/init.vim

	rm ~/.config/nvim/coc-settings.json
	hln .config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

	exit 0
fi

if [[ $1 == -clone ]]; then
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
	hln ~/.dotfiles/.zshrc ~/.zshrc
	hln ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim 
	hln ~/.dotfiles/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

	exit 0
fi

if [[ $1 == -ssh ]]; then
	ssh-keygen -t rsa -b 4096 -C "$2"
	eval "$(ssh-agent -s)"
	echo Host * > ~/.ssh/config
	echo  AddKeysToAgent yes >> ~/.ssh/config
	echo   UseKeychain yes >> ~/.ssh/config
	echo    IdentityFile ~/.ssh/id_rsa >> ~/.ssh/config
	exit 0
fi


if [[ $1 == -alias ]]; then
	git config --global alias.s "status -s -b"
	git config --global alias.lg "log --oneline --decorate --all --graph"
	git config --global core.pager cat
	exit 0
fi

if [ -d "$(xcode-select -p 2>/dev/null)" ]; then
	if [[ $(pwd) == /Users/$USER/.dotfiles ]]; then
		echo Estás ejecutando esto en la carpeta equivocada
		exit 0
	fi
	if [[ $(command -v brew) == "" ]]; then
		echo Installing Hombrew
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	else
		echo Updating Homebrew
		brew update
		brew upgrade
	fi
	sudo xcodebuild -license accept
	brew install python3 gpg nvim nodejs git wget checkstyle hardlink-osx lua tree
	sudo pip3 install --upgrade pip
	sudo pip3 install isort python-language-server flake8 yapf autopep8 neovim
	sudo npm i -g neovim prettier fixjson eslint xmllint csslint typescript vim-language-server markdownlint stylelint stylelint-config-standard
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
	hln ~/.dotfiles/.zshrc ~/.zshrc
	hln ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim 
	hln ~/.dotfiles/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

	echo "\nLos siguientes datos son para git\nNombre:"
	read nombre
	echo "email:"
	read email
	git config --global user.name "$nombre"	
	git config --global user.email "$email"	
	git config --global alias.s "status -s -b"
	git config --global alias.lg "log --oneline --decorate --all --graph"
	git config --global core.pager cat

	export EDITOR=nvim
	if [[ ! -d ~/.oh-my-zsh ]]; then
		export ZSH=
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	fi



else
	echo Command Line Tools no están instaladas
	exit 1
fi
