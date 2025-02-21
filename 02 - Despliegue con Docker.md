# Práctica: Despliegue de Imagen Docker en Debian

En esta práctica se guiara a desplegar la imagen Docker `pablofl01/jjf-demo` sobre un sistema Debian.

## Pasos a seguir

1. **Instalar Docker (si no está instalado):**

    Sigue estos pasos para instalar Docker:
    ```
    wget https://get.docker.com -O get-docker.sh
    chmod +x get-docker.sh
    ./get-docker.sh
    ```

3. **Verificar la instalación de Docker:**

    Comprueba que Docker esté corriendo correctamente:
    ```
    sudo systemctl status docker
    ```

    > Si no está activo, basta con ejecutar `sudo systemctl start docker`.


4. **Descargar y ejecutar la imagen Docker:**

    Ejecuta la imagen `pablofl01/jjf-demo` en un contenedor. Puedes hacer esto con el siguiente comando:
    ```
    sudo docker run -d --name jjf-demo -p 5000:5000 -e SERVER_NAME="<Nombre del Servidor>" pablofl01/jjf-demo
    ```
    > **Descripción:**  
    > - `-d`: Ejecuta el contenedor en segundo plano.  
    > - `--name jjf-demo`: Asigna un nombre al contenedor.  
    > - `-p 5000:5000`: Mapea el puerto 5000 del contenedor al puerto 5000 del host.
    > - `-e`: Establece las variables de entorno. Debe indicarse tantas veces como variables se necesiten.

5. **Verificar el contenedor:**

    Comprueba que el contenedor esté en ejecución:
    ```
    sudo docker ps
    ```

6. **Acceder a la aplicación:**

    Abre un navegador y visita `http://localhost:5000` (o la dirección IP del servidor) para ver la aplicación desplegada.

7. **Limpieza (opcional)**

    Para detener y eliminar el contenedor creado, ejecuta:
    ```
    sudo docker rm -f jjf-demo
    ```
    > **Descripción:**  
    > - `-f`: Fuerza la eliminación aunque el contenedor siga en marcha.
