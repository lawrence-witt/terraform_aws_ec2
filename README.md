# Terraform AWS EC2 #

Securely deploying a containerized Go HTTP server and Postgres Database to AWS using Terraform.

## Secrets ##

### Terraform Cloud Variables ###

These secrets are declared in the workspace variables for the project on Terraform Cloud.

- `aws_secret_key`: the secret key of the AWS user.
- `aws_access_key`: the access key of the AWS user.
- `ssh_pub_key`: the public key of the SSH key pair used to access provisioned instances.

### GitHub Actions Secrets ###

These secrets are declared in the secrets section of the GitHub repository.

- `TF_API_KEY`: the access token for the user's Terraform Cloud account.
- `SSH_PRIVATE_KEY`: the private key of the SSH key pair used to access provisioned instances.
- `DOCKER_USER`: the user of the Docker Hub account.
- `DOCKER_PASSWORD`: the password of the Docker Hub user.
- `POSTGRES_DB`: the name of the Postgres database.
- `POSTGRES_USER`: the user of the Postgres database.
- `POSTGRES_PASSWORD`: the password of the Postgres database user.