# Product Onboarding Repository

This repository contains all necessary parts to onboard a Catena-X product to consortia environments.

## Repository structure

### Argo Cd related parts / Kubernetes cluster

The [argocd](argocd) folder contains all available product resource files.

The [cluster](cluster) folder contains all available clusters, in the `cluster/<CLUSTERNAME>/kustomization.yaml` we describe each product that is deployed in the cluster based on their permission level.

More Information can be found under `argocd` Folder: [README.md](argocd/README.md)

### GitHub related parts

We are providing all GitHub repositorys and GitHub organisation teams via a Terraform Script [terraform.tfvars](github/terraform.tfvars).

Description  of the to be added GitHub teams / GitHub repositories / GitHub repository-teams-mapping can be found in `github/terraform.tfvars` 
if we want to create a new Repo/Team/Mapping we need to add all the following:

- new GitHub Repository
- new GitHub Team
- new Mapping between GitHub Repository and GitHub Team

More information can be found under the `github` folder: [README.md](github/README.md)

### Vault related parts

We are providing all product-teams Vault access with their Secrets Engine where they can store their own  Key/Value pairs based on the `gh-product-team-name`.

The new product Vault that has to be added can be found in `vault/terraform.tfvars`.

More information and ressource description can be found under `vault` folder: [README](vault/README.md)

### Product onboard  folder structure relation

- New product resources are listed in the [Argo Cd](argocd) folder, and here we declare read-only resources and read-write resources. 
- Our clusters are listed under [cluster](cluster) folder, and in each [kustomization.yml](cluster/devsecops-testing/kustomization.yaml) we define the products that are deployed on the specific cluster. 
- But based on the reference in we declare on the cluster `kustomization.yml` the resources will be provided on the cluster.
- GiHub folder is for new product-team GitHub team / repository / and the mapping between
- Vault folder is for new vault resources for the new product

> Example:
> - product-example within [argocd](argocd/product-example) 
> - cluster membership `../../argocd/product-example/read-write` in devsecops-testing [kustomization.yml](cluster/devsecops-testing/kustomization.yaml) 
> - product has read-write permission on the devsecops-testing cluster 
>   - but will also get the read-only "base" resources in the read-only folder [kustomization.yml](argocd/product-example/base-read-only/kustomization.yaml)
>   - because of referencing the read-only parts in read-write folder of the product-example
>   - see `bases: ../base-read-only` in read-write [kustomization.yml](argocd/product-example/read-write/kustomization.yaml)
> - related GitHub information you can find in Terraform variables in [github folder](github/terraform.tfvars)
> - related Vault information you can find in Terraform variables in [vault folder](vault/terraform.tfvars)

## Tooling for Terraform scripts for new products

Our current environments are running in Azure Cloud based on Azure Kubernetes Service and were managed or deployed with Terraform scripts. The following Tools are required to run these scripts.

### Azure CLI

Using our Azure Subscription you have to be invited to our Subscription and installed Azure CLI.
Links to our Subscription ()

- [Azure CLI Installing Guidelines](https://learn.microsoft.com/en-us/cli/azure)

You have to be invited to our Azure Subscription on [Azure-Portal](https://portal.azure.com/#@catenax.onmicrosoft.com)

``` bash
az login --tenant <Catena-X-TenantID>
az account set --subscription <SubscriptionID>
```

### Terraform

- [Terraform Installing Guidelines](https://developer.hashicorp.com/terraform/downloads)

> HINT: `terraform -install-autocomplete` is available if you need

## Onboarding a new product

### Product onboarding files

Following new product specific files have to be added:

- add the new product within [Argo Cd folder](argocd)
- add new product GitHub repository, team, repository-teams-mapping within [GitHub folder](github)
- add new product Vault under [Vault folder](vault)
- add new product entry in `kustomization.yaml` under [cluster folder](cluster) based on the cluster environment and the permission level


### Product onboarding instructions 

> Hint: scripting with Terraform, at first **terraform has to be initialized**

For `terraform plan` command, CLI variables have to be set which are described in each folder `README.md`

- [argocd](argocd)
- [github](github)
- [vault](vault)

###  Agreement for onboard Terraform scripting 

As an Agreement of The System Team we do our changes within separate branches.

If your Terraform plans will show your added new product information create a PR for `<your-branch>` into `main`.

After the PR has been approved and merged into main branch, the new team will be
automatically deployed to cluster environment (via ArgoCD application over the `_<ENVIRONMENT>-config_` at Argo CD within the `_CORE_` cluster).

> Only after the merge in GitHub and the `terraform apply` have been done, the terraform state is consistent, otherwise changes which are applied in parallel by someone else might be deleted again.

Validation can be done under ArgoCD based on the target environment <https://argo.ADD-ENVIRONMENTNAME.demo.catena-x.net/>
