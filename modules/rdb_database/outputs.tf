
output "database_ip" {
  value=scaleway_rdb_instance.rdb_database.load_balancer[0].ip
}
output "database_port" {
  value=scaleway_rdb_instance.rdb_database.load_balancer[0].port
}
output "read_replica_ip" {
   value=scaleway_rdb_read_replica.direct_replica[0].direct_access[0].ip
}

output "read_replica_port" {
   value=scaleway_rdb_read_replica.direct_replica[0].direct_access[0].port
}
