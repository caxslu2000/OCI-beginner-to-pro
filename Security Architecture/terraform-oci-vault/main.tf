variable "compartment_id" {
  description = "OCID do Compartimento"
  type        = string
}

# 1. OCI Vault
resource "oci_kms_vault" "main_vault" {
  compartment_id = var.compartment_id
  display_name   = "oci-beginner-vault"
  vault_type     = "DEFAULT"
}

# 2. Master Encryption Key (MEK)
resource "oci_kms_key" "main_key" {
  compartment_id      = var.compartment_id
  display_name        = "oci-beginner-master-key"
  management_endpoint = oci_kms_vault.main_vault.management_endpoint
  
  key_shape {
    algorithm = "AES"
    length    = 32 # 256-bit encryption
  }
  
  protection_mode = "SOFTWARE" # Ideal para laboratorios/testes
}