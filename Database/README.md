# 🗄️ Autonomous Database IaC Setup (Terraform)

This directory contains the Infrastructure as Code (IaC) declaration for provisioning an Oracle Autonomous Transaction Processing (ATP) Database.

## 🏗️ Provisioned Architecture

Oracle Autonomous Database is a fully managed, preconfigured database environment. This setup deploys an "Always Free" eligible instance, perfect for testing and lightweight applications without incurring costs.

The following resource is automatically generated:
1. **Autonomous Database (ATP):** A serverless transaction processing database configured with 1 OCPU and 20GB of storage (Always Free tier specifications).

## 🚀 How to Use

Run the following commands in sequence to deploy the database:

```bash
# 1. Initialize Terraform
terraform init

# 2. Review the execution plan
terraform plan -var="compartment_id=YOUR_COMPARTMENT_OCID" -var="admin_password=YOUR_SECURE_PASSWORD"

# 3. Apply the infrastructure
terraform apply -var="compartment_id=YOUR_COMPARTMENT_OCID" -var="admin_password=YOUR_SECURE_PASSWORD"
