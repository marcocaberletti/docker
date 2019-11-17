package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

var version = "1.0.0"

func info(w http.ResponseWriter, r *http.Request){
	fmt.Fprintf(w, "Healthcheck %s", version)
}

func healthcheck(w http.ResponseWriter, r *http.Request){
	target := os.Getenv("TARGET")
	log.Printf("Test %s", target)
	resp, err := http.Get(target)
	if err != nil {
		log.Println(err)
	}else {
		log.Printf("%d %s", resp.StatusCode, http.StatusText(resp.StatusCode))
		w.WriteHeader(resp.StatusCode)
	}
}

func main(){
	log.Println("Starting healthcheck app...")

	httpAddr := os.Getenv("HTTP_ADDR")
	target := os.Getenv("TARGET")

	if httpAddr == "" {
		httpAddr = "0.0.0.0:3000"
	}

	if target == "" {
		log.Fatal("No target provided!")
	}

	http.HandleFunc("/", info)
	http.HandleFunc("/healthcheck", healthcheck)

	log.Printf("Listening on %s", httpAddr)
	http.ListenAndServe(httpAddr, nil)
}
