FROM alpine:latest

RUN apk add --no-cache ruby

WORKDIR /usr/src/app

ADD . /prueba

COPY . .

CMD ["ruby","ejer5.rb"]
