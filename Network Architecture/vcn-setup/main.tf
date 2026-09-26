# main.tf

variable "compartment_id" {
  description = "OCID do Compartimento onde a rede será criada"
  type        = string
}

# 1. Virtual Cloud Network (VCN)
resource "oci_core_vcn" "main_vcn" {
  compartment_id = var.compartment_id
  cidr_block     = "10.0.0.0/16"
  display_name   = "oci-beginner-vcn"
  dns_label      = "ocibeginner"
}

# 2. Internet Gateway
resource "oci_core_internet_gateway" "main_igw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "main-internet-gateway"
  enabled        = true
}

# 3. Route Table (Direcionando tráfego externo para o IGW)
resource "oci_core_default_route_table" "main_route_table" {
  manage_default_resource_id = oci_core_vcn.main_vcn.default_route_table_id
  display_name               = "public-route-table"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.main_igw.id
  }
}

# 4. Security List (Firewall básico: Permite SSH e ICMP)
resource "oci_core_default_security_list" "main_security_list" {
  manage_default_resource_id = oci_core_vcn.main_vcn.default_security_list_id
  display_name               = "public-security-list"

  # Egress: Permite todo o tráfego de saída
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  # Ingress: Permite tráfego SSH (Porta 22)
  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
  }

  # Ingress: Permite ICMP (Ping) para testes de conectividade
  ingress_security_rules {
    protocol = "1" # ICMP
    source   = "0.0.0.0/0"
    icmp_options {
      type = 3
      code = 4
    }
  }
}

# 5. Public Subnet
resource "oci_core_subnet" "public_subnet" {
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.main_vcn.id
  cidr_block        = "10.0.1.0/24"
  display_name      = "public-subnet-01"
  route_table_id    = oci_core_vcn.main_vcn.default_route_table_id
  security_list_ids = [oci_core_vcn.main_vcn.default_security_list_id]
  dns_label         = "publicsub"
}
