# Terraform Learning

## Overview

This repository documents my hands-on learning and practical implementation of **AWS infrastructure using Terraform**, with a focus on real-world cloud patterns, automation, and Infrastructure as Code (IaC) best practices.

Each assignment is structured as a **self-contained Terraform project**, demonstrating progressively more advanced concepts such as modular infrastructure, automated instance bootstrapping, and cloud-init–based configuration.

All infrastructure is provisioned using Terraform with no manual AWS Console configuration.



## Repository Structure

This repository is organised into separate assignment folders, each representing a complete Terraform deployment:

```text
Terraform/
├── assignment-1/
│
├── assignment-2/  
│
├── .gitignore
│
└── README.md
```
## Assignments

| Assignment | Description |
|-----------|-------------|
| [Assingment 1](./assignment-1)| Deploy WordPress on AWS using Terraform and user data |
| [Assingment 2](./assignment-2) | Deploy and configure EC2 using Terraform and cloud-init |

Each assignment contains a dedicated `README.md` with detailed explanations, architecture descriptions, and implementation evidence.





## Key Concepts Demonstrated

- Infrastructure as Code (IaC)
- Modular Terraform design
- AWS networking fundamentals
- Secure access and security group design
- Automated EC2 bootstrapping
- User data vs cloud-init configuration
- Debugging Terraform and instance boot issues
- Reproducible and version-controlled infrastructure


## Technologies Used

- **Terraform** (Infrastructure as Code)
- **AWS**
  - EC2
  - VPC
  - Subnets
  - Internet Gateway
  - Route Tables
  - Security Groups
- **Docker & Docker Compose**
- **Cloud-init**




## Notes

- Environment-specific values are supplied via local `terraform.tfvars` files and are excluded from version control
- Terraform state files are not committed to this repository
- No credentials or sensitive data are stored in this repo
- All deployments are intended for learning and demonstration purposes only



## Documentation Used

- Terraform Documentation  
  https://developer.hashicorp.com/terraform/docs

- AWS EC2 Documentation  
  https://docs.aws.amazon.com/ec2/

- AWS VPC Documentation  
  https://docs.aws.amazon.com/vpc/

- Cloud-Init Documentation  
  https://cloudinit.readthedocs.io/

- Docker Documentation  
  https://docs.docker.com/

- Docker Compose Documentation  
  https://docs.docker.com/compose/