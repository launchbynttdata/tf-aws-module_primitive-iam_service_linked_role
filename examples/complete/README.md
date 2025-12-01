# complete

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_service_linked_role"></a> [iam\_service\_linked\_role](#module\_iam\_service\_linked\_role) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_service_name"></a> [aws\_service\_name](#input\_aws\_service\_name) | The AWS service to which this role is attached. You use a string similar to a URL but without the http:// in front. For example: elasticbeanstalk.amazonaws.com. | `string` | n/a | yes |
| <a name="input_custom_suffix"></a> [custom\_suffix](#input\_custom\_suffix) | Additional string appended to the role name. Not all AWS services support custom suffixes. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the role. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value mapping of tags for the IAM role. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | The Amazon Resource Name (ARN) of the role. |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | The Amazon Resource Name (ARN) specifying the role. |
| <a name="output_role_create_date"></a> [role\_create\_date](#output\_role\_create\_date) | The creation date of the IAM role. |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | The name of the role. |
| <a name="output_role_path"></a> [role\_path](#output\_role\_path) | The path of the role. |
| <a name="output_role_unique_id"></a> [role\_unique\_id](#output\_role\_unique\_id) | The stable and unique string identifying the role. |
| <a name="output_role_tags_all"></a> [role\_tags\_all](#output\_role\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
| <a name="output_role_exists"></a> [role\_exists](#output\_role\_exists) | Whether the role already existed or was created by this module. |
<!-- END_TF_DOCS -->
