# Desarrollo basado en pruebas.

## Ejercicio 1. Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

Para hacer estos ejercicios se usa un terminal con sistema operativo de ubuntu 20.04.

En primer lugar instalamos rbenv. Para eso clonamos el repo de rbenv de github primero de la siguinete manera.
```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
```

Añadimos ```~/.rbenv/bin``` al PATH.

```
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
```
Ahora iniciamos rbenv en nuestro sistema.

```
~/.rbenv/bin/rbenv init
```

Como vamos a instalar vesiones nuevas tenemos que instalar ruby-build. Para ello hacemos lo siguiente.
Creamos un directorio dentro de la carpeta de rbenv llamado plugins.

```
mkdir -p "$(rbenv root)"/plugins
```

Luego clonamos desde el repositorio de github de ruby-build.

```
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```

Actualizamos los repositorios de rbenv y de ruby-build con.

```
cd ~/.rbenv
git pull
cd ~/.rbenv/plugins/ruby-build
git pull
```

Instalamos la versión mayor existente estable.

```
rbenv install 2.7.2
```

![Instalation version 2.7.2](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema2/img/installingRuby-2.7.2.PNG)

Como no existe versión 4.x de ruby instalamos la versión minor mas actual de 2.7.x, en este caso es la versión 2.7.0.
```
rbenv install 2.7.0
```

![Instalation version 2.7.0](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema2/img/installingRuby-2.7.0.PNG)

Como no hay versión 0.11 vamos a instalar la versión 2.7.1 que es una versión impar.

```
rbenv install 2.7.1
```
![Instalation version 2.7.1](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema2/img/installingRuby-2.7.1.PNG)

## Ejercicio 2. Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

Para crear el fichero de descripción del módulo hemos usado un repositorio Ejercicio-Ruby del usuario Charly_SM.

El código creado esta en ruby asi que el fichero generado de descripción del módulo esta en ruby. Ruby usa unos ficheros llamados Gemfiles para hacer estas descripciones.

En este repositorio solo se usan dos dependencias.

Para generar en Gemfile se necesita tener instaldo Ruby y después se instala bundle con:

```
sudo gem install bundle
```

Después de estas instalaciones ejecutamos:

```
bundle init
```

Se crea un fichero gemfile con las dependencias y el enlace del repositorio de github.
Las dependencias se han tenido que añadir pero se puede hacer automáticamente creando un ficherocon la terminación .gemspec donde se podría la descripción de una gema por fichero y para añadir esta gema se usa el comando:
```
bundle init -gemspec name.gemspec
```

Siendo name el nombre del fichero.

En este caso el Gemfile generado es el siguiente.

![Gemfile](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema2/img/Gemfile.PNG)

Enlace al repositorio del Gemfile [aqui](https://github.com/CharlySM/Ejercicio-Ruby).

## Ejercicio 3. Descargar el repositorio de ejemplo anterior, instalar las herramientas necesarias (principalmente Scala y sbt) y ejecutar el ejemplo desde sbt. Alternativamente, buscar otros marcos para REST en Scala tales como Finatra o Scalatra y probar los ejemplos que se incluyan en el repositorio.

Primero se ha instalado el jdk 1.8.201 y scala. Para ello se ha usado los siguientes comandos.
```
sudo apt install apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt update
sudo apt install adoptopenjdk-8-hotspot
sudo apt-get install scala
```

Después de esto se ha instalado la herramienta sbt, para ello se ha usado el siguiente comando.

```
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get update
sudo apt-get install sbt
```

Después se compila el proyecto spray-test y se lanzan los tests.
![ejecucion tests](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema2/img/testSpray.PNG)

## Ejercicio 4. Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga. A continuación, ejecutarlos desde mocha (u otro módulo de test de alto nivel), usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.


## Ejercicio 5. Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.

Primero vamos a la página de travis nos logueamos con nuestra cuenta de github y aceptamos lo que nos pide travis para poder usarlo.

![autorizacion travis](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema2/img/travis1.PNG)

Después vemos como podemos acceder a travis con nuestra cuenta de github, en mi caso ya tenia acceso ya que en la asignatura de IV del grado de informática se uso travis con esta misma cuenta, en la imagen siguiente se puede ver un ejemplo de test pasado con travis para el proyecto de la asignatura IV, del grado de informática de la UGR.

![acceso travis](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema2/img/travis2.PNG)

Lo que hacemos ahora es añadir un nuevo repositorio a travis, este repositorio es el del proyecto de CC del master de ingeniería informática de la UGR.

![acceso travis](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema2/img/travis3.PNG)
