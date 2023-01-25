# Requirements for Internal System Team Members

Our current environments are running in Azure Cloud based on Azure Kubernetes Service and were managed or deployed with Terraform scripts. The following Tools are required to run theese scripts.

## Azure CLI

Using our Azure Subscription you have to be invited to our Subscription and installed Azure CLI.
Links to our Subsrciption ()

- [Azure CLI Installing Guidelines](https://learn.microsoft.com/en-us/cli/azure)

You have to be invited to our Azure Subscription on [Azure-Portal](https://portal.azure.com/#@catenax.onmicrosoft.com)

Login to Azure on CLI for help, just ask a System Team Internal Member who has already done that.

``` bash
az login --tenant <Catena-X-TenantID>
az account set --subscription <SubscriptionID>
## Get Kubeconfig Details for earch Kubernetes Cluster
az aks get-credentials --resource-group <RessourceGroup-of-desired-Cluster> --name <AzureName-of-Kubernetes-Cluster>
## Testing which kubenetes contexts you allready have
kubectl config get-contexts        
```

## Terraform

- [Terraform Installing Guidelines](https://developer.hashicorp.com/terraform/downloads)

``` bash
# Installation for terraform autocomplete for autocompletion of terraform cmd's
terraform -install-autocomplete
# Reload your Terminal / CLI  based on your Working OS
# Testing if autocompletion is working install / init should appeare
terraform i
# Switch to a terraform file-directory for e.g our github-folder and initialize terraform
terraform init
```

- enable your CLI


For `terraform apply` and `terraform plan` command the following command line variables has to be exported from our `Vault` and set:

```shell
# You can get a login token, by logging into the Vault web UI and using 'copy token' from the top right user menu.
export VAULT_TOKEN=<your-vault-token-or-root-token>
# The OIDC settings that needs to be specified is the client-id and the client-secret for DEX. 
# You can find this information in our devsecops secret engine in Vault web UI 
# under path `devsecops/clusters/vault/github-oauth`.
export TF_VAR_vault_oidc_client_id=<client-id-copied-from-vault>
export TF_VAR_vault_oidc_client_secret=<client-secret-copied-from-vault>
# your PAT = personal access token for Github has to be created.
export TF_VAR_github_token=<github-pat>
```
