# alias_bashrc

Este script en bash proporciona varias funciones para gestionar alias en un sistema Linux. Aquí está el resumen de lo que hace cada función:

## opciones_alias
Esta función muestra un menú de opciones relacionadas con el manejo de alias. Las opciones incluyen actualizar, desinstalar, listar, crear, borrar, editar, mostrar un menú interactivo y realizar copias de seguridad y restauraciones de los alias.

## actualizar_alias
Esta función actualiza el script verificando la conexión a Internet y comparando la versión local del script con la versión en un repositorio en GitHub. Si hay una nueva versión disponible, descarga y reemplaza el script local. Si no hay conexión a Internet o el script está actualizado, muestra un mensaje adecuado.

## desistalar_alias_bashrc
Esta función permite desinstalar el script alias_bashrc y eliminar los alias creados. Pide confirmación al usuario y, si se confirma, elimina las configuraciones y los archivos asociados.

## listar_alias
Esta función muestra todos los alias definidos en el archivo .bash_aliases del usuario actual.

## crear_alias
Esta función solicita al usuario un nombre y un comando, luego crea un alias con el nombre y el comando proporcionados y lo agrega al archivo .bash_aliases.

## borrar_alias
Esta función permite al usuario eliminar uno o varios alias existentes. Muestra una lista de los alias disponibles y permite al usuario seleccionar los alias que desea eliminar.

## editar_fichero_alias
Esta función permite al usuario editar el archivo .bash_aliases que contiene los alias utilizando el editor de texto nano.

## menu_alias
Esta función muestra un menú interactivo que permite al usuario seleccionar un alias de una lista utilizando la herramienta fzf (Fuzzy Finder). Luego, ejecuta el comando asociado con el alias seleccionado.

## backup_alias
Esta función crea un backup de los alias del usuario almacenando una copia del archivo .bash_aliases en un directorio llamado backup_alias en la carpeta personal del usuario.

## restore_alias
Esta función restaura los alias desde un archivo de backup previamente creado. Verifica si el archivo de backup existe y, si es así, restaura los alias guardados en el archivo .bash_aliases.

# Instalacion
Simplemente debes clonar el repositorio con la orden:

    git clone https://github.com/sukigsx/alias_bashrc.git
Entras en la carpeta y ejecutas alias_bashrc.sh con la orden:

    ./alias_bashrc.sh
o bien:

    bash alias_bashrc.sh
Tambien puedes utilizar mi script (ejecutar_escripts), en el cual puedes instalar todos mis script del repositorio.

    git clone https://github.com/sukigsx/ejecutar_scripts.git
# Espero od guste !!!!!!

# ¡Disfruta automatizando tus tareas con este menú interactivo!
