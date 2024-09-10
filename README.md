This repository contains a Terraform configuration to create a restricted IAM policy for managing AWS resources like CloudFormation, CloudWatch Logs, Lambda, API Gateway, and Serverless applications.

## Prerequisites

Before you can use the Terraform scripts, ensure that you have the following:

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An AWS account and credentials configured on your local machine.
  - You can use the AWS CLI to configure your credentials by running:
    ```bash
    aws configure
    ```

## Steps to Set Up

1. **Clone the repository**:
   Clone this repository to your local machine.
   ```bash
   git clone <repository-url>

2. **Initialize Terraform**:
   Navigate to the directory containing the Terraform configuration files and initialize Terraform.
   ```bash
   cd <repository-directory>
   terraform init
   ```

3. **Run Terraform**:
   Run the Terraform commands to create the IAM policy.
   ```bash
   terraform plan
   terraform apply
   ```
