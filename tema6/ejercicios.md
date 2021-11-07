## Ejercicio 1. Crear un pod con dos o más contenedores, de forma que se pueda usar uno desde el otro. Uno de los contenedores contendrá la aplicación que queramos desplegar.

Primero instalamos podman en ubuntu 20.04 siguiendo las instrucciones que se muestran [aquí.](https://podman.io/getting-started/installation) Para su instalación hemos usado los siguientes comandos.

```
. /etc/os-release
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -L "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key" | sudo apt-key add -
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install podman
```

Para la comprobación lanzamos el comando ```podman info```.

![podman info](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema6/img/podmanInfo.png)

Como ejemplo, se va utilizar dos contendores, que va consistir en el despliegue del framework WordPress y su correspondiente base de datos.

* Creamos el primer pod y mapeamos los puertos.

```
sudo podman pod create --name my-pod -p 8080:80
```

* Creamos los contendores, primero se va a crear el contenedor de BD (MariaDB).

```
sudo podman run \
-d --restart=always --pod=my-pod \
-e MYSQL_ROOT_PASSWORD="mypasspod" \
-e MYSQL_DATABASE="wp" \
-e MYSQL_USER="wordpresspod" \
-e MYSQL_PASSWORD="w0rdpr3sspod" \
--name=wptest-db mariadb
```

* Creamos el conetendor de WordPress y lo configuramos para que conecte a la BD creada anteriormente.

```
sudo podman run \
-d --restart=always --pod=my-pod \
-e WORDPRESS_DB_NAME="wp" \
-e WORDPRESS_DB_USER="wordpresspod" \
-e WORDPRESS_DB_PASSWORD="w0rdpr3sspod" \
-e WORDPRESS_DB_HOST="127.0.0.1" \
--name wptest-web wordpress
```

* Comprobamos el correcto funcionamiento accediendo desde el navegador, como se muestra a continuación.

![podman ejecucion](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema6/img/podmanEjecucion.png)

Se ha usado este [enlace](https://www.redhat.com/sysadmin/compose-podman-pods) para crear estos dos contenedores.

## Ejercicio 2. Usar un miniframework REST para crear un servicio web y introducirlo en un contenedor, y componerlo con un cliente REST que sea el que finalmente se ejecuta y sirve como "frontend".

Copiamos el contenido del ejercicio 6 del tema 3, ya que es el mismo ejercicio.

Enlace a ejercicio 6 del tema 3 [aquí](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema3/ejercicios.md#ejercicio-6-usar-un-miniframework-rest-para-crear-un-servicio-web-y-introducirlo-en-un-contenedor-y-componerlo-con-un-cliente-rest-que-sea-el-que-finalmente-se-ejecuta-y-sirve-como-frontend).

Para este ejericio vamos a usar una api rest de R con la libreria plumber y vamos a crear una api que va a hacer de frontend con ruby sinatra.

Para ello primero vamos a crear una imagen docker para contener la api rest de R, para ello vamos a instalar la imagen **rocker/r-ver:latest** que tiene la instalación de R, después le agregamos la instalación de la libreria plumber. Para hacer esto creamos un [Dockerfile](https://github.com/CharlySM/EjerciciosCC2021/tree/main/tema3/src/ejer6/Dockerfile) que lo automatiza todo.

Ejecutamos con el comando.

```
sudo docker build -t ejer7  .
```

Ahora vamos a crear la api con sinatra que mandará una petición a la api en el contenedor y recibirá la respuesta. La api sinatra nos muestra el mensaje recibido por la api en R. La api ruby sinatra esta definida [aquí](https://github.com/CharlySM/EjerciciosCC2021/tree/main/tema3/src/ejer6/pruebaConnection)

Después ejecutamos la api de R con el siguiente comando.

```
sudo docker run --rm -p 8000:8000 ejer7
```

Ahora ejecutamos nuestra api ruby sinatra con el siguiente comando.

```
ruby app.rb
```

Ahora mostramos una imagen del funcionamiento de nuestra conexión entre la api de R y la api de frontend de ruby sinatra.

![ejercicio 6](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema3/img/ejer6a.png)

Esta conexión de api en R con api ruby sinatra se quiere hacer en el proyecto de la asignatura.
