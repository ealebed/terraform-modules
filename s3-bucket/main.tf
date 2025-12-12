resource "aws_s3_bucket" "self" {
  bucket = "tf-demo-${var.project_name}-${var.environment}"
}
