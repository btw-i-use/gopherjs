FROM golang:1.18-alpine AS builder
COPY . /gopherjs
WORKDIR /gopherjs
RUN env CGO_ENABLED=0 go build

FROM golang:1.18
COPY --from=builder /gopherjs/gopherjs /usr/local/go/bin/gopherjs
