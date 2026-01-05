# Assignment 2 – EC2 Deployment Using Cloud-Init

## Objective

The objective of this assignment is to deploy an EC2 instance on AWS using **Terraform and cloud-init**, demonstrating how Infrastructure as Code (IaC) can be used to provision infrastructure and fully automate instance configuration at boot time using a declarative approach.

The deployment includes:
- An EC2 instance provisioned via Terraform
- Security groups
- A cloud-init configuration to install and configure software
- A working public endpoint
- All resources provisioned via Terraform

All infrastructure in this assignment was provisioned and managed **exclusively using Terraform**, with no manual configuration performed via the AWS Console.

This assignment demonstrates how Terraform integrates with **cloud-init** to automate instance configuration during first boot.



## Architecture Overview

This deployment consists of:

- A custom **VPC** with a public subnet  
- An **Internet Gateway** and public route table  
- A **Security Group** allowing HTTP and SSH access  
- An **EC2 instance** provisioned via Terraform  
- A **cloud-init YAML file** used to automate configuration on first boot  

Terraform modules are used to separate infrastructure logic from environment-specific configuration.

The EC2 module consumes outputs from the VPC module to ensure clear separation of concerns and explicit infrastructure dependencies.


## Folder Structure

```text
assignment-1/
├── docker-setup/
│   └── docker-compose.yml
│
├── screenshots/
│   └── working-public-endpoint.png
│
├── scripts/
│   └── user_data.sh
│
├── terraform-setup/
│  ├── modules/
│  │   ├── ec2/
│  │   │   └── ec2.tf
│  │   │   └── outputs.tf
│  │   │   └── variables.tf
│  │   └── vpc/
│  │       └── vpc.tf
│  │       └── outputs.tf
│  │       └── variables.tf
│  │ 
│  ├── main.tf
│  ├── outputs.tf
│  ├── provider.tf
│  └── variables.tf
│
└── README.md
```

## Notice

Environment-specific values are supplied via a local `terraform.tfvars` file which is excluded from version control.



## Infrastructure Provisioned via Terraform

### Module-Based Infrastructure

Infrastructure is defined using **separate, focused Terraform modules**, each responsible for a specific layer of the stack:

- **VPC module**
  - VPC
  - Subnet
  - Internet Gateway
  - Route table and route table association

- **EC2 module**
  - Security group with dynamic ingress and egress rules
  - SSH key pair association
  - EC2 instance

Each module contains only the resources it owns, while shared values (such as VPC and subnet IDs) are passed between modules using Terraform outputs and input variables.  
The root Terraform configuration supplies environment-specific values via variables and `terraform.tfvars`.

This separation improves code organisation, reusability, and clarity.



## Cloud-Init & Instance Configuration

A **cloud-init YAML configuration file** is passed to the EC2 instance using Terraform via the `user_data` mechanism.

On first boot, cloud-init automatically:

- Updates system packages
- Installs required software
- Configures and enables services
- Ensures the instance is fully configured before becoming available

Unlike a shell-based user data script, cloud-init provides a **declarative and structured approach** to instance configuration, making the setup more predictable and easier to maintain.

## Deployment Instructions

From the Terraform root directory:

```bash
terraform init
terraform plan
terraform apply
```



## Verification

After deployment:

- The EC2 instance is reachable via its public IP address
- Cloud-init completes successfully on first boot
- Installed services are running automatically without manual setup


## Implementation Evidence

Screenshots demonstrating successful instance configuration can be found in:

[./screenshots](./screenshots)



## Outputs

Terraform exposes the following outputs:

- EC2 public IP address

These outputs provide quick access to the deployed instance.



## Key Concepts Demonstrated

- Infrastructure as Code using Terraform
- AWS EC2 and networking fundamentals
- Terraform module composition and reuse
- Instance bootstrapping using cloud-init
- Declarative configuration management
- Automated provisioning with zero manual intervention
- Understanding the difference between user-data scripts and cloud-init



## Notes

- All infrastructure resources are created and managed exclusively by Terraform
- No manual configuration was performed on the EC2 instance
- Instance configuration is fully automated using cloud-init
- The deployment is fully reproducible and automated