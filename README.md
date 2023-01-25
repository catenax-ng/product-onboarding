# Product Onboarding Repository

This repository contains all necessary parts to onboard a Catena-X product to consortia environments.

## Kubernetes / Argocd related Parts

The `cluster` folder contains all available clusters, in the `cluster/<clustername>/kustomization.yaml` we describe on which cluster the products with the declared permissions are deployed.

For each product based on their permissions on the clusters we declare the following Kubernetes cluster ressources.

- argo-project
- argo-vault-plugin-secret
- namespace

> Example:  
> `../../argocd/product-example/read-write`  
> has read-write permission on the cluster devsecops-testing  
> and it is declared on the cluster  
> `cluster/devsecops-testing/kustomization.yaml`

More Information can be found under argocd Folder: [README.md](argocd/README.md)

## GitHub related parts

We are providing all github repositorys and github organisation teams via an `terraform.tfvars`.

Description  of the to be added GitHub teams / GitHub repositories / GitHub repository-teams-mapping can be found in `github/terraform.tfvars` and if we want to create a new Repo/Team/Mapping we need to add all of the following.

- 'New' Github Repository
- 'New' Github Team
- 'New' Mapping between Github Repository and Github Team

More information can be found under the github folder: [README.md](github/README.md)

## Vault related parts

We are providing all product-teams `Vault` access with their Secrets Engine where they can store their own  Key/Value pairs based on the `gh-product-team-name`.

Description of the product to be added to vault can be found in `vault/terraform.tfvars`.

More information can be found under vault folder: [README](vault/README.md)

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

## General run of Terraform scripts for new product

Following steps have to be done in the given order, otherwise there could be problems with other developments done in
parallel:

1. create a new branch
2. create new product-team-folder under `argocd`
3. modify k8s ressources and names after new-product-team requirements
4. add new `kustomization.yaml` entry in which cluster-environment with permission level the new product should enabled
5. switch to `github` folder
6. add gh-repo / gh-teams / gh-repo-teams-mapping entries in `github/terraform.tfvars`
7. do a `terraform plan` to check if the changes meet your expectations
8. switch to `vault` folder
9. add vault entry in `vault/terraform.tfvars`
10. do a `terraform plan` to check if the changes meet your expectations
11. create a PR and merge into <https://github.com/catenax-ng/product-onboarding/main>
12. valdation under ArgoCD based on the target environment <https://argo.ADD-ENVIRONMENTNAME.demo.catena-x.net/>

Script, at first **terraform has to be initialized** as described in this under [Prerequisites for Terraform](/PREREQUISITES.md)

The check of the changes with 'terraform plan' and creation with 'terraform apply' which can be done after every terraform change or only at the end of all necessary changes is also described in the [README.md](https://github.com/catenax-ng/product-onboarding/blob/main/github/README.md).

For an 'terraform apply' and a 'terraform plan' command the following command line variables has to be set, see [prequrequisites](/PREREQUISITES.md).

## Create Pull Request

After you have created / modified the files for the new product-team e.g.product-example

- `argocd/product-example/base-read-only/resources/argo-project.yaml`
- `argocd/product-example/base-read-only/resources/avp-secret.yaml`
- `argocd/product-example/base-read-only/resources/avp-secret.yaml`
- `cluster/devsecops-testing/kustomization.yaml`

create a PR for your branch. After the PR has been approved and merged into main branch, the new team will be
automatically deployed to cluster environment (via ArgoCD application over the `_<ENVIRONMENT>-config_` at ArgoCD within the `_CORE_` cluster).

Only after the merge in GitHub and the `terraform apply` have been done, the terraform state is consistent, otherwise changes which are applied in parallel by someone else might be deleted again.
