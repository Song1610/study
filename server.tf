resource "scp_virtual_server" "tfserver" {
  virtual_server_name = "tfserver"
  key_pair_id = "KEY_PAIR-________"
  server_type = "s1v2m4"
  image_id    = data.scp_standard_image.rocky.id
  vpc_id      = "VPC-________"
  subnet_id   = "SUBNET-________"
  availability_zone_name = "AZ1"
  internal_ip_address = "X.X.X.X"
  nat_enabled = true
  public_ip_id = "PUBLIC_IP-________"
  contract_discount = "None"
  os_storage_name      = "tfserver"
  os_storage_size_gb   = 100
  os_storage_encrypted = false
  security_group_ids = ["FIREWALL_SECURITY_GROUP-________"]
  use_dns = false
  state = "RUNNING"
  external_storage {
    name            = "tfserver-add"
    product_name    = "SSD"
    storage_size_gb = 10
    encrypted       = false
  }
}