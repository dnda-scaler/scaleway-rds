module "rdb_database" {
  source = "../modules/rdb_database"
  allowed_ips = var.allowed_ips
  db_name = var.db_name
  node_type = var.node_type
  is_ha_cluster = var.is_ha_cluster
  username = var.username
  password = var.password
  engine=var.engine
  read_replicas = var.read_replicas
}