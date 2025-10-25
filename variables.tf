variable "allowed_ssh_ip" {
  description = "IP liberado para SSH (ex.: 203.0.113.25/32)"
  type        = string
}

variable "ami_id" {
  description = "ID da AMI a ser usada na EC2"
  type        = string
}

variable "key_name" {
  description = "Nome do key pair para acesso SSH"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde o security group será criado"
  type        = string
}

