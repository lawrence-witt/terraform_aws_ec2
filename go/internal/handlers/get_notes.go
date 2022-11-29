package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/julienschmidt/httprouter"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/internal/app"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/internal/handlers/middleware"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/internal/models"
)

func getNotes(app *app.Application) httprouter.Handle {
	type response struct {
		Data []*models.Note `json:"data"`
	}

	return func(w http.ResponseWriter, r *http.Request, p httprouter.Params) {
		notes := []*models.Note{}
		err := app.GetDB().Find(&notes).Error
		if err != nil {
			w.WriteHeader(http.StatusBadRequest)
			w.Write(nil)
			return
		}
		res, err := json.Marshal(&response{Data: notes})
		if err != nil {
			w.WriteHeader(http.StatusBadRequest)
			w.Write(nil)
			return
		}
		w.WriteHeader(http.StatusOK)
		w.Write(res)
	}
}

func GetNotes(app *app.Application) httprouter.Handle {
	mwf := []middleware.Middleware{}
	return middleware.Chain(getNotes(app), mwf...)
}
