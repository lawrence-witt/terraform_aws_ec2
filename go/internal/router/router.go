package router

import (
	"github.com/julienschmidt/httprouter"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/internal/app"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/internal/handlers"
)

func NewRouter(app *app.Application) *httprouter.Router {
	mux := httprouter.New()
	mux.GET("/notes", handlers.GetNotes(app))
	mux.POST("/note", handlers.PostNote(app))
	return mux
}
