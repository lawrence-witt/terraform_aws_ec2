package server

import (
	"errors"
	"log"
	"net/http"

	"github.com/julienschmidt/httprouter"
)

type Server struct {
	*http.Server
}

func NewServer() *Server {
	return &Server{&http.Server{}}
}

func (s *Server) WithAddr(addr string) *Server {
	s.Addr = addr
	return s
}

func (s *Server) WithErrLogger(l *log.Logger) *Server {
	s.ErrorLog = l
	return s
}

func (s *Server) WithRouter(router *httprouter.Router) *Server {
	s.Handler = router
	return s
}

func (s *Server) Start() error {
	if len(s.Addr) == 0 {
		return errors.New("Server missing address")
	}

	if s.Handler == nil {
		return errors.New("Server missing handler")
	}

	return s.ListenAndServe()
}

func (s *Server) Close() error {
	return s.Close()
}
