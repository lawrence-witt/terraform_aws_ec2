package handlers

import (
	"encoding/json"
	"io/ioutil"
	"net/http"

	"github.com/google/uuid"
	"github.com/julienschmidt/httprouter"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/internal/app"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/internal/handlers/middleware"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/internal/models"
)

func postNote(app *app.Application) httprouter.Handle {
	type request struct {
		Content string `json:"content"`
	}
	type response struct {
		Data string `json:"data"`
	}

	return func(w http.ResponseWriter, r *http.Request, p httprouter.Params) {
		body, err := ioutil.ReadAll(r.Body)
		if err != nil {
			w.WriteHeader(http.StatusBadRequest)
			w.Write(nil)
			return
		}
		req := request{}
		err = json.Unmarshal(body, &req)
		if err != nil {
			w.WriteHeader(http.StatusBadRequest)
			w.Write(nil)
			return
		}
		note := models.Note{
			ID:      uuid.New().String(),
			Content: req.Content,
		}
		err = app.GetDB().Create(&note).Error
		if err != nil {
			w.WriteHeader(http.StatusBadRequest)
			w.Write(nil)
			return
		}
		res, err := json.Marshal(&response{Data: "ok"})
		if err != nil {
			w.WriteHeader(http.StatusBadRequest)
			w.Write(nil)
			return
		}
		w.WriteHeader(http.StatusOK)
		w.Write(res)
	}
}

func PostNote(app *app.Application) httprouter.Handle {
	mwf := []middleware.Middleware{}
	return middleware.Chain(postNote(app), mwf...)
}
