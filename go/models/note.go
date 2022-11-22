package models

type Note struct {
	ID      string `gorm:"id" json:"id"`
	Content string `gorm:"content" json:"content"`
}
