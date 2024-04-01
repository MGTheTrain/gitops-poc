# gitops-ftw

## Table of Contents

+ [Summary](#summary)
+ [Features](#features)
+ [Getting started](#getting-started)

## Summary

Repository deploying and AKS or EKS cluster on demand, installing ArgoCD or Flux on those clusters enabling GitOps for custom helm chart sample services and configurations

## Features

- [x] AKS or EKS deployment trough terraform cli tool and HCL files. 
- [x] ArgoCD or Flux installations on deployed k8s cluster
- [x] CD wofklow for on demand deployments of an Azure Storage Account Container (**For storing terraform state files**)
- [x] CD wofklow for on demand deployments of k8s clusters (Options: AKS or EKS) and installation of GitOps tools (Options: ArgoCD or Flux) or destruction of k8s clusters trough Github `workflow_dispatch` trigger (**Requires an Azure Storage Account Container**)

## Getting started

Github workflows will be utilized in [this](./.github/workflows/) and the [helm-chart-samples-ftw](https://github.com/MGTheTrain/helm-chart-samples-ftw/tree/main/.github/workflows) Github repository. Required secrets need to be set therefore for those Github repositories.

### Preconditions

0. Create an ACR trough the [terraform.yml workflow](https://github.com/MGTheTrain/helm-chart-samples-ftw/actions/workflows/terraform.yml)
1. **Optional:** Build and push a sample service with release version tag to the ACR trough the [docker_image.yml workflow](https://github.com/MGTheTrain/helm-chart-samples-ftw/actions/workflows/docker_image.yml). 
2. Deploy an Storage Account Service including container for terraform backends trough the [terraform.yml workflow](https://github.com/MGTheTrain/gitops-ftw/actions/workflows/terraform.yml) considering the `INFRASTRUCTURE_OPERATIONS option storage-account-backend-deploy`

### Deploy an AKS or EKS cluster and install the ArgoCD or FluxCD helm charts

0. Deploy an AKS trough the [terraform.yml workflow](https://github.com/MGTheTrain/gitops-ftw/actions/workflows/terraform.yml) considering the `INFRASTRUCTURE_OPERATIONS option k8s-service-deploy`. **NOTE:** `ACR_*` secrets for this workflow need to be resolved by copying over values of the deployed ACR from an Azure Portal UI.
1. **Optional:** Install only helm charts to an existing kubernetes cluster trough [terraform.yml workflow](https://github.com/MGTheTrain/gitops-ftw/actions/workflows/terraform.yml) considering the `INFRASTRUCTURE_OPERATIONS option helm-charts-install`

**NOTE:** Set all the required Github secrets for aboves workflows

#### Port forwarding

In order to port forward and check helm chart pods, run following commands:

```sh
kubectl get pods -n gitops-ftw
kubectl port-forward -n gitops-ftw  <pod-name> <local-port>:<server-port>
```

### Showcase GitOps

Configure example Helm chart services and configurations in the [helm-chart-samples-ftw Github repository](https://github.com/MGTheTrain/helm-chart-samples-ftw). Refer to those sources in ArgoCD applications and Flux HelmReleases. Merge pull requests in `main` branches of these repositories to validate whether the defined state of the Helm charts synchronizes with the Kubernetes cluster via the Sync Controller.

TBD


### Destroy the AKS or EKS cluster or uninstall helm charts

0. Destroy an AKS trough the [terraform.yml workflow](https://github.com/MGTheTrain/gitops-ftw/actions/workflows/terraform.yml) considering the `INFRASTRUCTURE_OPERATIONS option k8s-service-destroy`
1. **Optional:** Uninstall only helm charts of an existing kubernetes cluster trough [terraform.yml workflow](https://github.com/MGTheTrain/gitops-ftw/actions/workflows/terraform.yml) considering the `INFRASTRUCTURE_OPERATIONS option helm-charts-uninstall`