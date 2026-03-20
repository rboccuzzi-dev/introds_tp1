#!/bin/bash

BASE="$HOME/FIUBA/TP1-BASH/EPNro1"
ENTRADA="$BASE/entrada"
SALIDA="$BASE/salida"
PROCESADO="$BASE/procesado"
PIDFILE="$BASE/consolidar.pid"

if [ -z "$FILENAME" ]; then
    echo "Error: la variable FILENAME no está definida."
    echo "Ejemplo: export FILENAME=alumnos"
    exit 1
fi

#Parámetro opcional -d,
if [ "$1" = "-d" ]; then
    if [ -f "$PIDFILE" ]; then
        kill "$(cat "$PIDFILE")" 2>/dev/null
        rm -f "$PIDFILE"
    fi

    rm -rf "$BASE"
    echo "Entorno borrado."
    exit 0
fi

crear_entorno() {
    mkdir -p "$ENTRADA" "$SALIDA" "$PROCESADO"
    cp ./consolidar.sh "$BASE/consolidar.sh"
    chmod +x "$BASE/consolidar.sh"
    echo "Entorno creado en $BASE"
}

correr_proceso() {
    if [ ! -d "$BASE" ]; then
        echo "Primero debés crear el entorno."
        return
    fi

    if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
        echo "El proceso ya está corriendo."
        return
    fi

    bash "$BASE/consolidar.sh" &
    echo $! > "$PIDFILE"
    echo "Proceso iniciado en background."
}

mostrar_ordenados() {
    ARCHIVO="$SALIDA/$FILENAME.txt"

    if [ -f "$ARCHIVO" ]; then
        sort -n "$ARCHIVO"
    else
        echo "No existe el archivo $ARCHIVO"
    fi
}

mostrar_top10() {
    ARCHIVO="$SALIDA/$FILENAME.txt"

    if [ -f "$ARCHIVO" ]; then
        sort -k4 -nr "$ARCHIVO" | head -10
    else
        echo "No existe el archivo $ARCHIVO"
    fi
}

buscar_padron() {
    ARCHIVO="$SALIDA/$FILENAME.txt"

    if [ ! -f "$ARCHIVO" ]; then
        echo "No existe el archivo $ARCHIVO"
        return
    fi

    read -p "Ingrese el padrón a buscar: " padron
    grep "^$padron " "$ARCHIVO"
}

while true; do
    echo "====== MENU ======"
    echo "1) Crear entorno"
    echo "2) Correr proceso"
    echo "3) Mostrar alumnos ordenados por padrón"
    echo "4) Mostrar las 10 notas más altas"
    echo "5) Buscar por padrón"
    echo "6) Salir"
    read -p "Seleccione una opción: " opcion

    case $opcion in
        1) crear_entorno ;;
        2) correr_proceso ;;
        3) mostrar_ordenados ;;
        4) mostrar_top10 ;;
        5) buscar_padron ;;
        6) exit 0 ;;
        *) echo "Opción inválida" ;;
    esac
done
