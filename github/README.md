# This folder contains Terraform scripting for GitHub onboarding

**TLDR** one terraform run for all gh-repositories, gh-teams and gh-mapping between repositories and teams

In our case we have one GitHub Organization which contains all GitHub repository information within
 catena-x ng for each product.

## Assigning a team as contributor to a repository via terraform

Contribution access to a repository in our GitHub organization is granted on a team level. We do not
grant this kind of access to individuals.
Access is again managed by our terraform variables under [github folder](..github/).

To manage contribution access for a team on a repository, edit the `terraform.tfvars` file in the `github` directory.

There, add a new map entry to the `github_repositories_teams` variable inside `terraform.tfvars`.
As convention, we decided for the map key to be a combination of repository and team (`<repository-name-team-name>`).
This is done, because we have cases of multiple teams contributing to a single repository. This is configured, by
adding multiple entries to the `github_repositories_teams` map, containing the same repository, but a different team
each time.

As default, we configure `maintain` access on the product repositories for the teams, since all the administrative
tasks are handled by the team managing the organization.

## GitHub Organization

The following section describes how to handle users, teams and repositories in our GitHub organization

### Invitation of a single user

Interaction with most of our tooling and also access to repositories is granted to members of our GitHub organization
"catenax-ng". So [inviting](https://github.com/orgs/catenax-ng/people) users to the organization is the starting point for every Catena-X member.

As initial information to onboard a user to the organization, we need:

- The GitHub username (or email address) of the person to onboard
- A person (i.e. the product PO) to vouch for the person being onboarded to actually be part of Catena-X

> Assigning a GitHub user to the several GitHub product teams should be done by the maintainers of the GitHub product teams. Only in rare cases,
> like onboarding a new person and a new team in the same step, DevSecOps team should assign github users to github teams.

### Creating a GitHub team via terraform

Access to repositories is granted on a GitHub team level instead of individuals. Also RBAC definitions on Vault and
ArgoCD are based on GitHub team membership.

To create GitHub teams, we are using the terraform variable `terraform.tfvars` within the folder `github` .
To create a new GitHub team, edit `terraform.tfvars` and locate the variable `github_teams`  section
inside. This variable contains a map of all the teams in our GitHub organization with name and
description properties.

All you need to do is to add a new entry to that map with the new team name and an optional description. Make sure, the
key you use for your new entry is unique. This key will also be used by terraform to create an entry in the state file.

### Creating a repository via terraform

Git repositories are also managed by our terraform `terraform.tfvars`.
The process of creating a new repository is similar to creating a team. You need to edit the `main.tf` file in the `github` directory. Repositories are defined in the `github_repositories` section inside of `github/terraform.tfvars`. This variable is a map containing all the repository information. To create a new one, add a new entry to the map.

Event though most of the repository settings are configurable, the following should be set in a default case.

- `visibility : "public"`. Exception is only, if the teams did not yet clarify IP related questions
- `pages : { enabled : false }`. If a team wants to use GitHub pages, you can set this to true. This is needed, if teams
  want to release artifacts like helm charts.
- `is_template : false`. We usually do not create new repositories as template
- `uses_template : false`. Currently, our repositories are set up blank and not based on a template
- `template : null`. Since we usually do not use a template, we do not specify one. In case we want to use a template,
  this variable has to be defined as object of form `{ owner : "github-org" repository : "repo-name" }`

> If the team requested k8s-helm-example repository to be used as a template, the following settings needs to be changed:
>
> - `uses_template : true`
> - `template : { owner : "catenax-ng" repository : "k8s-helm-example" }`
>
> The newly created repository will be populated with files from the template, github pages will be enabled and github action for releasing helm charts to pages will be added.

### Enable access to a private repository via deploy key

> The project/product has to follow the steps which can be found
> here: [How to prepare a private repo](https://github.com/catenax-ng/catenax-ng.github.io/blob/main/docs/guides/how-to-prepare-a-private-repo.md).

- Go to `catenax-ng\product-onboarding\argocd\argo-repos`
- Add a file named `product-<productName>-repo.yaml`, e.g. for _product-semantics_ (`product-semantics-repo.yaml`):

  ```yaml
  apiVersion: v1
  kind: Secret
  metadata:
    name: product-semantics-repo
    namespace: argocd
    annotations:
      avp.kubernetes.io/path: "semantics/data/deploy-key"
    labels:
      argocd.argoproj.io/secret-type: repository
  stringData:
    type: git
    url: git@github.com:catenax-ng/product-semantics
    name: product-semantics-repo
    project: project-semantics
    sshPrivateKey: |
      <semantics-deploy-key>
  ```

- Add following line to `environments/hotel-budapest/kustomization.yaml` and for every environment you need it.
Default is dev and int (Hotel-Budapest).

  ```yaml
  - argo-repos/product-semantics-repo.yaml
  ```

### Enable access to a private package (central pull secret)

- Create a PAT within GitHub user account (machine user)
  settings - Developer settings - Personal access token. Be sure to give just the needed rights (read:package will be
  sufficient to deploy)
- Now do a base64 encoding for the PAT $ echo -n "<username\>:<PAT\>" | base64
- Create a file `.dockerconfigjson` containing the base-64 encoded PAT

  ```json
  {
    "auths": {
      "ghcr.io": {
        "auth": "<base-64 encoded PAT>"
      }
    }
  }
  ```

- Do a base 64 encoding for the auth part

  ```shell
  echo -n'{"auths":{"ghcr.io":{"auth":"<base-64 encoded PAT>"}}}' | base64
  ```

  If the output is divided into 2 lines, just add the second line to the first (without space)

- Create a file `dockerconfigjson.yaml`:

  ```yaml
  kind: Secret
  type: kubernetes.io/dockerconfigjson
  apiVersion: v1
  metadata:
    name: budapest-machine-user-read-package
    labels:
      app: app-name
  data:
    .dockerconfigjson: <base64 encoded auth part, output from second base64 encoding>
  ```

- Then add the secret to the cluster

  ```shell
  kubectl create -f dockerconfigjson.yaml
  ```

- Pull secret has to be added to the product´s code

  ```yaml
  imagePullSecrets:
    - name: <name of the pull secret>
  ```
