resource "local_file" "database_config" {
    content  = jsonencode({
            db_host=module.rdb_database.database_ip,
            db_port=module.rdb_database.database_port,
            read_replica_ip=module.rdb_database.read_replica_ip,
            username=var.username,
            password=var.password,
            read_replica_port:module.rdb_database.read_replica_port
            db_name=var.db_name
    })
    filename = "../config/default.json"
}