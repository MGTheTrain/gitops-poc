<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_k8s_external"></a> [k8s\_external](#module\_k8s\_external) | ../../modules/k8s-external | n/a |
| <a name="module_k8s_internal"></a> [k8s\_internal](#module\_k8s\_internal) | ../../modules/k8s-internal | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_login_server_name"></a> [acr\_login\_server\_name](#input\_acr\_login\_server\_name) | Sets an ACR registry server name. | `string` | `"TBD"` | no |
| <a name="input_acr_password"></a> [acr\_password](#input\_acr\_password) | Sets an ACR password. | `string` | `"TBD"` | no |
| <a name="input_acr_username"></a> [acr\_username](#input\_acr\_username) | Sets an ACR user name. | `string` | `"TBD"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment. | `string` | `"sbx"` | no |
| <a name="input_gitops_tool"></a> [gitops\_tool](#input\_gitops\_tool) | String determining whether to install Argo CD or FluxCD. Viable options: [ argocd, fluxcd ] | `string` | `"argocd"` | no |
| <a name="input_selected_configuration"></a> [selected\_configuration](#input\_selected\_configuration) | String that specifies whether to deploy external Helm charts or internal resources, such as Kubernetes secrets or a reverse proxy ingress required for applications in the k8s cluster. Viable options: [ internal, external-helm ] | `string` | `"external-helm"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_services_namespace"></a> [external\_services\_namespace](#output\_external\_services\_namespace) | n/a |
| <a name="output_internal_apps_namespace"></a> [internal\_apps\_namespace](#output\_internal\_apps\_namespace) | n/a |
<!-- END_TF_DOCS -->