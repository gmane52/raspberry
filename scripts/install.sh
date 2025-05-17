#!/bin/bash
#Este script installa startup.sh y sesion_startup.sh

# Configuracion startup.sh

## Activar crontab 
### Ruta completa al script de inicio
directorio=$(pwd)
startup_script="$directorio/startup.sh"
### Agregar al crontab si no existe ya
(crontab -l 2>/dev/null | grep -Fxq "@reboot $startup_script") || \
(crontab -l 2>/dev/null; echo "@reboot $startup_script") | crontab -

## Activar Flask
### Modificar startup.sh para insertar la ruta corecta directamente
sed -i "s|cd .*web_personal|cd \"$directorio/web_personal\"|" startup.sh



# Configuracion sesion_startup.sh

## Modificar archivo bashrc
### Construir línea export
linea="export PATH=\"$directorio:\$PATH\""
### Añadirla si no existe en ~/.bashrc
grep -Fxq "$linea" ~/.bashrc || echo "$linea" >> ~/.bashrc

