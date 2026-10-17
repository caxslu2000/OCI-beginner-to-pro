# 🛡️ Network Security Group IaC Setup (Terraform)

This directory contains the Infrastructure as Code (IaC) declaration for provisioning Network Security Groups (NSGs) in OCI.

## 🏗️ Provisioned Architecture

While Security Lists apply firewall rules at the subnet level, NSGs provide micro-segmentation by applying rules directly to the Virtual Network Interface Cards (VNICs) of specific instances. The following resources are automatically generated:

1. **Network Security Group (NSG):** A logical entity named `web-server-nsg` decoupled from the subnet architecture.
2. **NSG Security Rules:** 
   - **Ingress HTTP:** Opens port 80 strictly for web traffic.
   - **Ingress HTTPS:** Opens port 443 for secure web traffic.

## 🚀 How to Use

Run the following commands in sequence to deploy the NSG:

```bash
# 1. Initialize Terraform
terraform init

# 2. Review the execution plan
terraform plan -var="compartment_id=YOUR_COMPARTMENT_OCID" -var="vcn_id=YOUR_VCN_OCID"

# 3. Apply the infrastructure
terraform apply -var="compartment_id=YOUR_COMPARTMENT_OCID" -var="vcn_id=YOUR_VCN_OCID"