# TP 1 IDS

### Integrantes:
- Matias Jun
- Ian Camacho
- Javier Aguirre
- Boccuzzi Ramiro

### Consigna
- opción 1) Crear entorno. Consiste en la creación de un directorio dentro del “home” que se
llame “EPNro1”, dentro de este directorio deberán existir dos carpetas, una llamada
“entrada”, otra “salida” y una última “procesado”
- opción 2) Correr proceso. Se debe correr un proceso en background que ejecute un script
llamado “consolidar.sh” que se encuentra en el directorio EPNro1, este script debe tomar
cada archivo que ingresa en la carpeta “entrada” y adjuntar toda su información al final del
archivo FILENAME.txt (donde FILENAME es una variable de entorno, previamente
definida) que se encuentra en la carpeta “salida”. Luego de esa operación el archivo original
se debe mover a la carpeta “procesado”.
- opción 3) Si existe el archivo FILENAME.txt en la carpeta salida, mostrar por pantalla el
listado de alumnos ordenados por número de padrón.
- opción 4) Si existe el archivo FILENAME.txt en la carpeta salida, mostrar por pantalla las 10
notas más altas del listado
- opción 5) Solicitar al usuario un nro de padrón, y mostrar por pantalla, los datos del mismo
provenientes del archivo FILENAME.txt de la carpeta salida.
- opción 6) Salir
- parámetro optativo -d) Si el usuario corre el script con el parámetro optativo -d se borrará
todo el entorno creado en la carpeta EPNro1 y se matarán los procesos creados en
background.
