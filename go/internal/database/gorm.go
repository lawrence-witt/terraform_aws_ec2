package database

import (
	"fmt"

	"github.com/lawrence-witt/terraform-aws-ec2-server/go/internal/models"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func ReadyStateDB(databaseURL string) (*gorm.DB, error) {
	db, err := NewPostgresDatabase(databaseURL)
	if err != nil {
		return nil, fmt.Errorf("error getting postgres connection %w: ", err)
	}

	err = MigrateDbSchema(db)
	if err != nil {
		return nil, fmt.Errorf("error migrating database schema %w: ", err)
	}

	return db, nil
}

func MigrateDbSchema(db *gorm.DB) error {
	m := []interface{}{
		models.Note{},
	}
	return db.AutoMigrate(
		m...,
	)
}

func NewPostgresDatabase(databaseURL string) (*gorm.DB, error) {
	return gorm.Open(postgres.New(postgres.Config{
		DSN: databaseURL,
	}), &gorm.Config{})
}
