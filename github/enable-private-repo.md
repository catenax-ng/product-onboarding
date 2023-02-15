# Enable access to a private repository via deploy key

> The project/product has to follow the steps which can be found
> here: [How to prepare a private repo](https://github.com/catenax-ng/catenax-ng.github.io/blob/main/docs/guides/how-to-prepare-a-private-repo.md).

- Go to `argocd\product-folder\base-read-only`
- Add a file named `product-<productName>-private-repo.yaml`

>  e.g. for _product-semantics_ add new file in `argocd/product-semantics/base-read-only/product-semantics-private-repo.yaml`

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

This added file will generate a new ressource within the product specific environment based on in which cluster `kustomization.yaml` the product is enabled.
Current Default is `dev` and `int` (a.k.a Hotel-Budapest).
