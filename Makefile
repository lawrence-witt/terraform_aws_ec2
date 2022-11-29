create-infra:
	export TF_AUTO_APPROVE=-auto-approve && cd infra && make apply
.PHONY: run-infra

drop-infra:
	export TF_AUTO_APPROVE=-auto-approve && cd infra && make destroy
.PHONY: drop-infra

create-app:
	docker compose -f docker/docker-compose.yml up -d
.PHONY: run-db

drop-app:
	docker compose -f docker/docker-compose.yml down
.PHONY: drop-db