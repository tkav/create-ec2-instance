TF_BACKEND = -backend-config "bucket=$(TFSTATE_BUCKET)" -backend-config "region=$(TF_VAR_region)"
TF_BACKEND_KEY = -backend-config "key=$(TFSTATE_KEY)"

.PHONY: init
init:
	cd ec2-instance && \
	terraform init -input=false $(TF_BACKEND) $(TF_BACKEND_KEY) && \
	terraform validate && \
	terraform fmt

.PHONY: plan
plan:
	cd ec2-instance && \
	terraform plan -out=tfplan -input=false

.PHONY: apply_plan
apply_plan:
	cd ec2-instance && \
	terraform apply "tfplan"

.PHONY: save_outputs
save_outputs:
	cd ec2-instance && \
	terraform output -json > ../outputs.json

.PHONY: process_outputs
process_outputs:
	echo '#!/bin/bash' > ec2-login.sh
	cat outputs.json | ~/homebrew/bin/jq -r '(.ssh_info.value)' >> ec2-login.sh

.PHONY: apply
apply:
	cd ec2-instance && \
	terraform apply -auto-approve

.PHONY: deploy
deploy: init apply save_outputs process_outputs

.PHONY: destroy
destroy:
	cd ec2-instance && \
	terraform destroy -auto-approve