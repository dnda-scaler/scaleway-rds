resource "scaleway_rdb_acl" "main" {
  instance_id = scaleway_rdb_instance.test_database.id
  acl_rules {
    ip = "${var.my_other_adress_ip}/32"
    description = "My IP adress restriction"
  }
}