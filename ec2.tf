# SUBINDO INSTÂNCIA EC2
resource "aws_instance" "server_prod" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg_website.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name
  user_data              = file("user_data.sh")

  tags = {
    Name        = "server_prod"
    Provisioned = "Terraform"
  }
}

# Security Groups
resource "aws_security_group" "sg_website" {
  name   = "sg_website"
  vpc_id = var.vpc_id

  tags = {
    Name        = "server_prod"
    Provisioned = "Terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh_allow" {
  security_group_id = aws_security_group.sg_website.id
  cidr_ipv4         = var.allowed_ssh_ip
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "http_allow" {
  security_group_id = aws_security_group.sg_website.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "https_allow" {
  security_group_id = aws_security_group.sg_website.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.sg_website.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = -1
}

# CONFIGURAÇÃO IAM ROLE
resource "aws_iam_role" "role_ec2" {
  name = "ec2-s3-ec2-readonly-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "s3-ec2_readonly_policy" {
  name = "s3-ec2-readonly-policy"
  role = aws_iam_role.role_ec2.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "ec2:Describe*"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_s3_ec2_readonly_instance_profile"
  role = aws_iam_role.role_ec2.name
}
