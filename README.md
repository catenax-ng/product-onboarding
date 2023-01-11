# Product Onboarding
This repository contains all necessary parts to onboard a Catena-X product to consortia environments like:

- GitHub
  - GH Team
  - GH Repository
- Kubernetes cluster (per environment, e.g. DEV, INT, PRE-PROD)
  - Kubernetes Namespace/s
  - ArgoCD Project
  - ArgoCD Vault Plugin setup
  - ArgoCD Repository setup (if private Repo is used)
- Hashicorp Vault
  - Product related secret engine
  - Authentication methods (AppRole)

## GitHub

### Folder Structure

```text
.
├── [...]
└── github
    ├── README.md
    └── bpdm-(draft)
```

### Description

tbd

> note:  
> Design and implementation phase!

## Kubernetes

### Folder Structure
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
    └── pre-prod
        └── kustomization.yaml
```

### Description

tbd

> note:  
> Design and implementation phase!

## Vault

### Folder Structure

```text
.
├── [...]
└── vault
    ├── README.md
    └── bpdm-(draft)
```

### Description

tbd

> note:  
> Design and implementation phase!
