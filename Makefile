apply:
	cd infra && terraform apply
.PHONY: apply

run-api:
	cd go && go run ./main.go
.PHONY: run-api

create-db:
	cd docker && docker compose up -d
.PHONY: run-db

drop-db:
	cd docker && docker compose down
.PHONY: drop-db