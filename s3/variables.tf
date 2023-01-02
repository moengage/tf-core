variable "acl" {
  description = "The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write. Defaults to private"
  default     = "private"
}

variable "created_by" {
  description = "Owner"
}

variable "cluster" {
  default     = "default"
  description = "Cluster identifier"
}

variable "environment" {
  description = "Environment name"
}

variable "unique_prefix" {
  description = "Unique prefix which will be appended to S3 bucket name and dynamodb table name"
  default     = "moe"
}

variable "region" {
  description = "AWS Region"
}

variable "team_name" {
  description = "Team Name"
}

variable "business_name" {
  description = "Business Name"
}

variable "service_name" {
  description = "Service Name"
}

variable "subservice_name" {
  description = "Sub Service Name"
}

variable "bucket_name" {
  description = "Bucket Name"
}

variable "versioning_enabled" {
  description = "Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket."
  default     = true
  type        = bool
}

variable "use_unique_prefix" {
  description = "Bool condition whether to use unique_prefix in resource name"
  default     = true
  type        = bool
}

variable "block_public_acls" {
  description = "Bool condition whether to block public ACLs for this bucket"
  default     = true
  type        = bool
}

variable "block_public_policy" {
  description = "Bool condition whether to block public bucket policies for this bucket"
  default     = true
  type        = bool
}

variable "ignore_public_acls" {
  description = "Bool condition whether to ignore public ACLs for this bucket"
  default     = true
  type        = bool
}

variable "restrict_public_buckets" {
  description = "Bool condition whether to restrict public bucket policies for this bucket"
  default     = true
  type        = bool
}

variable "s3_bucket_policy_json" {
  description = "S3 bucket policy json. Multi line String can be included in between <<EOF ... EOF"
  default     = ""
  type        = string
}