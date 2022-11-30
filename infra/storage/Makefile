init:
	@terraform init
.PHONY: init

validate:
	@terraform validate
.PHONY: validate

fmt:
	@terraform fmt -recursive -check
.PHONY: fmt

apply:
	@terraform apply $(TF_AUTO_APPROVE) $(TF_VARS)
.PHONY: apply

plan:
	@terraform plan
.PHONY: plan

destroy:
	terraform destroy $(TF_AUTO_APPROVE) $(TF_VARS)
.PHONY: destroy