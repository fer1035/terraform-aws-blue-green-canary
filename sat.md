## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_lb_target_group_attachment.green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_internal"></a> [internal](#input\_internal) | Whether the ALB is internal-facing (Private). | `bool` | `false` | no |
| <a name="input_port"></a> [port](#input\_port) | Listener and Target Group port. | `number` | `80` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Listener and Target Group protocol. | `string` | `"HTTP"` | no |
| <a name="input_sg_ids"></a> [sg\_ids](#input\_sg\_ids) | List of Security Groups for the ALB. | `list(string)` | n/a | yes |
| <a name="input_ssl_certificate_arn"></a> [ssl\_certificate\_arn](#input\_ssl\_certificate\_arn) | The certificate ARN to use with the HTTPS listener | `string` | `null` | no |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | SSL policy to use with the HTTPS listener. The latest value during the publication of this module version is "ELBSecurityPolicy-TLS13-1-2-2021-06". | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of Subnets for the ALB. | `list(string)` | n/a | yes |
| <a name="input_target_healthcheck_interval"></a> [target\_healthcheck\_interval](#input\_target\_healthcheck\_interval) | Target Group health check interval in seconds. | `number` | `10` | no |
| <a name="input_target_healthcheck_timeout"></a> [target\_healthcheck\_timeout](#input\_target\_healthcheck\_timeout) | Target Group health check timeout in seconds. | `number` | `5` | no |
| <a name="input_targets"></a> [targets](#input\_targets) | Blue and Green target details for a simple deployment. | `map(any)` | <pre>{<br>  "blue": {<br>    "id": null,<br>    "port": null<br>  },<br>  "green": {<br>    "id": null,<br>    "port": null<br>  }<br>}</pre> | no |
| <a name="input_traffic_distribution"></a> [traffic\_distribution](#input\_traffic\_distribution) | Levels of traffic distribution | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC for deployment. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb"></a> [alb](#output\_alb) | n/a |
| <a name="output_blue_target_group"></a> [blue\_target\_group](#output\_blue\_target\_group) | n/a |
| <a name="output_canary_test_command"></a> [canary\_test\_command](#output\_canary\_test\_command) | n/a |
| <a name="output_green_target_group"></a> [green\_target\_group](#output\_green\_target\_group) | n/a |
| <a name="output_listener"></a> [listener](#output\_listener) | n/a |
