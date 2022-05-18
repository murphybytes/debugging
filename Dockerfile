FROM golang:1.17.8-alpine3.15 AS builder 

WORKDIR /app

COPY . . 

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o podtato . 

FROM scratch


COPY --from=builder /app/podtato /usr/bin/ 

ENTRYPOINT ["podtato"]

