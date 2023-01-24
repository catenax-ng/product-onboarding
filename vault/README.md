# This folder contains Terraform scripting for Vault onboarding

**TLDR** one terraform run for all vault permissions for each product

In our case we have one Vault Cluster which is capable for all Vault information for each cluster and product.

## Add the new team to the list of product teams

Onboarding a new team is also managed by our terraform variables [vault/terraform.tfvars](vault/terraform.tfvars).
You need to edit `terraform.tfvars` in the `vault` directory and locate the variable `product_teams`
inside `product_teams`. This variable contains a map of all the product teams. To create a new one, add a
new entry to the map.

## Vault via terraform

To be able to manage secrets in Hashicorp Vault and use them via ArgoCD Vault Plugin (AVP), a team needs the following
Vault resources set up:

- A _secret engine_
- A _read-write policy_ for the secret engine, used to manage secrets via web UI or CLI; Mapped to the GitHub team
- An _approle_, that is used as AVP credentials
- A _read-only policy_ for the secret engine, used as AVP credentials; Mapped to the approle
- Approle credentials (secret-id and role-id) available as _avp-config in the devsecops_ secret engine

All of these resources are created through terraform scripts. The scripts are part of the
[product-onboarding](https://github.com/catenax-ng/product-onboarding) repository.
