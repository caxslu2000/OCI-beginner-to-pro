variable "tenancy_id" {
  description = "OCID do Tenancy raiz (Root)"
  type        = string
}

# 1. Compartment
resource "oci_identity_compartment" "main_compartment" {
  compartment_id = var.tenancy_id
  description    = "Compartment dedicado para os laboratorios OCI Beginner to Pro"
  name           = "oci-beginner-compartment"
  enable_delete  = true # Permite destruir o compartimento via terraform destroy
}