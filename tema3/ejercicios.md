# Ejercicios Tema 3: Contenedores y cómo usarlos
## Ejercicio 1: Buscar alguna demo interesante de Docker y ejecutarla localmente, o en su defecto, ejecutar la imagen anterior y ver cómo funciona y los procesos que se llevan a cabo la primera vez que se ejecuta y las siguientes ocasiones.

Para este ejercicio primero hemos instaldo docker en un sistema operativo ubuntu 20.04, para hacer esto hemos seguido este [enlace](https://docs.docker.com/engine/install/ubuntu/).

Después hemos probado que se ha instalado con exito ejecutando el siguiente comando.
```
sudo docker run hello-world
```

Después para la realización del ejercicio se ha ejecutado el comando:
```
sudo docker run --rm jjmerelo/docker-daleksay -f smiling-octopus Uso argumentos, ea
```
Donde se ha producido la siguiente ejecución:
![ejecución ejercicio 1](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema3/img/ejercicio1a.png)

Podemos observar que comprueba primero si la imagen existe, pero como en este caso no existía se ha descargado la imagen en la ultima versión.

Si se vuelve a ejecutar la imagen ya no ahce la busqueda y aparecerá la ejecución directamente.

## Ejercicio 2. Tomar algún programa simple, “Hola mundo” impreso desde el intérprete de línea de órdenes, y comparar el tamaño de las imágenes de diferentes sistemas operativos base, Fedora, CentOS y Alpine, por ejemplo.

Para este ejercicio se ha desarrollado el programa "hola mundo" en ruby se puede consultar el código [aquí](https://github.com/CharlySM/EjerciciosCC2021/tree/main/tema3/src/ejer2/HelloWorld.rb)

Ahora vamos a crear un fichero [Dockerfile](https://github.com/CharlySM/EjerciciosCC2021/tree/main/tema3/src/ejer2/Dockerfile) donde se prueban las imágenes. Para probar tenemos que descomentar las lineas FROM y RUN de la imagen que queremos y probar y comentar el resto.

Ahora construimos las correspondientes imágenes como sigue:
```
sudo docker build -t fedora_ejer2 .
sudo docker build -t alpine_ejer2 .
sudo docker build -t centos_ejer2 .
```
Para su ejecucion se va utilizar docker run con el el parametro --rm para cuando termine de ejecutarse, borre todo lo relacionado con él y ahorre espacio en el disco.

 Los comandos para la ejecución son:
 ```
docker run --rm fedora_ejer2
docker run --rm alpine_ejer2
docker run --rm centos_ejer2
 ```

 A continuación podemos ver una ejecución de las imágenes creadas.

 ![ejecución ejercicio 2](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema3/img/ejecucionEjer2.png)

 Mostramos la imagenes para poder comprobar lo que ocupa en disco.

 ![imagenes ejercicio 2](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema3/img/imagenes.png)

Podemos ver que la imagen que menos ocupa es la imagen de alpine, después la que menos ocupa es la de centos y por último la que más ocupa es la de fedora.

## Ejercicio 3. Crear a partir del contenedor anterior una imagen persistente con commit.

Para hacer este ejercicio vamos a utilizar el siguiente comando.

```
docker commit <CONTAINER_ID> <nombre_image_persistente>
```

Los comandos que se han usado para hacer el ejercicio han sido:

```
sudo docker ps -ls
sudo docker run centos_ejer2
sudo docker ps -l
sudo docker commit a1a8be48f07b centos_ejer2_commit
sudo docker images
```

A continuación mostramos la ejecución de los comandos.

![ejercicio 3](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema3/img/ejercicio3.png)

## Ejercicio 4. Examinar la estructura de capas que se forma al crear imágenes nuevas a partir de contenedores que se hayan estado ejecutando.
 Para este ejercicio vamos a usar la herramienta jq, primero la instalamos con el comando.

 ```
 sudo apt install jq
 ```

Después ahora vamos a visualizar la estructura por capas lanzando el siguiente comando.

```
sudo cat /var/lib/docker/image/overlay2/imagedb/content/sha256/f14ead945662cf6e69f4bac7b8ec86c4b063c9c46489e01a0161cfdd45bd8f11 | jq .
```

Cuando ejecutamos obtenemos la siguiente imagen.

![ejercicio 4](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema3/img/ejer4a.png)
![ejercicio 4](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema3/img/ejer4b.png)
![ejercicio 4](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema3/img/ejer4c.png)

De estas imágenes la parte que nos interesa esta en la última imagen donde la parte señalada es la estructura por capas formada.

## Ejercicio 5. Crear un volumen y usarlo, por ejemplo, para escribir la salida de un programa determinado.

Para este ejercicio vamos a guardar la salida de un programa ruby. Para ello vamos a construir un volumen con alpine para ejecutarlo y guardar la salida.
- Primero creamos un [Dockerfile](https://github.com/CharlySM/EjerciciosCC2021/tree/main/tema3/src/ejer5/Dockerfile) para construir el volumen con alpine y ejecutar el programa en ruby.
- Ahora ejecutamos los comandos siguientes para la realización del ejercicio.
```
sudo docker volume create ejer5

sudo docker volume list

sudo docker build --no-cache -t alpine_ejer5 -f Dockerfile .

sudo docker run --mount source=ejer5,destination=/prueba alpine_ejer5
```

En las siguientes imágenes vemos como ha ido todo bien a la hora de ejecutar.

![ejercicio 5](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema3/img/ejer5a.png)
![ejercicio 5](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema3/img/ejer5b.png)

## Ejercicio 6. Usar un miniframework REST para crear un servicio web y introducirlo en un contenedor, y componerlo con un cliente REST que sea el que finalmente se ejecuta y sirve como "frontend".

Para este ejericio vamos a usar una api rest de R con la libreria plumber y vamos a crear una api que va a hacer de frontend con ruby sinatra.

Para ello primero vamos a crear una imagen docker para contener la api rest de R, para ello vamos a instalar la imagen **rocker/r-ver:latest** que tiene la instalación de R, después le agregamos la instalación de la libreria plumber. Para hacer esto creamos un [Dockerfile](https://github.com/CharlySM/EjerciciosCC2021/tree/main/tema3/src/ejer6/Dockerfile) que lo auomatiza todo.

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

## Ejercicio 7. Reproducir los contenedores creados anteriormente usando un Dockerfile.

Esto se ha realizado en el ejericio 5
