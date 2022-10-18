resource "scaleway_rdb_instance" "rdb_database" {
  name           = var.db_name
  node_type      = var.node_type
  engine         = var.engine
  is_ha_cluster  = var.is_ha_cluster
  disable_backup = true
  user_name      = var.username
  password       = var.password
  dynamic "private_network"{
    for_each = var.private_network_config
    content{
        ip_net = private_network.value.ip_net
        pn_id = private_network.value.id
    }
  }
}
resource "scaleway_rdb_database" "main" {
  instance_id = scaleway_rdb_instance.rdb_database.id
  name        = var.db_name
}

resource "scaleway_rdb_privilege" "priv" {
  instance_id   = scaleway_rdb_instance.rdb_database.id
  user_name     = var.username
  database_name = scaleway_rdb_database.main.name
  permission    = "all"

  depends_on = [scaleway_rdb_database.main]
}

resource "scaleway_rdb_read_replica" "direct_replica" {
  count       = var.read_replicas
  instance_id = scaleway_rdb_instance.rdb_database.id
  direct_access {}
}