# gitops-ftw

![Status](https://img.shields.io/badge/Status-On%20Hold-orange)

## Table of Contents

+ [Summary](#summary)
+ [Features](#features)
+ [Getting started](#getting-started)

## Summary

Repository deploying and AKS or EKS cluster on demand, installing ArgoCD or Flux on those clusters enabling GitOps for custom helm chart sample services and configurations

## Features

- [ ] AKS or EKS deployment trough terraform cli tool and HCL files. 
- [ ] ArgoCD or Flux installations on deployed k8s cluster
- [ ] CD wofklow for on demand deployments of k8s clusters (Options: AKS or EKS) and installation of GitOps tools (Options: ArgoCD or Flux) or destruction of k8s clusters trough Github `workflow_dispatch` trigger

## Getting started

### Deploy an AKS or EKS cluster with ArgoCD or Flux installations

TBD

### Destroy the AKS or EKS cluster

TBD

### Showcase GitOps

Configure example Helm chart services and configurations in the [helm-chart-samples-ftw Github repository](https://github.com/MGTheTrain/helm-chart-samples-ftw). Refer to those sources in ArgoCD applications and Flux HelmReleases. Merge pull requests in `main` branches of these repositories to validate whether the defined state of the Helm charts synchronizes with the Kubernetes cluster via the Sync Controller.

TBD
