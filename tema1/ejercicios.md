# Ejercicio 1
## Buscar una aplicación de ejemplo, preferiblemente propia, y deducir qué patrón es el que usa. ¿Qué habría que hacer para evolucionar a un patrón tipo microservicios?
Una aplicación que se hizo en la asignatura _tecnologías web_ de la **Universidad de Granada**. Era una aplicación que gestionaba el login de los usuarios en una página como la principal de la **UGR**. Donde había distintos tipos de usuarios y cada uno podía acceder a una información distinta.

Esta aplicación tenía una arquitectura por capas, las distintas capas eran: capa de almacenamiento, capa de aplicación y una capa de presentación.

La capa de almacenamiento consta de un gestor de base de datos, que creaba, borraba y actualizaba la información en la base de datos.

La capa de aplicación gestionaba las peticiones entre la capa de presentación y la capa de almacenamiento.

La capa de presentación muestra la información y cambios que realiza el usuario.

Para convertirlo en una arquitectura de microservicios, se tendría que realizar un microservicio por cada capa que se ha descrito, se puede usar el lenguaje que se quiera para convertirlo a una arquitectura microservicio, siempre que los lenguajes o lenguaje usado permíta convertirlo a la arquitectura microservicio deseada.

# Ejercicio 2
## En la aplicación que se ha usado como ejemplo en el ejercicio anterior, ¿podría usar diferentes lenguajes? ¿Qué almacenes de datos serían los más convenientes?
La aplicación del ejercicio anterior esta desarrollada con **PHP**, **HTML** y **CSS**. Se puede usar los lenguajes que se quieran ya que con la arquitectura microservcio cada parte es independiente de la otra, pero que los lenguajes usados permitan mantener la comunicación que se ha descrito antes.

Para la parte de almacenamiento la información que se almacenaba no era muy compleja ni era cambiante, por lo que se puede usar una base e datos relacional como se uso en la aplicacion, aunque también puede usarse una base de datos **NoSQL**, si se quiere, para la gestión se puede usar el lenguaje **java** dentro de un componente que tenga esta funcionalidad.

Para la capa de aplicación se uso **PHP**, se puede cambiar a otro lenguaje como **java** y crear un componente para manejar la lógica de la aplicación. Para la parte de presentación se uso **HTML** con **CSS**. Se puede usar **java** también con cualquiera de las librerías que te permiten crear la parte visual, de esta forma todos los componentes usan el mismo lenguaje y es mas fácil de integrarlos.
