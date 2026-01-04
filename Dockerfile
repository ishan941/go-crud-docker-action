#Builder

FROM golang:1.25-alpine AS Builder
WORKDIR /app

COPY go.mod go.sum ./
RUN  go mod download
COPY . .
RUN go build -o main .


#Minimal image
FROM alpine:latest
WORKDIR /app
RUN apk add --no-cache ca-certificates
COPY --from=builder /app/main .
COPY .env .
EXPOSE 8080
CMD ["./main"]