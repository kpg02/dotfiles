# Mi configuración de nvim

![Mi configuración de nvim](https://i.imgur.com/hRCcJAf.png "Mi configuración de nvim")

## Configuración de teclas

|Tecla|Función|Modo|
|--|--|--|
|çç|Vuelve a la posición anterior del cursor de donde salto debido al modo Fly del auto pairs y cierra la pareja | insertar|
|ññ|Cierra el autocompletar si está abierto o sale del modo insertar|insertar|
|\<Tab>|Baja cuando el autocompletar está activo|insertar|
|çç|AutoPairs, vuelve hacia atrás e inserta el cierre de la pareja|insertar|
|çt|Toggle de AutoPairs|insertar|
|çñ|FastWrap AutoPairs, mete la siguiente palabra dentro de la pareja actual|insertar|
|ñ\<tab>|Siguient snippet de CoC|insertar|
|ñi|Indentar todo el archivo|normal|
|ña|Quitar la zona seleccionada por la busqueda|normal|
|ñt|Abre o cierra NERDTree |normal|
|ñn|Salta al siguiente buffer|normal|
|ño|Salta al anterior buffer|normal|
|ñbc|Cierra el buffer actual, no fuerza el cierre|normal|
|ñcc|Cierra forzadamente el buffer actual|normal|
|\<Tab>|Cambia a la siguiente ventana (gt)|normal|
|\<S-Tab>|Cambia a la ventana anterior(gT)|normal|
|gd|Ir a la definición|normal|
|gr|Ir a la referencia|normal|
|gy|Ir a la definición del tipo|normal|
|gi|Ir a la implementación|normal|
|ñk|Ir a la próxima línea con notificación del diagnosis de CoC|normal|
|ñj|Ir a la anterior línea con notificación del diagnosis de CoC|normal|
|ñf|Formatea el archivo|normal|
|ññ|Salir del modo visual|visual|
|ñf|Formatea la selección|visual|
|\<leader>ci|Sobre un bloque de código seleccionado rota entre comentado y no comentado|visual|
