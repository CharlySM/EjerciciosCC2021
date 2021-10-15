#Imagen y versión que usaremos de base
FROM fedora:latest
#FROM alpine:latest
#FROM centos:latest

## Instalamos ruby
#Descomentar para fedora
RUN dnf install -y ruby

#Descomentar para alpine
#RUN apk add --no-cache ruby

#Descomentar para centos
#RUN yum install -y ruby

#Creamos el directorio de trabajo

WORKDIR /usr/src/app

#Se copia la aplicación al contenedor

COPY . .

#Definimos la acción a ejecutar para levantar nuestra aplicación

CMD ["ruby","HelloWorld.rb"]
