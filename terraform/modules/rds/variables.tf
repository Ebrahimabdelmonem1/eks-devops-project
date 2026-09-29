variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "database_name" {
  type    = string
  default = "devops"
}

variable "database_username" {
  type    = string
  default = "devops"
}

variable "database_password" {
  type      = string
  sensitive = true
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}
variable "eks_node_security_group_id" {
  type = string
}