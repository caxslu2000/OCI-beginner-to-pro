# ⚖️ Load Balancer IaC Setup (Terraform)

This directory contains the Infrastructure as Code (IaC) declaration for provisioning a public Load Balancer in OCI.

## 🏗️ Provisioned Architecture

To ensure high availability and distribute incoming traffic across multiple Compute instances, this setup provisions a flexible Load Balancer. 

The following resource is automatically generated:
1. **Public Load Balancer:** A flexible load balancer associated with a public subnet, configured with dynamic bandwidth (minimum 10 Mbps, maximum 100 Mbps) to optimize costs while handling traffic spikes.

## 🚀 How to Use

Run the following commands in sequence:

```bash
# 1. Initialize Terraform
terraform init

# 2. Review the execution plan
terraform plan -var="compartment_id=YOUR_COMPARTMENT_OCID" -var="subnet_id=YOUR_SUBNET_OCID"

# 3. Apply the infrastructure
terraform apply -var="compartment_id=YOUR_COMPARTMENT_OCID" -var="subnet_id=YOUR_SUBNET_OCID"