# 🔐 OCI Vault (KMS) IaC Setup (Terraform)

This directory contains the Infrastructure as Code (IaC) declaration for provisioning an OCI Vault and a Master Encryption Key.

## 🏗️ Provisioned Architecture

Hardcoding secrets and passwords in code is a severe security risk. This setup leverages OCI Key Management Service (KMS) to provision a secure vault.

The following resources are automatically generated:
1. **OCI Vault:** A centralized, highly secure container used to store cryptographic keys and secrets.
2. **Master Encryption Key (MEK):** An AES-256 symmetric encryption key used to encrypt and decrypt sensitive data (like database passwords or API tokens) safely within OCI.

## 🚀 How to Use

Run the following commands in sequence:

```bash
# 1. Initialize Terraform
terraform init

# 2. Review the execution plan
terraform plan -var="compartment_id=YOUR_COMPARTMENT_OCID"

# 3. Apply the infrastructure
terraform apply -var="compartment_id=YOUR_COMPARTMENT_OCID"
