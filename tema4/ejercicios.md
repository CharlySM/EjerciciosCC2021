# Integración continua.

## 1. Ejercicio: Haced los dos primeros pasos antes de pasar al tercero en un repositorio de nuestra elección, tal como el del proyecto que se hace para la asignatura (que se hará en el ejercicio siguiente).

Esto se hizo en los ejercicios del tema 2 para pasar los test por lo que vamos a poner el mismo procedemiento que se realizó en ese momento.

Primero vamos a la página de travis nos logueamos con nuestra cuenta de github y aceptamos lo que nos pide travis para poder usarlo.

![autorizacion travis](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema2/img/travis1.PNG)

Después vemos como podemos acceder a travis con nuestra cuenta de github, en mi caso ya tenia acceso ya que en la asignatura de IV del grado de informática se uso travis con esta misma cuenta, en la imagen siguiente se puede ver un ejemplo de test pasado con travis para el proyecto de la asignatura IV, del grado de informática de la UGR.

![acceso travis](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema2/img/travis2.PNG)

Además vemos añadido el repositorio usado en convocatorias anteriores de la asignatura.

La configuracion del fichero para la ejecución en travis de los test se ha hecho de la siguiente forma:

![configuracion travis](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema4/img/configTravis.PNG)

Para la ejecución se lanza el comando rake que ejecuta el fichero Rakefile que contiene el siguiente contenido el fichero [Rakefile](https://github.com/CharlySM/ejercicioCI/blob/main/Rakefile).

![configuracion rakefile](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema4/img/rakefile.PNG)

Ahora vemos una configuración desde el repo en travis.


## 2. Ejercicio: Configurar integración continua para nuestra aplicación usando Travis o algún otro sitio.

Vamos a mostrar en una imagen la ejecución de los test del repositorio elegido que se puede ver [aquí](https://github.com/CharlySM/ejercicioCI)

![ejecucion](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema4/img/ejecucion.PNG)

También se puede añadir el badge en el README del proyecto para de un simple vistazo saber si ha fallado o ha pasado con exito los test realizados a través de travis. Y en caso de fallo poder pinchar y te lleva a travis para ver el log.

Para obtener el enlace del badge solo debemos pulsar en el badge build/passing que aparece en el estado del proyecto en travis y seleccionamos el formato que queramos, en nuestro caso Markdown.

![badge](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema4/img/badge.PNG)

Resultado de etiqueta en README:

![badge readme](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema4/img/badgeReadme.PNG)
