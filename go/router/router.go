package router

import (
	"github.com/julienschmidt/httprouter"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/app"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/handlers"
)

func NewRouter(app *app.Application) *httprouter.Router {
	mux := httprouter.New()
	mux.GET("/notes", handlers.GetNotes(app))
	mux.POST("/note", handlers.PostNote(app))
	return mux
}
