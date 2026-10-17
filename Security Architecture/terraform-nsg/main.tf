variable "compartment_id" {
  description = "OCID do Compartimento"
  type        = string
}

variable "vcn_id" {
  description = "OCID da VCN onde o NSG vai operar"
  type        = string
}

# 1. Network Security Group
resource "oci_core_network_security_group" "web_nsg" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "web-server-nsg"
}

# 2. NSG Rule: Allow HTTP (Port 80)
resource "oci_core_network_security_group_security_rule" "allow_http" {
  network_security_group_id = oci_core_network_security_group.web_nsg.id
  direction                 = "INGRESS"
  protocol                  = "6" # TCP
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  
  tcp_options {
    destination_port_range {
      max = 80
      min = 80
    }
  }
}

# 3. NSG Rule: Allow HTTPS (Port 443)
resource "oci_core_network_security_group_security_rule" "allow_https" {
  network_security_group_id = oci_core_network_security_group.web_nsg.id
  direction                 = "INGRESS"
  protocol                  = "6" # TCP
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  
  tcp_options {
    destination_port_range {
      max = 443
      min = 443
    }
  }
}