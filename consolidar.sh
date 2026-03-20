#!/bin/bash

BASE="$HOME/FIUBA/TP1-BASH/EPNro1"
ENTRADA="$BASE/entrada"
SALIDA="$BASE/salida"
PROCESADO="$BASE/procesado"

ARCHIVO_SALIDA="$SALIDA/$FILENAME.txt"

touch "$ARCHIVO_SALIDA"

while true; do
    for archivo in "$ENTRADA"/*.txt; do
        [ -e "$archivo" ] || continue
        cat "$archivo" >> "$ARCHIVO_SALIDA"
        mv "$archivo" "$PROCESADO/"
    done
    sleep 3
done
