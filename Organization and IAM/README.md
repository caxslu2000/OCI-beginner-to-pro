# 🗂️ Compartment IaC Setup (Terraform)

This directory contains the Infrastructure as Code (IaC) declaration for creating an OCI Compartment. 

## 🏗️ Provisioned Architecture

In Oracle Cloud Infrastructure, Compartments are the primary building blocks for resource isolation and access control. Instead of deploying resources in the root tenancy, this setup creates a dedicated compartment to house all subsequent infrastructure (VCN, Compute, Storage).

The following resource is automatically generated:
1. **Compartment:** A logical container named `oci-beginner-compartment` that allows you to isolate resources, apply specific IAM policies, and track billing usage separately.

## 🚀 How to Use

Run the following commands in sequence to deploy the compartment:

```bash
# 1. Initialize Terraform
terraform init

# 2. Review the execution plan
terraform plan -var="tenancy_id=YOUR_TENANCY_OCID"

# 3. Apply the infrastructure
terraform apply -var="tenancy_id=YOUR_TENANCY_OCID"
