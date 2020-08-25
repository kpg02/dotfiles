" Configuración de kpg02

" === Plugins ===
call plug#begin()

try
    source ~/.config/nvim/plugins.vim
catch
endtry

call plug#end()


" === Profile Setup ===

try
    source ~/.config/nvim/profiles.vim
catch
endtry


" === Plugin Setup ===

try
    source ~/.config/nvim/config.vim
catch
endtry


" === Keymaps Setup ===

try
    source ~/.config/nvim/keymaps.vim
catch
endtry


