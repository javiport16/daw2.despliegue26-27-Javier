#!/bin/bash
# Actualización del sistema e instalación de paquetes requeridos
apt-get update -y && apt-get upgrade -y
apt-get install -y apache2 libapache2-mod-wsgi-py3 python3-flask
# Creación del directorio de la aplicación y asignación de permisos
mkdir -p /var/www/flaskapp
chown -R www-data:www-data /var/www/flaskapp
chmod -R 755 /var/www/flaskapp