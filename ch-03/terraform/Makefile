# ---- General commands ----
validate:
	terraform fmt -recursive
# ---- General commands ----

# ---- State commands ------
init-shared-state:
	terraform -chdir=shared-state init

apply-shared-state:
	terraform -chdir=shared-state apply

all-shared-state: validate init-shared-state apply-shared-state

destroy-shared-state:
	terraform -chdir=shared-state destroy

all: all-shared-state

destroy: destroy-shared-state

# ---- State commands ------

# ---- VPC commands --------
init-vpc:
	terraform -chdir=clusters-vpc init

apply-vpc:
	terraform -chdir=clusters-vpc apply

all-vpc: validate init-vpc apply-vpc

destroy-vpc:
	terraform -chdir=shared-state destroy
# ---- VPC commands --------