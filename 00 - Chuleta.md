# Chuleta Básica de Comandos de Linux

## Navegación y Directorios

| Comando              | Descripción                              |
|----------------------|------------------------------------------|
| pwd                  | Muestra el directorio actual.            |
| ls                   | Lista archivos y carpetas.               |
| cd [directorio]      | Cambia al directorio especificado.       |
| mkdir [nombre]       | Crea un nuevo directorio.                |

## Archivos

| Comando                      | Descripción                                     |
|------------------------------|-------------------------------------------------|
| touch [archivo]              | Crea un archivo vacío.                          |
| cp [origen] [destino]        | Copia archivos o directorios.                   |
| mv [origen] [destino]        | Mueve o renombra archivos o directorios.        |
| rm [archivo]                 | Elimina un archivo.                             |
| rm -r [directorio]           | Elimina un directorio y su contenido.           |

## Visualización de Archivos

| Comando              | Descripción                                          |
|----------------------|------------------------------------------------------|
| cat [archivo]        | Muestra el contenido completo de un archivo.       |
| less [archivo]       | Visualiza el contenido de un archivo con paginación. |
| head [archivo]       | Muestra las primeras líneas de un archivo.         |
| tail [archivo]       | Muestra las últimas líneas de un archivo.          |

## Búsqueda

| Comando                          | Descripción                                 |
|----------------------------------|---------------------------------------------|
| grep [patrón] [archivo]          | Busca líneas que contienen el patrón.       |
| find [ruta] -name "[patrón]"      | Busca archivos por nombre en una ruta.      |

## Procesos

| Comando              | Descripción                                                   |
|----------------------|---------------------------------------------------------------|
| ps                   | Muestra procesos en ejecución.                                |
| top                  | Muestra los procesos en tiempo real.                          |
| kill [PID]           | Finaliza el proceso con el identificador especificado.        |

## Permisos

| Comando                                     | Descripción                                                       |
|---------------------------------------------|-------------------------------------------------------------------|
| chmod [permisos] [archivo]                  | Cambia permisos de un archivo o directorio.                       |
| chown [usuario]:[grupo] [archivo]           | Cambia el propietario y grupo de un archivo o directorio.         |
