resource "scaleway_instance_server" "instance" {
  name  = "mysql-admin-server"
  type  = "DEV1-S"
  image = "ubuntu_focal"

  enable_ipv6 = true
  user_data = {
    cloud-init = <<-EOT
    #cloud-config
    runcmd:
      - apt-get update
      - apt-get install -y postgresql-client -y
      - apt-get install -y postgresql-client-common -y
    EOT
  }
  private_network {
    pn_id = scaleway_vpc_private_network.pn02.id
  }
}