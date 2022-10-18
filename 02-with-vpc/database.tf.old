resource "scaleway_rdb_instance" "test_database" {
  name           = "test-rdb"
  node_type      = "DB-DEV-S"
  engine         = "PostgreSQL-14"
  is_ha_cluster  = false
  disable_backup = true
  user_name      = "root"
  password       = "Test1234!&"
   private_network {
        ip_net = "192.168.1.254/24" #pool high
        pn_id = "${scaleway_vpc_private_network.pn02.id}"
    }
}
resource "scaleway_rdb_database" "main" {
  instance_id    = scaleway_rdb_instance.test_database.id
  name           = "my-new-database"
}
resource "scaleway_rdb_privilege" "priv" {
  instance_id   = scaleway_rdb_instance.test_database.id
  user_name     = "root"
  database_name = scaleway_rdb_database.main.name
  permission    = "all"

  depends_on = [ scaleway_rdb_database.main]
}


output "ip_access" {
  value=scaleway_rdb_instance.test_database.load_balancer[0].ip
}
output "port_access" {
  value=scaleway_rdb_instance.test_database.load_balancer[0].port
}
