variable "compartment_id" {
  description = "OCID do Compartimento"
  type        = string
}

variable "subnet_id" {
  description = "OCID da Sub-rede Publica (onde o LB recebera o IP publico)"
  type        = string
}

# 1. Public Load Balancer (Flexible Shape)
resource "oci_load_balancer_load_balancer" "main_lb" {
  compartment_id = var.compartment_id
  display_name   = "oci-beginner-lb"
  shape_name     = "flexible"
  subnet_ids     = [var.subnet_id]
  is_private     = false # Define como publico (acessivel via internet)

  shape_details {
    minimum_bandwidth_in_mbps = 10
    maximum_bandwidth_in_mbps = 100
  }
}