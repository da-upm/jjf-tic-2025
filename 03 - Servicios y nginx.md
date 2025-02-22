# Práctica: Desplegar contenedor Docker como servicio con systemd y exponerlo mediante nginx

En esta práctica se mostrará cómo convertir el despliegue de la práctica 02 en un servicio gestionado por systemd y cómo instalar y configurar nginx para exponer la aplicación.
## 1. Crear el contenedor y configurar el servicio systemd

Primero, crea el contenedor de la aplicación:

```bash
sudo docker create --name jjf-demo -p 5000:5000 -e SERVER_NAME="<Nombre del Servidor>" <Nombre de la imagen creada>
```
> Recuerda que si el puerto está ocupado, debes eliminar el contenedor previo o usar otro puerto.

Luego, crea el servicio en `/etc/systemd/system/jjf-demo.service` para gestionar el inicio y parada del contenedor:

```ini
[Unit]
Description=Servicio Docker para jjf-demo
After=docker.service
Requires=docker.service

[Service]
Restart=always
ExecStart=/usr/bin/docker start -a jjf-demo
ExecStop=/usr/bin/docker stop -t 10 jjf-demo

[Install]
WantedBy=multi-user.target
```

## 2. Habilitar y arrancar el servicio

Ejecuta los siguientes comandos:

```bash
sudo systemctl daemon-reload
sudo systemctl enable jjf-demo.service
sudo systemctl start jjf-demo.service
```

> Nota:
> 
> - **sudo systemctl daemon-reload:** Recarga la configuración de systemd. Esto es útil cuando se han realizado cambios en los archivos de unidad (servicios) para que systemd pueda reconocer las modificaciones.
> - **sudo systemctl enable jjf-demo.service:** Configura el servicio "jjf-demo" para que se inicie automáticamente al arrancar el sistema. No lo inicia de inmediato; solo lo marca para el arranque.
> - **sudo systemctl start jjf-demo.service:** Inicia inmediatamente el servicio "jjf-demo". Con esto, el servicio se ejecuta ahora y se queda en ejecución según su configuración.

Verifica su estado:

```bash
sudo systemctl status jjf-demo.service
```

## 3. Instalar nginx

Si nginx no está instalado, instálalo:

```bash
sudo apt update
sudo apt install nginx -y
```

## 4. Configurar nginx como proxy

Crea una configuración para el sitio en `/etc/nginx/sites-available/jjf-demo`:

```nginx
server {
    listen 80;
    server_name <subdominio_del_servidor>;

    location / {
        proxy_pass http://localhost:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

> El `<subdominio_del_servidor>` es `<nombre>.da.upm.es`.

Habilita la configuración y reinicia nginx:

```bash
sudo ln -s /etc/nginx/sites-available/jjf-demo /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

> **Nota:**  
>  
> **sudo ln -s /etc/nginx/sites-available/jjf-demo /etc/nginx/sites-enabled/**  
> Crea un enlace simbólico (shortcut) del archivo de configuración ubicado en `/etc/nginx/sites-available/jjf-demo` al directorio `/etc/nginx/sites-enabled/`. Esto activa la configuración en el servidor Nginx.  
>  
> **sudo nginx -t**  
> Ejecuta una prueba de la configuración de Nginx para verificar que no existan errores de sintaxis o de configuración antes de reiniciar el servicio.  
>  
> **sudo systemctl restart nginx**  
> Reinicia el servicio de Nginx para que se apliquen los cambios realizados en la configuración.

## 5. Acceder a la aplicación

Abre un navegador y visita `http://<nombre>.da.upm.es` para confirmar que nginx redirige correctamente a la aplicación.
