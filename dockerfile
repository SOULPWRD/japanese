
FROM golang:1.24.0 AS build
WORKDIR /app

ARG VERSION=0.9.9
ENV VERSION=${VERSION}

RUN wget https://github.com/BrianWill/japanese_vocab/archive/refs/tags/v${VERSION}.tar.gz
RUN tar -xvzf v${VERSION}.tar.gz

COPY japanese_vocab-${VERSION} .

RUN cd ./app \
    go get && \
    go build -o japanese

WORKDIR /app/app
EXPOSE 8080
CMD [ "./japanese" ]