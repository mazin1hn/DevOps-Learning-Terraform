# Assignment 2 – EC2 Deployment Using Cloud-Init

## Objective

The objective of this assignment is to deploy and configure an **EC2 instance on AWS** using **Terraform and cloud-init**, demonstrating how instance configuration can be fully automated at boot time without any manual intervention.

The deployment includes:
- An EC2 instance provisioned using Terraform
- Security groups for controlled access
- A cloud-init YAML configuration to install and configure software on boot
- A working public endpoint
- All resources provisioned via Terraform

All infrastructure in this assignment was provisioned and managed **exclusively using Terraform**, with no manual configuration performed via the AWS Console.

This assignment demonstrates how Terraform integrates with **cloud-init** to automate instance configuration.



## Architecture Overview

This deployment consists of:

- A custom **VPC** with a public subnet  
- An **Internet Gateway** and public route table  
- A **Security Group** allowing HTTP and SSH access  
- An **EC2 instance** configured automatically using cloud-init  
- Application services installed and started during first boot  

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
│   └── cloud-init.yml
│
├── terraform-setup/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
│
└── README.md
```



## Notice

Environment-specific values are supplied via a local `terraform.tfvars` file which is excluded from version control.



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



## Cloud-Init Configuration

A **cloud-init YAML file** is passed to the EC2 instance using Terraform via the `user_data` argument.

During the first boot of the instance, cloud-init automatically:

- Updates system packages
- Installs required software
- Enables and starts services
- Ensures the instance is fully configured and ready for use

Cloud-init runs **once per instance**, ensuring consistent and repeatable configuration without manual steps.


## Deployment Instructions

From the Terraform root directory:

```bash
terraform init
terraform plan
terraform apply
```


## Verification

After deployment:

- Navigating to the EC2 instance’s public IP address confirms the service is running
- The instance is fully configured immediately after launch with no manual intervention



## Implementation Evidence

Screenshots of the working WordPress site can be found in [./screenshots](./screenshots)

---

## Outputs

Terraform exposes the following outputs:

- EC2 public IP address

These outputs provide quick access to the deployed instance.



## Key Concepts Demonstrated

- Infrastructure as Code using Terraform
- AWS EC2 provisioning
- Cloud-init for automated instance configuration
- Terraform module design and reuse
- Secure and repeatable boot-time configuration
- Eliminating manual server setup
- Debugging cloud-init execution issues



## Notes

- All infrastructure resources are created and managed exclusively by Terraform
- Cloud-init is used instead of a shell-based user data script
- No manual configuration was performed on the EC2 instance
- The deployment is fully reproducible and automated