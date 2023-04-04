init-shared-state:
	terraform -chdir=shared-state init

apply-shared-state:
	terraform -chdir=shared-state apply

validate:
	terraform fmt -recursive

all-shared-state: validate init-shared-state apply-shared-state

destroy-shared-state:
	terraform -chdir=shared-state destroy

all: all-shared-state

destroy: destroy-shared-state