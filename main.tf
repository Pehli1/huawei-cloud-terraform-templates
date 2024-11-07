# 1. Provider Ayarları
provider "huaweicloud" {
  access_key = "IXCI2HFKKV76XREGE7R2"
  secret_key = "cmak3ly0sPjW6mF8zyaXuiNBCND6owMN7bX2epWj"
  region     = "cn-north-4"  # Kendi bölgenizi kullanın
}

# 2. VPC (Virtual Private Cloud) Kaynağı
resource "huaweicloud_vpc" "my_vpc" {
  name = "example_vpc"
  cidr = "192.168.0.0/16"
}

# 3. Subnet Kaynağı
resource "huaweicloud_vpc_subnet" "my_subnet" {
  vpc_id    = huaweicloud_vpc.my_vpc.id
  name      = "example_subnet"
  cidr      = "192.168.1.0/24"
  gateway_ip = "192.168.1.1"
  dhcp_enable = true
}

# 4. Çıkış (Output)
output "vpc_id" {
  value = huaweicloud_vpc.my_vpc.id
}

output "subnet_id" {
  value = huaweicloud_vpc_subnet.my_subnet.id
}
