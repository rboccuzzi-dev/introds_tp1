#!/bin/bash

# $FILENAME viene de variable de entorno de menu.sh

touch ~/EPNro1/salida/$FILENAME.txt

for file in ~/EPNro1/entrada/*.txt ; do
    if [ -e "$file" ]; then
        cat $file >> ~/EPNro1/salida/$FILENAME.txt
        mv $file ~/EPNro1/procesado/
    fi
done
