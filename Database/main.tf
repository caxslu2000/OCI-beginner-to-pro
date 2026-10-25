variable "compartment_id" {
  description = "OCID do Compartimento"
  type        = string
}

variable "admin_password" {
  description = "Senha do usuario ADMIN do banco de dados (deve conter maiusculas, minusculas e numeros)"
  type        = string
  sensitive   = true
}

# 1. Autonomous Database (Always Free)
resource "oci_database_autonomous_database" "main_atp" {
  compartment_id           = var.compartment_id
  db_name                  = "ocibeginnerdb"
  display_name             = "oci-beginner-atp"
  db_workload              = "OLTP" # Transaction Processing
  is_free_tier             = true   # Garante que sera alocado na camada gratuita
  admin_password           = var.admin_password
  
  # Configuracoes padrao do Free Tier (1 OCPU, 20GB)
  cpu_core_count           = 1
  data_storage_size_in_tbs = 1
}