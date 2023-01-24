# Deployed Clusters

Within the folders we describe each customisation for the cluster and the products that are deployed on it.

clusterlinks:

- [beta](/cluster/beta)
- [dev](/cluster/dev)
- [devsecops](/cluster/devsecops-testing/)
- [int](/cluster/int)
- [pre-prod](/cluster/pre-prod)

## Include all products on this cluster and its permission level

In `cluster` folder are all available clusters, in the `cluster/<clustername>/kustomization.yaml` we describe which product is deployed on the each cluster with the decleared permission level for the product on the target cluster.

Example:
`- ../../argocd/product-example/read-write`  
`- ../../argocd/product-example/read-only`

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
# Mapping of all products on this cluster and its permission level here in example for read-only permissions
  - ../../argocd/product-example/read-only
#  - ../../argocd/product-example/read-write  would it be for only read-write permissions
```

Please add the new product-team in alphabetical order of file `kustomization.yaml` for each cluster.
