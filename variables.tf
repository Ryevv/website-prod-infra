variable "ami_id" {
  description = "ID da AMI a ser usada"
  type        = string
}

variable "key_name" {
  description = "Nome da key pair"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "allowed_ssh_ip" {
  description = "IP liberado para SSH"
  type        = string
}
