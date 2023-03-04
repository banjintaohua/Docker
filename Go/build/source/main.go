package main

import (
	"fmt"
	"log"
	"net"
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/gorilla/mux"
)

var (
	logger        *log.Logger
	serverAddress = ":8080"
	readTimeout   = time.Duration(5)
	writeTimeout  = time.Duration(10)
	idleTimeout   = time.Duration(120)
)

func getClientIp(request *http.Request) string {
	xForwardedFor := request.Header.Get("X-Forwarded-For")
	ip := strings.TrimSpace(strings.Split(xForwardedFor, ",")[0])
	if ip != "" {
		return ip
	}

	ip = strings.TrimSpace(request.Header.Get("X-Real-Ip"))
	if ip != "" {
		return ip
	}

	if ip, _, err := net.SplitHostPort(strings.TrimSpace(request.RemoteAddr)); err == nil {
		return ip
	}

	return ""
}

func indexHandler(writer http.ResponseWriter, request *http.Request) {
	writer.Header().Set("Content-Type", "text/plain")
	writer.WriteHeader(http.StatusOK)

	_, err := writer.Write([]byte(fmt.Sprintf("Client IP is %s", getClientIp(request))))
	if err != nil {
		logger.Println("writer message failed")
		return
	}
}

func main() {
	logger = log.New(os.Stdout, "demo-http-server ", log.LstdFlags|log.Lshortfile)
	router := mux.NewRouter()
	router.HandleFunc("/", indexHandler)

	server := &http.Server{
		Addr:         serverAddress,
		ReadTimeout:  readTimeout * time.Second,
		WriteTimeout: writeTimeout * time.Second,
		IdleTimeout:  idleTimeout * time.Second,
		Handler:      router,
	}

	logger.Println("server started")
	if err := server.ListenAndServe(); err != nil {
		panic(err)
	}
}
