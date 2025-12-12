variable "environment" {
  description = "The deployment environment"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS key ARN or alias for default bucket encryption. Defaults to AWS-managed S3 KMS key."
  type        = string
  default     = "alias/aws/s3"
}

variable "abort_incomplete_mpu_days" {
  description = "Number of days after initiation to abort incomplete multipart uploads."
  type        = number
  default     = 7
}
