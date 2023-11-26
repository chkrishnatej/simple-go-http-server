package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	log.Println("Starting the server....")
	http.HandleFunc("/hello", helloHandler)
	http.HandleFunc("/goodbye", goodbyeHandler)

	log.Fatal(http.ListenAndServe(":8081", nil))
}

func helloHandler(w http.ResponseWriter, r *http.Request) {
	log.Print("Received hit on `hello`")
	fmt.Fprint(w, "Hello, World!")
}

func goodbyeHandler(w http.ResponseWriter, r *http.Request) {
	log.Print("Received hit on `goodbye`")
	fmt.Fprint(w, "Goodbye, World!")
}
