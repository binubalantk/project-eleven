package main

import (
	"log"
	"net/http"

	api "serviceapi/pelvapi"
)

func main() {
	log.Printf("Server started")

	DefaultAPIService := api.NewDefaultAPIService()
	DefaultAPIController := api.NewDefaultAPIController(DefaultAPIService)

	router := api.NewRouter(DefaultAPIController)

	log.Fatal(http.ListenAndServe(":8080", router))
}
