package config

import (
	"fmt"

	"github.com/kelseyhightower/envconfig"
)

type Config struct {
	DB_URL string `envconfig:"DB_URL" default:"postgresql://user:password@localhost:5432/taes?sslmode=disable"`
	Host   string `envconfig:"HOST" default:"0.0.0.0"`
	Port   string `envconfig:"PORT" default:"8080"`
}

func Load() (Config, error) {
	var c Config
	err := envconfig.Process("", &c)
	return c, err
}

func MustLoad() Config {
	config, err := Load()
	if err != nil {
		panic(err)
	}
	return config
}

func (c *Config) GetAddress() string {
	return fmt.Sprintf("%s:%s", c.Host, c.Port)
}
