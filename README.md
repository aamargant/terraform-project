![Terraform Linter](https://github.com/aamargant/terraform-project/actions/workflows/terraform-lint.yaml/badge.svg)
![Terraform Plan](https://github.com/aamargant/terraform-project/actions/workflows/terraform-plan.yaml/badge.svg)
![Terraform Apply](https://github.com/aamargant/terraform-project/actions/workflows/terraform-apply.yaml/badge.svg)
# Description

This project has consisted on the provision of a VPC network infrastructure with private/public subnets according to Availabitity Zones automated with Terraform modules in AWS. With the following architecture:

![Alt text](vpc-arch.png?raw=true "VPC Architecture")

Resources Created
- 1 VPC
- 1 Internet Gateway
- 1 to 3 Public Networks
- 1 to 3 Private Networks
- 1 Public Route Table attached to the public networks
- 1 to 3 Private Route Tables attached to the private networks
- 1 Public ACL handling the public networks
- 1 Private ACL handling the private networks

Project structure:
```
.
├── README.md
├── backend.tf
├── .gitignore
├── .github
│   └── workflows
│       ├── terraform-apply.yaml
│       ├── terraform-lint.yaml
│       └── terraform-plan.yaml
├── main.tf
├── modules
│   ├── acl
│   │   ├── README.md
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── nat-gw
│   │   ├── README.md
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── vpc
│       ├── README.md
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── variables.tf
└── vpc-arch.png
```

The `modules/` directory contains reusable modules that encapsulate specific pieces of infrastructure configuration.

`acl/`: This module handles the configuration of Access Control Lists (ACLs) for controlling network traffic within the VPC.<br>
`nat-gw/`: This module manages the creation of NAT Gateways for enabling outbound internet access for private subnets within the VPC.<br>
`vpc/`: This module handles the creation of the Virtual Private Cloud (VPC) itself, including subnets, route tables, and the ineternet gateway.

`terraform.tfvars.example`: This file contains variable definitions with values specific to the Terraform project. These variables can be used to parameterize the Terraform configuration and provide values for input variables.

`.github/workflows`: Contains YAML files that define CICD workflows using GitHub Actions.
- `terraform-apply.yaml`: Triggered on merging pull requests and pushing directly to master branch, applies Terraform changes to infrastructure.
- `terraform-lint.yaml`: Triggered on Terraform file changes, performs linting to maintain code quality.
- `terraform-plan.yaml`: Triggered on Terraform file changes or pull request opening, generates a plan for infrastructure changes.

`backend.tf`: This file contains backend configuration like cloud provider and the Terraform Cloud settings.

`.gitignore`: This file has been taken from [Terraform.gitignore](https://github.com/github/gitignore/blob/main/Terraform.gitignore)

# CICD

This project has been designed to run on `app.terraform.io` using the [CLI-driven Workflow](https://developer.hashicorp.com/terraform/cloud-docs/run/cli). In addition, it has implemented the deployment and validation of the infrastructure with [Github Actions](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions)

Test PR with lint validation and succesfull terraform plan: [PR #1](https://github.com/aamargant/terraform-project/pull/1)

# Usage
- `Terraform init` in the root directory and all the child modules.
- Configure [Terraform Cloud](https://developer.hashicorp.com/terraform/cloud-docs/run/cli)
- Configure your `backend.tf`configuration file with your workspace and organization.
- Execute `Terraform plat` & `Terraform apply`

# Result:
![Alt text](aws-result.png?raw=true "VPC Architecture")
