resource "aws_s3_bucket" "alb_access_logs" {
  bucket = var.s3_bucket
  acl    = "public-read-write"
  policy = data.template_file.alb-temp.rendered

  tags = {
    Name        = "terraform-alb-access-jawnt"
    Environment = terraform.workspace
  }
}
