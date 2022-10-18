variable "allowed_ips" {
  type=list(string)
}
variable "username" {
  type=string
}
variable "password" {
  type=string
}
variable "node_type" {
  type=string
  default = "DB-DEV-S"
}
variable "db_name" {
  type=string
  default ="test_rdb"
}
variable "engine" {
  type=string
  default = "PostgreSQL-14"
}

variable "is_ha_cluster" {
  type=bool
  default = false
}

variable "read_replicas" {
  type=number
}