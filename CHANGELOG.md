# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 01-04-2024

### Added

- [Feature] AKS or EKS deployment trough terraform cli tool and HCL files. 
- [Feature] ArgoCD or Flux installations on deployed k8s cluster
- [Feature] CD wofklow for on demand deployments of an Azure Storage Account Container (**For storing terraform state files**)
- [Feature] CD wofklow for on demand deployments of k8s clusters (Options: AKS or EKS) and installation of GitOps tools (Options: ArgoCD or Flux) or destruction of k8s clusters trough Github `workflow_dispatch` trigger (**Requires an Azure Storage Account Container**)