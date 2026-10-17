variable "compartment_id" {
  description = "OCID do Compartimento"
  type        = string
}

variable "namespace" {
  description = "Namespace do Object Storage (encontrado nos detalhes do Tenancy)"
  type        = string
}

# 1. Private Object Storage Bucket
resource "oci_objectstorage_bucket" "main_bucket" {
  compartment_id = var.compartment_id
  name           = "oci-beginner-bucket"
  namespace      = var.namespace
  access_type    = "NoPublicAccess" # Bloqueia acesso publico
  storage_tier   = "Standard"
  
  # Habilita o versionamento de objetos (ideal para backups e tfstate)
  versioning     = "Enabled" 
}