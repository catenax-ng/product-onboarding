# Product Onboarding Repository
This repository contains all necessary parts to onboard a Catena-X product to consortia environments.

## Requirements for Internal System Team Members

Our current environments are running in Azure Cloud based on Azure Kubernetes Service and were managed or deployed with Terraform scripts. The following Tools are required to run theese scripts.

### Azure
Using our Azure Subscription you have to be invited to our Subscription and installed Azure CLI. 
Links to our Subsrciption ()

-  [Azure CLI Installing Guidelines](https://learn.microsoft.com/en-us/cli/azure)

You had to be invited to our Azure Subscription on [Azure-Portal](https://portal.azure.com/#@catenax.onmicrosoft.com)

Login to Azure on CLI for help, just ask an System Team Internal Member who has allready done that.

``` bash
az login --tenant <Catena-X-TenantID>
az account set --subscription <SubscriptionID>
## Get Kubeconfig Details for earch Kubernetes Cluster
az aks get-credentials --resource-group <RessourceGroup-of-desired-Cluster> --name <AzureName-of-Kubernetes-Cluster>
## Testing which kubenetes contexts you allready have
kubectl config get-contexts        
```

### Terraform

- [Terraform Installing Guidelines](https://developer.hashicorp.com/terraform/downloads)


``` bash
# Installation for terraform autocomplete
terraform -install-autocomplete
# Reload CLI 
source ~/.bashrc 
# Testing if autocompletion is working
terraform i
# Switch to a terraform file-directory and initialize terraform
terraform init 
```

## Kubernetes / Argocd

In `cluster` folder are all available clusters, in the `cluster/<clustername>/kustomization.yaml` we describe which product is deployed on the each cluster with the decleared permission level for the product on the target cluster.

For each product based on their permissions on the clusters we declare the following Kubernetes cluster ressources.

- argo-project
- argo-vault-plugin-secret
- namespace

> Example:  
>  `../../argocd/product-example/read-write`  
> has read-write permission on the cluster devsecops-testing  
> and it is declared on the cluster  
> `cluster/devsecops-testing/kustomization.yaml`


### Product Onboard Repository Folder Structure
```text
.
├── [...]
├── argocd
│  └── product-example
│      ├── base-read-only
│      │   ├── kustomization.yaml
│      │   └── resources
│      │       ├── argo-project.yaml
│      │       ├── avp-secret.yaml
│      │       └── namespace.yaml
│      └── read-write
│         ├── kustomization.yaml
│         └── resources
│             ├── argo-project.yaml
│             └── namespace.yaml
└── cluster
    ├── README.md
    ├── beta
    │   └── kustomization.yaml
    ├── dev
    │   └── kustomization.yaml
    ├── devsecops-testing
    │   └── kustomization.yaml
    ├── int
    │   └── kustomization.yaml    
    └── pre-prod
        └── kustomization.yaml
```

## GitHub

We are providing all github repositorys and github organisation teams via an `terraform.tfvars`.

Discription  of the to be added github teams / github repositorys / github repository-teams-mapping can be found in `github/terraform.tfvars` and if we want to create a new Repo/Team/Mapping we need to add all of the following.

- 'New' Github Repository
- 'New' Github Teams
- 'New' Mapping between Github Repository and Github Team

More Information can be found under:  [Github README](github/README.md)

## Vault

We are providing for all product-teams vaults with their related Key/Value pairs based on the gh-product-team-name.

Discription  of the to be added product vault can be found in `vault/terraform.tfvars`.

More Information can be found under:  [Vault README](vault/README.md)

## General run of Terraform scripts for new product

Following steps have to be done in the given order, otherwise there could be problems with other developments done in
parallel:

1. create a new branch
2. make changes / create new product-team-folder under `argocd`
3. modify k8s ressources after new-product-team requirements
4. switch to `github` folder
5. add gh-repo / gh-teams / gh-repo-teams-mapping entries in `github/terraform.tfvars`
6. do a terraform plan to check if the changes meet your expectations
7. switch to `vault` folder
8. add vault entry in `vault/terraform.tfvars`
9. do a terraform plan to check if the changes meet your expectations
10. create a PR and merge into https://github.com/catenax-ng/product-onboarding/main
11. valdation under ArgoCD

Script, at first **terraform has to be initialized** as described in this [README.md](github/README.md) under [Terraform](#terraform)

switch to filedirectory 
[github](https://github.com/catenax-ng/product-onboarding/blob/main/github).

Here you can add the new product as also described in `github/terraform.tfvars`

The check of the changes with 'terraform plan' and creation with 'terraform apply' which can be done after every terraform change or only at the end of all necessary changes is also described in the 
[README.md](https://github.com/catenax-ng/product-onboarding/blob/main/github/README.md).

For 'terraform apply' and 'terraform plan' command the following command line variables has to be set:

```shell
# You can get a login token, by logging into the Vault web UI and using 'copy token' from the top right user menu
export VAULT_TOKEN=<your-vault-token-or-root-token>
# The OIDC settings that needs to be specified is the client-id and the client-secret for DEX. You can find this
information in our devsecops secret engine in vault at path `devsecops/clusters/vault/github-oauth`.
export TF_VAR_vault_oidc_client_id=<client-id-copied-from-vault>
export TF_VAR_vault_oidc_client_secret=<client-secret-copied-from-vault>
# A Github personal access token has to be created.
export TF_VAR_github_token=<github-pat>
```

```shell
cd /github
# modification whitin terraform.tfvars
terraform plan -out github-new-project.plan
# verify github related information within plan
terraform apply "github-new-project.plan"
cd /vault 
# modification whitin terraform.tfvars
terraform plan -out vault-new-project.plan
# verify vault related information within plan
terraform apply "vault-new-project.plan"
```

### Create Pull Request

After you have created / modified the files for the new product-team e.g.product-example

- `argocd/product-example/base-read-only/resources/argo-project.yaml`
- `argocd/product-example/base-read-only/resources/avp-secret.yaml`
- `argocd/product-example/base-read-only/resources/avp-secret.yaml`
- `cluster/devsecops-testing/kustomization.yaml`

create a PR for your branch. After the PR has been approved and merged into main branch, the new team will be
automatically deployed to cluster environment (via ArgoCD application over the _<clusers>-config_ at ArgoCD within the _CORE_ cluster).

Only after the merge in Github and the terraform apply have been done, the terraform state is consistent.
Otherwise changes which are applied in parallel by someone else might be deleted again.
