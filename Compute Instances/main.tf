---

### Ficheiro: `main.tf`
Este código provisiona a máquina virtual da camada *Always Free* (formato Micro), anexa-a à sub-rede que criou anteriormente e injeta a sua chave SSH para permitir o acesso.

```hcl
# main.tf

variable "compartment_id" {
  description = "OCID do Compartimento"
  type        = string
}

variable "subnet_id" {
  description = "OCID da Sub-rede Pública criada anteriormente"
  type        = string
}

variable "ssh_public_key" {
  description = "Sua chave pública SSH (ex: ssh-rsa AAAAB3...)"
  type        = string
}

variable "image_id" {
  description = "OCID da imagem do SO (ex: Oracle Linux 8 ou Ubuntu)"
  type        = string
}

variable "availability_domain" {
  description = "Nome do Availability Domain (ex: Uocm:US-ASHBURN-AD-1)"
  type        = string
}

# 1. Compute Instance (VM)
resource "oci_core_instance" "main_instance" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  shape               = "VM.Standard.E2.1.Micro" # Shape elegível para Always Free
  display_name        = "oci-beginner-vm"

  # Configuração de Rede (VNIC)
  create_vnic_details {
    subnet_id        = var.subnet_id
    display_name     = "primary-vnic"
    assign_public_ip = true
  }

  # Configuração do Sistema Operativo
  source_details {
    source_type = "image"
    source_id   = var.image_id
  }

  # Injeção da Chave SSH para acesso remoto seguro
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}