#!/bin/bash

#Esto es un script que permite ejecutar cosas al arrancar

echo "[INFO] Script ejecutado" >> /home/gmane/scripts/startup.log
date >> /home/gmane/scripts/startup.log

# Activar Flask
cd /home/gmane/repositorio_git/web_personal
source venv/bin/activate
sudo python run.py &

echo "[INFO] Flask iniciado" >> /home/gmane/scripts/startup.log