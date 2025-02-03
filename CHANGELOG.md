# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.4.0] - 03-02-2025

### Updated

- Changed image pull policy to `Always`

## [0.3.0] - 28-01-2025

### Updated

- Separated concerns by distinguishing between the installation of external Helm charts and the Kubernetes resources needed by applications in a deployed cluster. Additionally split GitHub Action workflows and incorporated conditionals based on the selected `INFRASTRUCTURE_OPERATION` at the job level
- Considered Repository environments

## [0.2.0] - 25-01-2025

### Added

- [x] Sample C# ASP.NET Core HelloWorld service along with a CI workflow for building and pushing the container image, including the build artifacts of the service, to an Azure Container Registry (ACR)
- [x] Nginx and sample-service helm charts and kustomization's required for GitOps

## [0.1.0] - 01-04-2024

### Added

- [Feature] AKS or EKS deployment trough terraform cli tool and HCL files. 
- [Feature] ArgoCD or Flux installations on deployed k8s cluster
- [Feature] CD wofklow for on demand deployments of an Azure Storage Account Container (**For storing terraform state files**)
- [Feature] CD wofklow for on demand deployments of k8s clusters (Options: AKS or EKS) and installation of GitOps tools (Options: ArgoCD or Flux) or destruction of k8s clusters trough Github `workflow_dispatch` trigger (**Requires an Azure Storage Account Container**)
- [x] CD wofklow for on demand deployments of an ACR (**Required for storing docker images**)