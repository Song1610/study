terraform {
  required_providers {
    scp = {
      version = "3.5.3"
      source  = "SamsungSDSCloud/samsungcloudplatform"
    }
  }
}

provider "scp" {
}

data "scp_region" "my_region" {
}


# vpc
resource "scp_vpc" "tfvpc" {
  name        = "tfvpc"
  description = "terraform test vpc"
  region      = "KR-WEST"
}

# igw
resource "scp_internet_gateway" "igw" {
  vpc_id      = scp_vpc.tfvpc.id
  igw_type    = "SHARED"
  description = "terraform vpc igw"
  depends_on = [scp_vpc.tfvpc, scp_subnet.tfsub]
}

# subnet
resource "scp_subnet" "tfsub" {
  vpc_id      = scp_vpc.tfvic.id
  name        = "tfsub"
  type        = "PUBLIC"
  cidr_ipv4   = "192.168.10.0/24"
  description = "terraform test subnet"
  depends_on = [scp_vpc.tfvpc]
}
