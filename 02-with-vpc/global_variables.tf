variable "username" {
  type = string
}
variable "password" {
  type = string
}
variable "node_type" {
  type    = string
  default = "DB-DEV-S"
}
variable "db_name" {
  type    = string
  default = "test_rdb"
}
variable "engine" {
  type    = string
  default = "PostgreSQL-14"
}

variable "is_ha_cluster" {
  type    = bool
  default = false
}

variable "read_replicas" {
  type = number
}

variable "db_private_ip_cidr" {
  type=string
  default ="192.168.0.254/24"
}

variable "private_network_cidr" {
  type=string
  default ="192.168.0.0/24"
}