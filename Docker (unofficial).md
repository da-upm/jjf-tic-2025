____
Tags: #docker
___

Crear imágenes a partir de archivos Dockerfile:

```docker
FROM SO:version
MAINTAINER nombre del autor "nombre"
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y nano \
net-tools \
curl \
php \
apache2 \
git 
ENTRYPOINT service apache2 start && /bin/bash
EXPOSE 80
COPY name.txt /var/www/html/
```

Levantar el contenedor a partir del dockerfile:

```bash
docker build -t my_first_image .
```

Bajar imágenes públicas:

```bash
docker pull OS:version
```

Mostrar las imágenes:

```bash 
docker images
```

Levantar un container a partir de una image en modo interactivo:

```bash
docker run -dit --name $name-container $image
```
>**-d**  o  **–detach**: se utiliza para arrancar el contenedor en segundo plano, en lugar de en primer plano.
**-i**  o  **–interactive**: se utiliza para permitir la entrada interactiva al contenedor.
**-t**  o  **–tty**: se utiliza para asignar un seudoterminal al contenedor.
**–name** : se utiliza para asignar un nombre al contenedor.

Entrar en el modo interactivo del container:

```bash
docker exec -it $container bash
```

> **-i** o **–interactive** se utiliza para permitir la entrada interactiva al contenedor.
**-t** o **–tty**  se utiliza para asignar un seudoterminal al contenedor.

Mostrar containers activos:

```bash
docker ps -aq
```

>**-a** o **–all**: se utiliza para listar todos los contenedores, incluyendo los contenedores detenidos.
>**-q** o **–quiet**: se utiliza para mostrar sólo los identificadores numéricos de los contenedores.

Detener el container:

```bash
docker id stop
```

Eliminar el container:

```bash
docker rm id --force
```

Eliminar los container:

```bash
docker rm $(docker ps -a -q) --force
```

Eliminar una image:

```bash
docker rmi id
```

Eliminar todas las images:

```bash
docker rmi $(docker images -q) --force
```

Eliminar images none>:

```bash
docker rmi $(docker images --filter "dangling=true" -q)
```

Mostrar los puertos del container:

```bash
docker port container
```

Port forwarding TCP del container:

```bash
docker run -p 80:8080 mi_imagen
```

Port forwarding UDP del container:

```bash
docker run -p 53:53/udp mi_imagen
```

Monturas:

```bash
docker run -dit -p 80:80 -v /home/user/Desktop/docker/:/var/www/html/ --name mywebserver webserver
```

Logs  del container:

```bash
docker logs id -f
```

Monturas en docker:
```bash
docker run --rm -dit -v /:/mnt/root --name name ubuntu
```

# Network

Mostrar redes:

```bash
docker network ls
```

Eliminar todas las redes:

```bash
docker network rm $(dcoker network ls -q)
```

Crear una red:

```bash
docker network create --driver=bridge $network_name --subnet=10.10.0.0/24
```

Asignar una interfaz de red a un container:

```bash
docker network connect $network_name $name_container
```

Conectar un nuevo container a una red dada:

```bash
docker run -dit --name $name_container --network $name_network1 $image
```
# Volumes

Listar los volumes:

```bash
docker volume ls
```

Levantar containers desde un .yml

```bash
docker-compose up -d --build
```

Eliminar los volumes:
 
```bash
docker volume rm $(docker volume ls -q)
```
