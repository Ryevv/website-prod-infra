variable "allowed_ssh_ip" {
  description = "IP liberado para SSH (ex.: 203.0.113.25/32)"
  type        = string
}

variable "ami_id" {
  description = "ID da AMI a ser usada na EC2"
  type        = string
}

variable "AWS_ACCESS_KEY_ID" {
  description = "Access Key da AWS"
  type        = string
}

variable "aws_region" {
  description = "Região da AWS onde os recursos serão criados"
  type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "Secret Key da AWS"
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

variable "instance_type" {
  description = "Tipo da instância EC2 (ex.: t2.micro, t3.medium)"
  type        = string
}