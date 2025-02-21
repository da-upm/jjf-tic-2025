# Práctica 1 – Conexión SSH y gestión de usuarios

## 1. Creación de un usuario con contraseña

Conecta al servidor por primera vez utilizando las credenciales (usuario e IP) proporcionadas:

```bash
ssh <user>@<ip>
```

Para crear un nuevo usuario (elige un nombre único), ejecuta:

```bash
sudo adduser --disabled-password <username>
```

> Al usar `sudo` por primera vez, se solicita la contraseña del usuario conectado por SSH. Esta contraseña es la misma utilizada para iniciar sesión a través de SSH.

Llegados a este punto, tenemos un

Otorga permisos de administración al usuario añadiéndolo al grupo `sudo`:

```bash
suso usermod -aG sudo <username>
```

Para conectarte con el nuevo usuario, usa:

```bash
ssh <username>@<ip>
```

Verifica los permisos de superusuario con:

```bash
sudo -l
```

> Para terminar la sesión o cerrar la terminal, utiliza el comando `exit`.

## 2. Creación de un usuario con clave pública

La creación del usuario y asignación de permisos se realiza de manera similar. Solo cambia el método de autenticación.

1. Genera un par de claves SSH:

    ```bash
    ssh-keygen -t ecdsa -b 521
    ```

    > Se recomienda proteger la clave privada con una contraseña.

2. Crea el usuario siguiendo los mismos pasos indicados en la sección anterior.

3. Visualiza tu clave pública:

    - En Windows:

      ```bash
      type C:\Users\<user_windows>\.ssh\<file>.pub
      ```

    - En Linux/Mac:

      ```bash
      cat /home/<user_linux>/.ssh/<file>.pub
      ```

4. Copia la cadena resultante y pégala en el servidor en el archivo `/home/<username_2>/.ssh/authorized_keys`:

    ```bash
    sudo nano /home/<username_2>/.ssh/authorized_keys
    ```

    > Si el directorio `.ssh` no existe, créalo con `mkdir`.

5. Ajusta los permisos del archivo para que solo el propietario pueda leer o modificarlo:

    ```bash
    sudo chmod 600 /home/<username_2>/.ssh/authorized_keys
    ```

6. Para conectarte usando autenticación mediante clave, ejecuta:

    ```bash
    ssh -i <path_to_private_key> <username_2>@<ip>
    ```

    > Si has protegido la clave privada con contraseña, se te solicitará ingresarla.

## 3. Opcional: Gestión de Grupos

Linux permite organizar y administrar permisos de usuarios mediante grupos. Seguiremos los siguientes pasos para crear y gestionar un grupo.

1. Crea un directorio compartido. Este directorio se creará con permisos de súper usuario, por lo que inicialmente pertenecerá al usuario `root`:

    ```bash
    sudo mkdir /compartido
    ```

2. Crea un nuevo grupo:

    ```bash
    sudo groupadd <group_name>
    ```

3. Asigna el grupo al directorio:

    ```bash
    sudo chown :<group_name> /compartido
    ```

    > Para verificar la propiedad y el grupo asignados, usa el comando `ls -la`.

4. Añade un usuario al nuevo grupo (similar a cómo se asignó el grupo `sudo`):

    | Tarea: Añadir el usuario al grupo `<group_name>`. |
    | --- |

    <textarea style="border: 1px solid #ccc; background-color: #f9f9f9; font-family: 'Courier New', Courier, monospace; font-size: 14px; padding: 5px; width: 100%; box-sizing: border-box; resize: vertical; outline: none;" placeholder="$ sudo usermod -aG <group_name> <username>">
    </textarea>

5. Verifica el funcionamiento accediendo al directorio compartido desde ambos usuarios:

    ```bash
    cd /compartido
    ```

    Prueba creando un archivo:

    ```bash
    touch <file>.txt
    ```

---

Jornadas de Formación TIC 2024 - Delegación de Alumnos UPM

![Creative Commons "Attribution-Share Alike" license icon](https://upload.wikimedia.org/wikipedia/commons/e/e5/CC_BY-SA_icon.svg)
