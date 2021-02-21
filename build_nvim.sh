: 'find_package_manager() {
    # Find the package manager, as now I only use apt-get.
    hash apt-get &> /dev/null && echo apt-get && return 0
}
'

install() {
    sudo apt update
    sudo apt-get -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip python3-pip python3 git
    sudo pip3 install pynvim
    mkdir -p ~/clone/
    if [ -d "~/clone/nvim/" ]; then rm -rf "~/clone/nvim/"; fi
    git clone https://github.com/neovim/neovim ~/clone/nvim
    cd git clone https://github.com/neovim/neovim ~/clone/nvim
    make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install && return 0
    return 1
}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    install
    if [[ $? -eq 0 ]]; then
        echo "¡Instalado correctamente!"
    else
        echo "Fallo en la instalación"
    fi  
else if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "No está implementado aún"
    exit 0
fi
