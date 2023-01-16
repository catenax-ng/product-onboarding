## ArgoCD

To provide a product-team access to the and cluster e.g. devsecops-testing infrastructure following onboarding steps must be performed (all
steps are related to repository [product-onboarding](https://github.com/catenax-ng/product-onboarding/blob/main/README.md)):

with this we provide a 

- new ArgoCD project for new product-team
- create a new AVP secret for new product-team
- new k8s namespace for new product-team

First create a new branch based on branching naming convention in [product-onboarding](https://github.com/catenax-ng/product-onboarding) repo for onboarding a new
product-team to ArgoCD.

### Create ArgoCD Project

Create terraform manifests for the new product-team into a separate folder in this `argocd` folder and this will create per default a:

- ArgoCD project
- AVP-Secret
- k8s namespace 

For explanation product-example yaml-Files for a better understanding:
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: product-team-example
---
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: project-example
  namespace: argocd
spec:
  description: Project for team example
  sourceRepos:
    - '*'
  destinations:
    - namespace: product-example
      server: https://kubernetes.default.svc
  # Allow all namespaced-scoped resources to be created, except for ResourceQuota, LimitRange, NetworkPolicy
  namespaceResourceBlacklist:
    - group: ''
      kind: ResourceQuota
    - group: ''
      kind: LimitRange
    - group: ''
      kind: NetworkPolicy
  roles:
    - name: project-read-only
      description: provide read-only access to project
      policies:
        - p, proj:project-example:project-read-only, applications, get, project-example/*, allow
        - p, proj:project-example:team-admin, exec, create, project-example/*, allow
      groups:
        - catenax-ng:product-team-example
        - catenax-ng:release-management
        - catenax-ng:test-management```
---
# To onboard a new product team,replace TEAM-NAME with name of team in line 6 + 7
# Save as TEAM-NAME-team-vault-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  annotations:
    avp.kubernetes.io/path: "devsecops/data/avp-config/example"
  name: vault-secret
  namespace: product-team-example
type: Opaque
stringData:
  VAULT_ADDR: https://vault.demo.catena-x.net/
  AVP_TYPE: vault
  AVP_AUTH_TYPE: approle
  AVP_ROLE_ID: <role_id>
  AVP_SECRET_ID: <secret_id>

```
The secret will be called _vault-secret_ and stored in k8s namespace related to product-team.

Store the manifests in [product-onboarding](https://github.com/catenax-ng/product-onboarding)repo in path `argocd` and an entry based on their permissions in every `cluster/<ClusterEnvironment>/kustomization.yaml`  where tha new product-team need a new argocd-project. Default is dev and int (named here Hotel-Budapest).

### Prepare Deployment Of ArgoCD Project And AVP Secret

To deploy k8s namespace, ArgoCD Project and the AVP secret to on cluster envionment e.g devsecops-testing  you'll have to add a new entry into `cluster/devsecops-testing/kustomization.yaml`
in [product-onboarding](https://github.com/catenax-ng/product-onboarding/cluster) repo:

More information you can found under `cluster/README.md`
