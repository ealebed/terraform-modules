resource "aws_s3_bucket" "self" {
  bucket = "tf-demo-${var.project_name}-${var.environment}"
}

resource "aws_s3_bucket_public_access_block" "self" {
  bucket = aws_s3_bucket.self.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "self" {
  bucket = aws_s3_bucket.self.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "self" {
  bucket = aws_s3_bucket.self.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = var.kms_key_arn
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "self" {
  bucket = aws_s3_bucket.self.id

  rule {
    id     = "abort-incomplete-mpu"
    status = "Enabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = var.abort_incomplete_mpu_days
    }
  }
}
