FROM golang:1.18-alpine
# delve uses CGO, alternatively you could try ENV CGO_ENABLED=0
RUN apk add gcc
RUN apk add musl-dev 
 
# delve installed to /go/bin
RUN go install github.com/go-delve/delve/cmd/dlv@v1.8.3

# path to the project that you want to debug
WORKDIR /go/src/github.com/murphybytes/debugging

# 30123 is for Delve, 8080 is for Podtato 
EXPOSE 30123 8080

ENTRYPOINT [ "dlv", "debug", ".", "--listen=:30123", "--accept-multiclient", "--headless=true", "--api-version=2", "--build-flags=-buildvcs=false" ]


