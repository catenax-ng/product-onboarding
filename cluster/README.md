# Deployed Clusters

Within the folders we describe each customisation for the cluster and the products that are deployed on it.

cluster links:

- [beta](../cluster/beta)
- [dev](../cluster/dev)
- [devsecops](../cluster/devsecops-testing/)
- [int](../cluster/int)
- [pre-prod](../cluster/pre-prod)

## Description of products per cluster

The [cluster](../cluster) folder contains all available clusters.

In the `kustomization.yaml` for each cluster we describe all the products with the declared permission level on the cluster.

Please add the new product-teams in alphabetical order of file `kustomization.yaml` based on their permission level.

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
## Special variables for products in cluster folder

If there are special ressource variables for a product on the cluster we overwrite this within this folder `cluster/<environment>/argocd-resource-patches`

e.g Jwt token for product traceability-irs in [int environment](cluster/int/argocd-resource-patches/)
``` yaml
patchesStrategicMerge:
    - argocd-resource-patches/project-traceability-irs.yaml
```