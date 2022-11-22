package process

import (
	"log"
	"os"
	"os/signal"
	"syscall"
)

func OnExit(cb func()) {
	sigs := make(chan os.Signal, 1)
	terminate := make(chan bool, 1)
	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)

	go func() {
		sig := <-sigs
		log.Println("Exit Reason: ", sig, ".")
		terminate <- true
	}()

	<-terminate
	cb()
	log.Println("Exiting Program.")
}
