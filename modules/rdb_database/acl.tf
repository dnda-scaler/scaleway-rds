resource "scaleway_rdb_acl" "main" {
  count       = length(var.allowed_ips)
  instance_id = scaleway_rdb_instance.rdb_database.id
  dynamic "acl_rules" {
    for_each = var.allowed_ips
    content {
      ip          = "${acl_rules.value}/32"
      description = "Allow IP ${acl_rules.value}/32"
    }
  }
}