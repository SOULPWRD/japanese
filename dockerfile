
FROM golang:1.24.0 AS build
WORKDIR /app

ARG VERSION=0.9.9
ENV VERSION=${VERSION}

RUN wget https://github.com/BrianWill/japanese_vocab/archive/refs/tags/v${VERSION}.tar.gz
RUN tar --strip-components=1 -zxvf v${VERSION}.tar.gz
RUN rm v${VERSION}.tar.gz
RUN cd ./app \
    go get && \
    go build -o build

WORKDIR /app/app
EXPOSE 8080
CMD [ "./build" ]