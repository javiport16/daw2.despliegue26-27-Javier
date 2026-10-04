#!/bin/bash
# Actualización del sistema e instalación de paquetes requeridos
apt-get update -y && apt-get upgrade -y
apt-get install -y apache2 libapache2-mod-wsgi-py3 python3-flask
# Creación del directorio de la aplicación y asignación de permisos
mkdir -p /var/www/flaskapp
chown -R www-data:www-data /var/www/flaskapp
chmod -R 755 /var/www/flaskapp
# 1. Creación del archivo app.py (Aplicación Flask)
cat << 'EOF' > /var/www/flaskapp/app.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Aplicación Flask en AWS desplegada automáticamente por [Javier Portela] - [04/10/2026]\n"

if __name__ == "__main__":
    app.run()
EOF
# 2. Creación del adaptador WSGI (app.wsgi)
cat << 'EOF' > /var/www/flaskapp/app.wsgi
import sys
sys.path.insert(0, "/var/www/flaskapp")
from app import app as application
EOF
# 3. Creación de la configuración del VirtualHost en Apache (flaskapp.conf)
cat << 'EOF' > /etc/apache2/sites-available/flaskapp.conf
<VirtualHost *:80>
    ServerName localhost
    WSGIScriptAlias / /var/www/flaskapp/app.wsgi

    <Directory /var/www/flaskapp>
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
# 4. Activación del sitio virtual, desactivación del sitio por defecto y recarga de Apache
a2ensite flaskapp.conf
a2dissite 000-default.conf
systemctl reload apache2