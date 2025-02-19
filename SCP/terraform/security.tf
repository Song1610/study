# Security group
resource "scp_security_group" "tfsg" {
  vpc_id      = scp_vpc.tfvpc.id
  name        = "tfsg"
  description = "SecurityGroup generated from terraform"
  is_loggable = false
  depends_on = [scp_subnet.tfsub]
}

#sg rule
resource "scp_security_group_rule" "out_all" {
  security_group_id = scp_security_group.tfsg.id
  direction         = "out"
  description       = "sg rule from Terraform"
  addresses_ipv4 = [
    "0.0.0.0/0"
  ]
  service {
    type  = "all"
  }
}
resource "scp_security_group_rule" "in_1" {
  security_group_id = scp_security_group.tfsg.id
  direction         = "in"
  description       = "sg rule test from Terraform"
  addresses_ipv4 = [
    "192.168.100.0/24"
  ]
  service {
    type  = "tcp"
    value = "22"
  }
  service {
    type  = "tcp"
    value = "80"
  }
  service {
    type  = "ICMP_ALL"
  }
}