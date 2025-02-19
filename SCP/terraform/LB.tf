# LB
resource "scp_load_balancer" "tflb" {
  vpc_id      = scp_vpc.tfvpc.id
  name        = "tflb"
  description = "LB test from Terraform"
  size        = "SMALL"
  cidr_ipv4   = "10.10.10.0/24"
}

# LB server group
resource "scp_lb_server_group" "lbvmgp" {
  lb_id     = scp_load_balancer.tflb.id
  name      = "tf-tcp-group"
  algorithm = "ROUND_ROBIN"

  server_group_member {
    join_state  = "ENABLED"
    object_type = "INSTANCE"
    object_id   = scp_virtual_server.tfvm1.id
    weight      = 10
  }
  server_group_member {
    join_state  = "ENABLED"
    object_type = "INSTANCE"
    object_id   = scp_virtual_server.tfvm2.id
    weight      = 10
  }

  # Health check
  monitor_protocol     = "TCP"
  monitor_port         = 406
  monitor_interval_sec = 5
  monitor_timeout_sec  = 5
  monitor_count        = 5
  depends_on = [scp_load_balancer.tflb, scp_virtual_server.tfvm1, scp_virtual_server.tfvm2]
}


# LB profile
# 지속성 프로파일
resource "scp_lb_profile" "profile" {
  lb_id     = scp_load_balancer.tflb.id
  name             = "testprofile"
  category         = "PERSISTENCE"
  persistence_type = "SOURCE_IP"
  depends_on = [scp_load_balancer.tflb]
}

# 앱 프로파일
resource "scp_lb_profile" "app_profile" {
  lb_id     = scp_load_balancer.tflb.id
  name            = "appprofile"
  category        = "APPLICATION"
  layer_type      = "L4"
  session_timeout = 30
}

# LB service
resource "scp_lb_service" "lbsvc" {
  lb_id     = scp_load_balancer.tflb.id
  name             = "test-lbsvc"
  layer_type       = "L4"
  protocol         = "TCP"
  service_ports    = "406"
  forwarding_ports = "407"
  service_ipv4     = "10.10.10.10"
  persistence      = "SOURCE_IP"
  app_profile_id   = scp_lb_profile.app_profile.id
  persistence_profile_id = scp_lb_profile.profile.id
  depends_on = [scp_load_balancer.tflb, scp_lb_profile.app_profile, scp_lb_profile.profile]
}