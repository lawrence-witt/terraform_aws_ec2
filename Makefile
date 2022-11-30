create-infra:
	export TF_AUTO_APPROVE="-auto-approve" && \
	cd infra/service && \
	make apply
.PHONY: run-infra

drop-infra:
	export TF_AUTO_APPROVE="-auto-approve" && \
	cd infra/service && \
	make destroy && \
	cd ../storage && \
	export TF_VARS="-var db_instance_id=none" && \
	make init && \
	make destroy
.PHONY: drop-infra

create-app:
	docker compose -f docker/docker-compose.yml up -d
.PHONY: run-db

drop-app:
	docker compose -f docker/docker-compose.yml down
.PHONY: drop-db