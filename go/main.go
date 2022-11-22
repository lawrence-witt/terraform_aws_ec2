package main

import (
	"context"
	"errors"
	"fmt"
	"log"
	"net/http"

	"github.com/lawrence-witt/terraform-aws-ec2-server/go/app"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/process"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/router"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/server"
)

func main() {
	app, err := app.NewApplication()
	if err != nil {
		log.Fatalf("ould not create new application: %v", err)
	}

	srv := server.
		NewServer().
		WithAddr(app.GetConfig().GetAddress()).
		WithRouter(router.NewRouter(app))

	go func() {
		log.Print("Server Started...")
		if err := srv.ListenAndServe(); !errors.Is(err, http.ErrServerClosed) {
			log.Fatalln(fmt.Sprintf("could not start server: %v.", err))
		}
	}()

	process.OnExit(func() {
		if err := srv.Shutdown(context.Background()); err != nil {
			log.Fatalln(fmt.Sprintf("could not close server: %v.", err))
		}

		if err = app.Close(); err != nil {
			log.Fatalln(fmt.Sprintf("could not close app: %v.", err))
		}
	})
}
