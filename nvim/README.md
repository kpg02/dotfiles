# Mi configuración de nvim

![Mi configuración de nvim](https://i.imgur.com/siCIVae.png "Mi configuración de nvim")

## Configuración de teclas

> \<leader> en mi configuración es el espacio (el espacio seguido de este en el apartado Tecla es por estética)
> \<C-\*> siendo \* cualquier carácter ctrl + esta tecla
> \<S-\*> siendo \* cualquier carácter shift + esta tecla
> \<T-\*> siendo \* cualquier carácter tab + esta tecla
> \<CR> Enter
> \<BS> Borrar (BackSpace)

| Tecla        | Función                                                                                                            | Modo            |
| ------------ | ------------------------------------------------------------------------------------------------------------------ | --------------- |
| Ñ            | Sale de cualquier modo (menos terminal)                                                                            | todos           |
| \<C-space>   | Llama al autocompletado de la palabra sobre la que está                                                            | insertar        |
| \<CR>        | Confirma el completado                                                                                             | insertar        |
| \<S-TAB>     | Mueve hacia arriba la selección del autocompletar                                                                  | insertar        |
| \<TAB>       | Mueve hacia abajo la selección del autocompletar                                                                   | insertar        |
| ñ\<TAB>      | Va al siguiente snippet o a la próxima posición del cursor en el snippet                                           | insertar        |
| K            | Muestra la documentación sobre el símbolo en el que está                                                           | normal          |
| \<C-p>       | Abre :Files de fzf para buscar archivos                                                                            | normal          |
| \<leader> fi | Cambia los tabs por espacios (según mi configuración) con :retab!                                                  | normal          |
| \<leader> gg | Abre el diagnosis de ALE                                                                                           | normal          |
| \<leader> pm | Abre la preview de markdown en el navegador                                                                        | normal          |
| \<leader> rn | Renombra el símbolo sobre el que está (rename)                                                                     | normal          |
| gB           | Va al buffer anterior (go Buffer)                                                                                  | normal          |
| gb           | Va al siguiente buffer (go buffer)                                                                                 | normal          |
| gd           | Va a la definición del símbolo sobre el que está (go definition)                                                   | normal          |
| gi           | Va a la implementación del símbolo sobre el que está (go implementation)                                           | normal          |
| gj           | Va a la anterior línea (hacia arriba) que contiene un error                                                        | normal          |
| gk           | Va a la siguiente línea (hacia abajo) que contiene un error                                                        | normal          |
| gr           | Va a la referencia del símbolo sobre el que está (go reference)                                                    | normal          |
| gy           | Va a la definición del tipo sobre el que está (go type definition)                                                 | normal          |
| ña           | Limpia el highlighting producido por la búsqueda (:noh)                                                            | normal          |
| ñi           | Indenta correctamente todo el archivo                                                                              | normal          |
| ñt           | Toggle de NERDTree                                                                                                 | normal          |
| ññ           | Salta al siguiente par como si fuera % con el plugin matchup                                                       | normal          |
| ´´           | Toggle de plugin AutoPairs                                                                                         | normal/insertar |
| ´ñ           | Vuelve a la posición anterior del cursor e inserta el cierre de la pareja (deshace el efecto FlyMode de AutoPairs) | normal/insertar |
| \<C-h>       | Cambia al buffer de la izquierda                                                                                   | normal/terminal |
| \<C-j>       | Cambia al buffer de abajo                                                                                          | normal/terminal |
| \<C-k>       | Cambia al buffer de arriba                                                                                         | normal/terminal |
| \<C-l>       | Cambia al buffer de derecha                                                                                        | normal/terminal |
| \<leader> ff | Formatea el archivo entero o la selección                                                                          | normal/visual   |
