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
}

variable "is_ha_cluster" {
  type=bool
}

variable "read_replicas" {
  type=number
}