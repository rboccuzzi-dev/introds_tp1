#!/bin/bash

BASE=~/EPNro1

if [ "$1" = "-d" ]; then
    pkill -f consolidar.sh 2>/dev/null
    rm -rf ~/EPNro1
    echo "Entorno eliminado"
    exit 0
fi

echo -n "Ingrese el nombre para el archivo resultante (sin extension): "
read FILENAME
export FILENAME
SALIDA_UBI="$BASE/salida/$FILENAME.txt"

selec=0
while [ $selec != 6 ]
do
    echo "====== MENU ======"
    echo "Ingrese un numero dependiendo de la accion a realizar: "
    echo "1) Crear entorno"
    echo "2) Correr proceso"
    echo "3) Imprimir salida ordenado por padron"
    echo "4) 10 mejores notas"
    echo "5) Buscar por padron"
    echo "6) Salir"

    read selec

    case "$selec" in
        "1")
        mkdir -p $BASE/{entrada,salida,procesado}
        echo "Entorno creado correctamente"
        cp ./consolidar.sh $BASE
        ;;
        "2")
        cd $BASE
        chmod +x ./consolidar.sh
        ./consolidar.sh &
        ;;
        "3")
        if [ -e $SALIDA_UBI ]; then
            sort -k1,1n "$SALIDA_UBI"
        else echo "Archivo de salida no encontrado."
        fi
        ;;
        "4")
        if [ -f $SALIDA_UBI ]; then
            sort -k5,5nr "$SALIDA_UBI" | head
        else echo "Archivo de salida no encontrado."
        fi
        ;;
        "5")

        if [ -e $SALIDA_UBI ]; then
            echo -n "Ingrese el padron del cual quiere saber: "
            read padron
            grep "^$padron " "$SALIDA_UBI"
        else echo "Archivo de salida no encontrado."
        fi
        ;;
        "6")
        echo "Exiting..."
        ;;
        *)
        echo "Ingreso invalido, ingrese un numero entre 1-6"
        ;;
    esac
done
