<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_k8s_external_helm"></a> [k8s\_external\_helm](#module\_k8s\_external\_helm) | ../../modules/k8s-external-helm | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment. | `string` | `"sbx"` | no |
| <a name="input_gitops_tool"></a> [gitops\_tool](#input\_gitops\_tool) | String determining whether to install Argo CD or FluxCD. Viable options: [ argocd, fluxcd ] | `string` | `"argocd"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->