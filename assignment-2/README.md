# Assignment 1 – Deploy WordPress Using Terraform

## Objective

The objective of this assignment is to deploy a fully functional **WordPress stack on AWS** using **Terraform**, demonstrating how Infrastructure as Code (IaC) can be used to provision and configure real cloud infrastructure end-to-end.

The deployment includes:
- An EC2 instance running WordPress
- Security groups
- User data to install and configure dependencies
- A working public endpoint
- All resources provisioned via Terraform

All infrastructure in this assignment was provisioned and managed **exclusively using Terraform**, with no manual configuration performed via the AWS Console.

This assignment demonstrates how Terraform manages real infrastructure from provisioning to application deployment.



## Architecture Overview

This deployment consists of:

- A custom **VPC** with a public subnet  
- An **Internet Gateway** and public route table  
- A **Security Group** allowing HTTP and SSH access  
- An **EC2 instance** running Docker  
- **WordPress and MySQL** deployed using Docker Compose  
- A **user data script** to automate configuration on first boot  

Terraform modules are used to separate infrastructure logic from environment-specific configuration.



## Folder Structure

```text
assignment-1/
├── docker-setup/
│   └── docker-compose.yml
│
├── modules/ec2/
│    └── ec2.tf
│    └── outputs.tf
│    └── variables.tf
│
├── screenshots/
│   └── working-public-endpoint.png
│
├── scripts/
│   └── user_data.sh
│
├── terraform-setup/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
│
└── README.md
```
## Notice :

Environment-specific values are supplied via a local terraform.tfvars file which is excluded from version control.

## Infrastructure Provisioned via Terraform

### Module-Based Infrastructure

A reusable **EC2 module** is used to define all infrastructure resources, including:

- VPC
- Subnet
- Internet Gateway
- Route table and route table association
- Security group with dynamic ingress and egress rules
- SSH key pair
- EC2 instance

The module contains all `resource` definitions, while the root Terraform configuration supplies environment-specific values via variables and `terraform.tfvars`.

This separation improves code organisation, reusability, and clarity.



## User Data & Instance Configuration

A **user data shell script** is passed to the EC2 instance using Terraform.

On first boot, the script automatically:

- Updates system packages
- Installs Docker and Docker Compose
- Enables and starts the Docker service
- Deploys WordPress and MySQL using Docker Compose

This ensures the EC2 instance is fully configured without any manual intervention.



## Deployment Instructions

From the Terraform root directory:

```bash
terraform init
terraform plan
terraform apply
```

## Verification

After deployment:

- Navigating to the EC2 instance’s public IP address in a web browser loads the WordPress installation page
- WordPress is accessible over HTTP via port 80



## Implementation Evidence

Screenshots of the working WordPress site can be found in [./screenshots](./screenshots)



## Outputs

Terraform exposes the following outputs:

- EC2 public IP address

These outputs provide quick access to the deployed application.



## Key Concepts Demonstrated

- Infrastructure as Code using Terraform
- AWS EC2 and networking fundamentals
- Terraform module design and reuse
- Dynamic security group configuration
- Automated instance bootstrapping using user data
- Docker-based application deployment
- Debugging and resolving real-world infrastructure issues


## Notes

- All infrastructure resources are created and managed exclusively by Terraform
- No manual configuration was performed on the EC2 instance
- The deployment is fully reproducible and automated