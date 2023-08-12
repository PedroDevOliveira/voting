# Usar a versão oficial da imagem Golang
FROM golang:1.21.0 AS builder

# Definir o diretório de trabalho
WORKDIR /app

# Copiar e baixar dependências
COPY go.mod go.sum ./
RUN go mod download

# Copiar o código fonte
COPY . .

# Construir a aplicação
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./cmd/api/main.go

# Usar imagem mínima para a etapa final
FROM alpine:latest
RUN apk --no-cache add ca-certificates

# Copiar o binário
COPY --from=builder /app/main /app/main

# Executar a aplicação
CMD ["/app/main"]