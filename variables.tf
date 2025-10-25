variable "ALLOWED_SSH_IP" {
  description = "IP liberado para SSH "
  type        = string
}

variable "AMI_ID" {
  description = "ID da AMI a ser usada na EC2"
  type        = string
}

variable "AWS_ACCESS_KEY_ID" {
  description = "Access Key da AWS"
  type        = string
}

variable "AWS_REGION" {
  description = "Região da AWS onde os recursos serão criados"
  type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "Secret Key da AWS"
  type        = string
}

variable "KEY_NAME" {
  description = "Nome do key pair para acesso SSH"
  type        = string
}

variable "VPC_ID" {
  description = "ID da VPC onde o security group será criado"
  type        = string
}
