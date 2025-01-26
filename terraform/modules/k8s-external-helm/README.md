<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.fluxcd](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.nginx_ingress_controller](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.external_services](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment. | `string` | `"sbx"` | no |
| <a name="input_gitops_tool"></a> [gitops\_tool](#input\_gitops\_tool) | String determining whether to install Argo CD or FluxCD. Viable options: [ argocd, fluxcd ] | `string` | `"argocd"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_services_namespace"></a> [external\_services\_namespace](#output\_external\_services\_namespace) | n/a |
<!-- END_TF_DOCS -->