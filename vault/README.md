# This folder contains Terraform scripting for Vault onboarding

**TLDR** one terraform run for all vault permissions for each product

In our case we have one Vault Cluster which contains all secrets for each cluster and product.

## Vault  via Terraform

### Terraform variable settings for Vault  

```shell
# You can get a login token, by logging into the Vault web UI and using 'copy token' from the top right user menu.
export VAULT_TOKEN=<your-vault-token-or-root-token>
# The OIDC settings that needs to be specified is the client-id and the client-secret for DEX. 
# You can find this information in our devsecops secret engine in Vault web UI 
# under path `devsecops/clusters/vault/github-oauth`.
export TF_VAR_vault_oidc_client_id=<client-id-copied-from-vault>
export TF_VAR_vault_oidc_client_secret=<client-secret-copied-from-vault>
```

### Creating a new product team Vault via terraform

Onboarding a new product team is also managed by our terraform vault variables [terraform.tfvars](terraform.tfvars).
You need to edit [terraform.tfvars](terraform.tfvars) in the [vault](../vault) directory and locate the part within `product_teams`
inside `product_teams`. This variable contains a map of all the product teams. To create a new one, add a
new entry to the map.

- add entry for the new product teams based on the description within [terraform.tfvars](terraform.tfvars)
- do a `terraform plan` to check if the changes meet your expectations

### Description of Vault resources   

To be able to manage secrets in Hashicorp Vault and use them via ArgoCD Vault Plugin (AVP), a team needs the following
Vault resources set up:

- A _secret engine_
- A _read-write policy_ for the secret engine, used to manage secrets via web UI or CLI; Mapped to the GitHub team
- An _approle_, that is used as AVP credentials
- A _read-only policy_ for the secret engine, used as AVP credentials; Mapped to the approle
- Approle credentials (secret-id and role-id) available as _avp-config in the devsecops_ secret engine

All of these resources are created through terraform scripts. The scripts you can find this folder [Vault](../vault)
