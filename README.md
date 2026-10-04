Despliegue Automatizado en AWS EC2 de Aplicación Flask con Apache y WSGI

Este repositorio contiene el script de automatización desatendida en Bash (`user_data.sh`) utilizado para desplegar una aplicación web en Python/Flask sobre un servidor web Apache en AWS EC2 (Ubuntu) mediante User Data, sin requerir intervención por SSH[cite: 1].

Descripción del Proyecto
El objetivo principal de esta práctica es automatizar la infraestructura y el despliegue de una aplicación web dinámica utilizando el adaptador `mod_wsgi` y el servidor Apache en la nube de Amazon Web Services[cite: 1].

Estructura del Repositorio
* `user_data.sh`: Script en Bash inyectado durante el lanzamiento de la instancia EC2[cite: 1].
* `README.md`: Documentación y explicación del proyecto[cite: 2].

Pasos de Automatización del Script (`user_data.sh`)
1. Actualización e Instalación**: Actualiza los paquetes del sistema e instala `apache2`, `libapache2-mod-wsgi-py3` y `python3-flask`[cite: 1].
2. Estructura de Directorios**: Crea el directorio de trabajo en `/var/www/flaskapp/` y asigna los permisos correspondientes[cite: 1].
3. Generación de Ficheros**: Mediante bloques `cat << 'EOF'` se generan[cite: 1]:
   - `app.py`: Aplicación nativa en Flask con un mensaje personalizado[cite: 1].
   - `app.wsgi`: Script adaptador WSGI para conectar Apache con la aplicación Flask[cite: 1].
   - `flaskapp.conf`: Configuración del VirtualHost de Apache utilizando la directiva `WSGIScriptAlias`[cite: 1].
4. **Activación del Sitio**: Desactiva el sitio por defecto (`000-default.conf`), habilita `flaskapp.conf` y recarga el servicio Apache[cite: 1].

Despliegue y Acceso
1. En la consola de AWS EC2, se configura un **Grupo de Seguridad** permitiendo el acceso HTTP (puerto 80) y SSH (puerto 22)[cite: 2].
2. Se inyecta el script en el apartado **User Data** (Detalles avanzados) al lanzar una instancia Ubuntu[cite: 1].
3. La aplicación queda accesible en el navegador a través de la IP Pública de la instancia: `http://<IP_PUBLICA>`[cite: 1, 2].

Autor
* **Alumno:** [Javier Portela]
* **Módulo:** Despliegue de Aplicaciones Web (DAW)
* **Fecha:** Octubre 2026
