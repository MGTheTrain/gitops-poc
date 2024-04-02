# gitops-ftw

## Table of Contents

+ [Summary](#summary)
+ [Features](#features)
+ [Getting started](#getting-started)

## Summary

Repository deploying and AKS or EKS cluster on demand, installing ArgoCD or Flux on those clusters enabling GitOps for custom helm chart sample services and configurations

## Features

- [x] AKS deployment trough terraform cli tool and HCL files. 
- [ ] EKS deployment trough terraform cli tool and HCL files. 
- [x] ArgoCD or Flux installations on deployed k8s cluster
- [x] CD wofklow for on demand deployments of an Azure Storage Account Container (**For storing terraform state files**)
- [x] CD wofklow for on demand deployments of k8s clusters (Options: AKS or EKS) and installation of GitOps tools (Options: ArgoCD or Flux) or destruction of k8s clusters trough Github `workflow_dispatch` trigger (**Requires an Azure Storage Account Container**)

## Getting started

Github workflows will be utilized in [this](./.github/workflows/) and the [helm-chart-samples-ftw](https://github.com/MGTheTrain/helm-chart-samples-ftw/tree/main/.github/workflows) Github repository. Required secrets need to be set therefore for those Github repositories. Once the workflows described in the **Preconditions** and **Deploy an AKS or EKS cluster and install the ArgoCD or FluxCD helm charts** sections have been successfully executed, all resource groups listed should be visible in the Azure Portal UI:

![deployed-rgs.PNG](./images/deployed-rgs.PNG)

### Preconditions

0. Create an ACR trough the [terraform.yml workflow](https://github.com/MGTheTrain/helm-chart-samples-ftw/actions/workflows/terraform.yml)
1. **Optional:** Build and push a sample service with release version tag to the ACR trough the [docker_image.yml workflow](https://github.com/MGTheTrain/helm-chart-samples-ftw/actions/workflows/docker_image.yml). 
2. Deploy an Azure Storage Account Service including container for terraform backends trough the [terraform.yml workflow](https://github.com/MGTheTrain/gitops-ftw/actions/workflows/terraform.yml) considering the `INFRASTRUCTURE_OPERATIONS option storage-account-backend-deploy`

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

When checking for example the ArgoCD Web UI, you would run:

```sh
kubectl port-forward -n gitops-ftw argocd-server-<UUID> 8080:8080
```

and visit in a browser of choice `localhost:8080`. You would need to authenticate with admin credentials.
The default username is `admin`. The default password can be obtained trough: `kubectl -n argocd get secret argocd-initial-admin-secret -n gitops-ftw -o jsonpath="{.data.password}" | base64 -d`.

### Showcase GitOps

#### Registering ArgoCD applications or Kustomization's

Trough CLI for ArgoCD:

```sh
# Register Application
argocd app create sample-service \
  --repo <GIT_REPO_URL> \
  --path <PATH_IN_REPO> \
  --dest-server <K8S_CLUSTER_URL> \
  --dest-namespace <NAMESPACE> \
  --revision <TARGET_REVISION>

# Sync Application
argocd app sync sample-service
# Monitor Application Status
argocd app get my-app
```

Trough CLI for FluxCD:

```sh
TBD
```


#### Changing service versions

Navigate to [the Showcase GitOps section of the helm-chart-samples-ftw GitHub repository](https://github.com/MGTheTrain/helm-chart-samples-ftw/tree/main?tab=readme-ov-file#showcase-gitops)

### Destroy the AKS or EKS cluster or uninstall helm charts

0. **Optional:** Uninstall only helm charts of an existing kubernetes cluster trough [terraform.yml workflow](https://github.com/MGTheTrain/gitops-ftw/actions/workflows/terraform.yml) considering the `INFRASTRUCTURE_OPERATIONS option helm-charts-uninstall`
1. Destroy an AKS trough the [terraform.yml workflow](https://github.com/MGTheTrain/gitops-ftw/actions/workflows/terraform.yml) considering the `INFRASTRUCTURE_OPERATIONS option k8s-service-destroy`