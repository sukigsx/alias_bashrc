#!/bin/bash

#colores
#ejemplo: echo -e "${verde} La opcion (-e) es para que pille el color.${borra_colores}"

rojo="\e[0;31m\033[1m" #rojo
verde="\e[;32m\033[1m"
azul="\e[0;34m\033[1m"
amarillo="\e[0;33m\033[1m"
rosa="\e[0;35m\033[1m"
turquesa="\e[0;36m\033[1m"
borra_colores="\033[0m\e[0m" #borra colores

#toma el control al pulsar control + c
trap ctrl_c INT
function ctrl_c()
{
clear
figlet -c Gracias por
figlet -c utilizar mi
figlet -c script
wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
exit
}

#funcion de comprobar conexion a internet
#para que funciones necesita:
#   conexion ainternet
#   la paleta de colores
#   software: ping
conexion(){
if ping -c1 google.com &>/dev/null
then
    conexion=$(echo -e "${verde}SI${borra_colores}")
else
    conexion=$(echo -e "${verde}NO${borra_colores}")
fi
}

#actualizar el script
actualizar_script(){
archivo_local="alias_bashrc.sh" # Nombre del archivo local
ruta_repositorio="https://github.com/sukigsx/alias_bashrc.git" #ruta del repositorio para actualizar y clonar con git clone

# Obtener la ruta del script
descarga=$(dirname "$(readlink -f "$0")")
git clone $ruta_repositorio /tmp/comprobar >/dev/null 2>&1

diff $descarga/$archivo_local /tmp/comprobar/$archivo_local >/dev/null 2>&1


if [ $? = 0 ]
then
    #esta actualizado, solo lo comprueba
    echo ""
    echo -e "${verde} El script${borra_colores} $0 ${verde}esta actualizado.${borra_colores}"
    echo ""
    chmod -R +w /tmp/comprobar
    rm -R /tmp/comprobar
    actualizado=$(echo -e "${verde}SI${borra_colores}")
else
    #hay que actualizar, comprueba y actualiza
    echo ""
    echo -e "${amarillo} EL script${borra_colores} $0 ${amarillo}NO esta actualizado.${borra_colores}"
    echo -e "${verde} Se procede a su actualizacion automatica.${borra_colores}"
    sleep 3
    mv /tmp/comprobar/$archivo_local $descarga
    chmod -R +w /tmp/comprobar
    rm -R /tmp/comprobar
    echo ""
    echo -e "${verde} El script se ha actualizado, es necesario cargarlo de nuevo.${borra_colores}"
    echo -e "${amarillo} Se cerrara el terminal en 5 segundos.${borra_colores}"
    sleep 5
    xdotool windowkill `xdotool getactivewindow`
fi
}

#funcion software necesario
software_necesario(){
echo ""
echo -e " Comprobando el software necesario."
echo ""
software="which git diff ping figlet xdotool wmctrl" #ponemos el foftware a instalar separado por espacion dentro de las comillas ( soft1 soft2 soft3 etc )
for paquete in $software
do
which $paquete 2>/dev/null 1>/dev/null 0>/dev/null #comprueba si esta el programa llamado programa
sino=$? #recojemos el 0 o 1 del resultado de which
contador="1" #ponemos la variable contador a 1
    while [ $sino -gt 0 ] #entra en el bicle si variable programa es 0, no lo ha encontrado which
    do
        if [ $contador = "4" ] || [ $conexion = "no" ] 2>/dev/null 1>/dev/null 0>/dev/null #si el contador es 4 entre en then y sino en else
        then #si entra en then es porque el contador es igual a 4 y no ha podido instalar o no hay conexion a internet
            clear
            echo ""
            echo -e " ${amarillo}NO se ha podido instalar ${rojo}$paquete${amarillo}.${borra_colores}"
            echo -e " ${amarillo}Intentelo usted con la orden: (${borra_colores}sudo apt install $paquete ${amarillo})${borra_colores}"
            echo -e ""
            echo -e " ${rojo}No se puede ejecutar el script sin el software necesario.${borra_colores}"
            echo ""; read p
            ctrl_c
        else #intenta instalar
            echo " Instalando $paquete. Intento $contador/3."
            sudo apt install $paquete -y 2>/dev/null 1>/dev/null 0>/dev/null
            let "contador=contador+1" #incrementa la variable contador en 1
            which $paquete 2>/dev/null 1>/dev/null 0>/dev/null #comprueba si esta el programa en tu sistema
            sino=$? ##recojemos el 0 o 1 del resultado de which
        fi
    done
echo -e " [${verde}ok${borra_colores}] $paquete."
software=$(echo -e "${verde}SI${borra_colores}")
done
}

# EMPIEZA LO GORDO
clear
echo ""
conexion
echo -e " Conexion a internet = $conexion"

software_necesario
actualizar_script
echo -e " ¿ El script $0 esta actualizado ? = $actualizado"

if [ $software_necesario="SI" ] || [ $actualizado="SI" ]
then
    echo "ENTRA"; read p
else
    echo "no entra"; read p
fi



