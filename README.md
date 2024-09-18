# JIT PAM Terraform/OpenTofu demo


## Set-up

* Set up a service account to use for Cloud Build, which will do PAM elevation based on an entitlement and then request a grant
* Set up a GCS bucket manually for OpenTofu remote state
* Set up the Cloud Build repo, and build trigger against this repo

## Running 