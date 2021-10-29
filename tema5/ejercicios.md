## Ejericio 1. Realizar una aplicación básica que use algún microframework para devolver alguna estructura de datos del modelo que se viene usando en el curso u otra que se desee. La intención de este ejercicio es simplemente que se vea el funcionamiento básico de un microframework, especialmente si es alguno que, como express, tiene un generador de código. Se puede usar, por otro lado, el lenguaje y microframework que se desee.
Para este ejercicio se va a usar el lenguaje ruby que es el que se usa en la aplicación de la asignatura, para realizar la aplicación básica se va a usar la gema sinatra de ruby. Es uno de los microframework que se pueden usar en ruby tal y como se comenta [aquí](https://www.slant.co/topics/3523/~best-ruby-microframeworks).

En este caso vamos a devolver la estructura de datos que se usa como prueba para el proyecto de la asignatura, esta estructura esta en formato json y viene definida de la siguiente forma como vemos en la siguiente imagen y en el [fichero](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema5/src/estructura.json).

![estructura datos json](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema5/img/estructura.png)

Comprobamos desde la consola que se estan mandando las peticiones.

![peticiones](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema5/img/peticiones.png)

Comprobamos que funciona desde el navegador.

![navegador](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema5/img/navegador.png)

La api desarrollada se puede ver [aquí](https://github.com/CharlySM/EjerciciosCC2021/tree/main/tema5/src/ejer1).

## Programar un microservicio en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

Para este ejercicio vamos a autilizar la aplicación usada en el ejercicio anterior. Como ya tenemos creado una petición GET vamos a mantener esta petición y vamos a crear una nueva con post. Para esta petición vamos a añadir datos a nuestro fichero json del cual leemos datos con el get.

Para mandar la petición post hemos creado un formulario en el fichero index para mandar esta petición donde el único valor que se modifica sera el valor del equipo, el resto de valores se han escondido y añadido de forma aleatoria para ver el funcionamiento de la petición post.

Una vez que hemos ejecutado vemos el resultado de la ejecución.

![est modificada](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema5/img/estructuraModificada.png)

La nueva ruta se ha añadido en el fichero [index.rb.](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema5/src/ejer1/index.rb) Es una petición post llamada added.
 
Formulario de añadido del ejercicio 2.

![est modificada](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema5/img/formEjer2.png)
