resource "aws_ecr_repository" "ecr_website" {
  name                 = "website_prod"
  image_tag_mutability = "MUTABLE"
}

