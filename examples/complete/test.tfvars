# Sample variables for running the complete example

# AWS service name for the service-linked role
aws_service_name = "ecs.amazonaws.com"

# Custom suffix for the role name (optional)
custom_suffix = null

# Description of the role (optional)
description = "Service-linked role for AWS ECS"

# Tags for the IAM role
tags = {
  Environment = "dev"
  ManagedBy   = "Terraform"
  Example     = "complete"
}
