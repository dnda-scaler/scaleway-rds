resource "local_file" "database_config" {
    content  = jsonencode({
            username=var.username,
            password=var.password,
            db_host=module.rdb_database.database_ip,
            db_port=module.rdb_database.database_port,
            has_read_replica=var.read_replicas>0,
            read_replica_ip=module.rdb_database.read_replica_ip,
            read_replica_port=module.rdb_database.read_replica_port,
            db_name=var.db_name
    })
    filename = "../config/default.json"
}