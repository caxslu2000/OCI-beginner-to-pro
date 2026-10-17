# 🪣 Object Storage IaC Setup (Terraform)

This directory contains the Infrastructure as Code (IaC) declaration for creating a private Object Storage Bucket in OCI.

## 🏗️ Provisioned Architecture

Object Storage is essential for storing unstructured data, database backups, application logs, or even managing your Terraform remote `.tfstate` files. The following resource is automatically generated:

1. **Object Storage Bucket:** A private bucket named `oci-beginner-bucket` provisioned in the standard storage tier. By default, it blocks all anonymous and public access, adhering to zero-trust security principles.

## 🚀 How to Use

Run the following commands in sequence to deploy the bucket:

```bash
# 1. Initialize Terraform
terraform init

# 2. Review the execution plan
terraform plan -var="compartment_id=YOUR_COMPARTMENT_OCID" -var="namespace=YOUR_TENANCY_NAMESPACE"

# 3. Apply the infrastructure
terraform apply -var="compartment_id=YOUR_COMPARTMENT_OCID" -var="namespace=YOUR_TENANCY_NAMESPACE"