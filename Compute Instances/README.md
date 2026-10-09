# 💻 Compute Instance IaC Setup (Terraform)

This directory contains the Infrastructure as Code (IaC) declaration for the automated provisioning of a Compute Instance on Oracle Cloud Infrastructure (OCI).

## 🏗️ Provisioned Architecture

This setup expands upon the network foundation by deploying a Virtual Machine (VM) into a public subnet. The following resources are automatically generated:

1. **Compute Instance:** A lightweight VM (`VM.Standard.E2.1.Micro` - Always Free eligible) configured to run your automated workloads and scripts.
2. **Primary VNIC:** Automatically attaches the instance to the target Public Subnet, assigning a private IP and a public IP address for internet accessibility.
3. **SSH Authentication:** Injects your public SSH key into the instance's `authorized_keys` file via metadata, ensuring secure, passwordless remote access.
4. **Boot Volume:** Provisions the necessary block storage for the operating system with default performance and size configurations.

## 🚀 How to Use

This code is designed to be executed after the VCN and Subnet have been provisioned. Run the following commands in sequence to deploy the instance:

```bash
# 1. Initialize Terraform to download the OCI provider
terraform init

# 2. Review the execution plan (dry run)
terraform plan -var="compartment_id=YOUR_COMPARTMENT_OCID" -var="subnet_id=YOUR_SUBNET_OCID" -var="ssh_public_key=YOUR_SSH_PUBLIC_KEY" -var="image_id=YOUR_IMAGE_OCID" -var="availability_domain=YOUR_AD_NAME"

# 3. Apply the infrastructure to your OCI account
terraform apply -var="compartment_id=YOUR_COMPARTMENT_OCID" -var="subnet_id=YOUR_SUBNET_OCID" -var="ssh_public_key=YOUR_SSH_PUBLIC_KEY" -var="image_id=YOUR_IMAGE_OCID" -var="availability_domain=YOUR_AD_NAME"
