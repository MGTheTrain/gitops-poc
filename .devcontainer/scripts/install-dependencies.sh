#!/bin/bash

set -euo pipefail

apt-get update
apt-get install -y curl

# Flux CLI. See: https://fluxcd.io/flux/cmd/
curl -s https://fluxcd.io/install.sh | FLUX_VERSION=2.0.0 bash

# ArgoCD CLI. See: https://argo-cd.readthedocs.io/en/stable/cli_installation/
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64