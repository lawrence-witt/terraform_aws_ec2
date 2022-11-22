package app

import (
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/config"
	"github.com/lawrence-witt/terraform-aws-ec2-server/go/database"
	"gorm.io/gorm"
)

type Application struct {
	config *config.Config
	db     *gorm.DB
}

func NewApplication() (*Application, error) {
	config := config.MustLoad()
	db, err := database.ReadyStateDB(config.DB_URL)
	if err != nil {
		return nil, err
	}
	app := &Application{
		config: &config,
		db:     db,
	}
	return app, nil
}

func (a *Application) GetConfig() *config.Config {
	return a.config
}

func (a *Application) GetDB() *gorm.DB {
	return a.db
}

func (a *Application) Close() error {
	db, err := a.db.DB()
	if err != nil {
		return err
	}
	return db.Close()
}
