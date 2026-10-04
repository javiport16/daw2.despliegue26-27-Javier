#!/bin/bash
# Actualización del sistema e instalación de paquetes requeridos
apt-get update -y && apt-get upgrade -y
apt-get install -y apache2 libapache2-mod-wsgi-py3 python3-flask