# IAM Service Linked Role Module Examples

This directory contains comprehensive examples demonstrating the capabilities of the IAM service linked role module. Each example showcases different use cases and configuration patterns.

## Available Examples

### 1. [Complete](./complete/)
**Comprehensive IAM service linked role with all features**
- Service-linked role creation for AWS services
- Custom suffix and description configuration
- Tagging for resource organization
- Role existence checking and management
- Sample configurations for common AWS services

## Features Demonstrated

### Core Module Features
- ✅ **Service name specification**: AWS service for the role
- ✅ **Custom suffix**: Optional suffix for role naming
- ✅ **Description**: Role description configuration
- ✅ **Tagging**: Resource tagging support
- ✅ **Role existence**: Check if role already exists

### Advanced Features
- ✅ **ARN and ID outputs**: Role identification and referencing
- ✅ **Creation date**: Role creation timestamp tracking
- ✅ **Unique ID**: Stable role identifier
- ✅ **Path**: Role path information
- ✅ **Tags inheritance**: Provider-level tag inheritance

### IAM Integration
- ✅ **Service-linked roles**: AWS-managed roles for services
- ✅ **Automatic creation**: Creates role if it doesn't exist
- ✅ **Existing role detection**: Avoids duplicate role creation
- ✅ **Standard naming**: Follows AWS service-linked role conventions

## Running the Examples

Each example includes:
- `main.tf`: Module usage and supporting resources
- `variables.tf`: Configurable parameters with defaults
- `outputs.tf`: Useful outputs for integration
- `versions.tf`: Provider requirements
- `test.tfvars`: Example variable values

### Quick Start

```bash
# Navigate to the example
cd examples/complete

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Plan deployment
terraform plan

# Apply configuration (requires AWS credentials)
terraform apply
```

### Validating Examples

```bash
# Validate the complete example
cd examples/complete
terraform init -backend=false
terraform validate
```

## Module Capability Coverage

The complete example provides comprehensive coverage:

- **Core IAM service linked role** functionality
- **Service-specific roles** (ECS example included)
- **Optional configurations** (suffix, description, tags)
- **Role management** (existence checking and creation)
- **Output values** for integration and automation
- **Best practices** for IAM role deployments
