# terraform-aws-blue-green-canary

A Terraform module to perform Blue-Green / Canary deployments using AWS Application Load Balancer (ALB).

## Traffic Distribution

The **traffic_distribution** parameter controls how much traffic flows to the Blue vs. Green server.

| traffic_distribution | Blue % | Green % |
| :------------------: | :----: | :-----: |
| blue-100 | 100 | 0 |
| blue-90 | 90 | 10 |
| blue-80 | 80 | 20 |
| blue-70 | 70 | 30 |
| blue-60 | 60 | 40 |
| blue-50 | 50 | 50 |
| blue-40 | 40 | 60 |
| blue-30 | 30 | 70 |
| blue-20 | 20 | 80 |
| blue-10 | 10 | 90 |
| blue-0 | 0 | 100 |

## Minimum Prerequisites For Testing

> The [full example code](https://github.com/fer1035/terraform-aws-blue-green-canary/tree/v1.1.7/examples) shows a more elaborate configuration using multiple modules and web server Instances separate from this module for more modular target attachments.

The following prerequisites are for the [simple example](https://github.com/fer1035/terraform-aws-blue-green-canary/tree/v1.1.7/examples):

- A VPC with at least 2 public Subnets for the ALB.
- A Security Group within the same VPC as above that allows corresponding traffic to the ALB.
- 2 backend servers (1 for Blue, 1 for Green in either public or private Subnets in the same VPC as above). You can then use the same or a different Security Group for the servers depending on your configuration.

## Testing

- Configure your web servers to output Blue-Green indicators.

    ```
    # Blue Server (assuming Amazon Linux 2 AMI)
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    sudo echo "Blue" > /var/www/html/index.html

    # Green Server (assuming Amazon Linux 2 AMI)
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    sudo echo "Green" > /var/www/html/index.html
    ```

- The module outputs a cURL command that you can use to invoke the ALB URL and test whether the Blue-Green weightings look correct.

    ```
    for i in `seq 1 100`; do curl '<ALB URL>'; done
    ```

- The test output should show ***Blue*** and ***Green*** in percentages close to your definition for **traffic_distribution**. For example, the output below shows the results for **traffic_distribution = "blue-90"** in 100 invocations of the ALB URL.

    ```
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Green
    Green
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Green
    Blue
    Blue
    Green
    Blue
    Blue
    Blue
    Green
    Blue
    Green
    Blue
    Blue
    Blue
    Green
    Blue
    Green
    Blue
    Blue
    Green
    Blue
    Blue
    Blue
    Green
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Green
    Green
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Blue
    Green
    ```

## Disclaimer

This module was built primarily using [HashiCorp training materials](https://developer.hashicorp.com/terraform/tutorials/aws/blue-green-canary-tests-deployments).

---

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
