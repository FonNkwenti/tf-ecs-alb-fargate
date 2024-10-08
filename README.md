# Using Terraform to build an ECS cluster running on AWS Fargate
This project demonstrates how to use Terraform to build an ECS cluster running containers hostage on AWS Fargate.

## Prerequisites
Before you begin, ensure you have the following:

- AWS account
- Terraform installed locally
- AWS CLI installed and configured with appropriate access credentials

<!-- ## Architecture
![Diagram](private-rest-api-part2-white.webp) -->

---

## Project Structure
```bash
|- locals.tf
|- provider.tf
|- terraform.tfvars.tf
|- variables.tf
|- vpc.tf
|- ec2.tf
|- outputs.tf
|- security-groups.tf
```
---
## Getting Started

1. Clone this repository:

   ```bash
   git clone https://github.com/FonNkwenti/tf-ecs-alb-fargate.git
   ```
2. Navigate to the project directory:
   ```bash
   cd tf-ecs-alb-fargate
   ```
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Review and modify `variables.tf` to customize your API configurations.
5. Create a `terraform.tfvars` file in the root directory and pass in values for `region`, `account_id`, `tag_environment` and `tag_project`
   ```bash
    region               = "eu-central-1"
    account_id           = <<your account id>>
    tag_environment      = "dev"
    tag_project          = "tf-ecs-alb-fargate"
   ```
6. Apply the Terraform configure:
   ```bash
   terraform apply
   ```
7. After the apply is complete, Terraform will output EC2 instance's DNS name so you can use to test traffic in and out of the VPC.

---

## Clean up
Remove all resources created by Terraform.
   ```
   terraform destroy
   ```

---

<!-- ## Tutorials
[Private Serverless REST API with API Gateway: Lambda, DynamoDB, VPC Endpoints & Terraform - Part 1](https://www.serverlessguru.com/blog/private-serverless-rest-api-with-api-gateway-lambda-dynamodb-vpc-endpoints-terraform---part-1) -->

## License

This project is licensed under the MIT License - see the `LICENSE` file for details.
