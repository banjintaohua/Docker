package main

import (
	"fmt"
	"log"
	"net"
	"net/http"
	"net/http/pprof"
	"os"
	"strings"
)

var logger = log.New(os.Stdout, "demo-http-server ", log.LstdFlags|log.Lshortfile)

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

	serveMux := http.NewServeMux()
	serveMux.HandleFunc("/debug/pprof/", pprof.Index)
	serveMux.HandleFunc("/debug/pprof/cmdline", pprof.Cmdline)
	serveMux.HandleFunc("/debug/pprof/profile", pprof.Profile)
	serveMux.HandleFunc("/debug/pprof/symbol", pprof.Symbol)
	serveMux.HandleFunc("/debug/pprof/trace", pprof.Trace)
	serveMux.HandleFunc("/", indexHandler)

	logger.Println("server started")
	if err := http.ListenAndServe(":8080", serveMux); err != nil {
		panic(err)
	}
}
