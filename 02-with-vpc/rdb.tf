module "rdb_database" {
  source        = "../modules/rdb_database"
  db_name       = var.db_name
  node_type     = var.node_type
  is_ha_cluster = var.is_ha_cluster
  username      = var.username
  password      = var.password
  engine        = var.engine
  read_replicas = var.read_replicas
  private_network_config = [{
    id = scaleway_vpc_private_network.pn02.id
    ip_net = var.db_private_ip_cidr
  }]
}