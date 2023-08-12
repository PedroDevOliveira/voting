package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func users(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "pong",
	})
}

func main() {
	r := gin.Default()
	// Definindo as rotas
	api := r.Group("/api/v1")
	{
		api.GET("/users", users)
		api.GET("/products", users)
	}

	// Iniciando o servidor
	r.Run(":8080")
}
