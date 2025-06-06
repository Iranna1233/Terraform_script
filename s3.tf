# Created Bucket mw-dev-athena-results
resource "aws_s3_bucket" "mw-dev-athena-results" {
    bucket = "mw-dev-athena-results"
  tags = {
    Enviroment: "dev"
  }  
}
 
resource "aws_s3_bucket_versioning" "versioning-mw-dev-athena-results" {
  bucket = aws_s3_bucket.mw-dev-athena-results.id
  versioning_configuration {
    status = "Enabled"
  }
}
 
resource "aws_s3_bucket_public_access_block" "mw-dev-athena-results" {
  bucket = aws_s3_bucket.mw-dev-athena-results.id
 
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
 
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket-server-mw-dev-athena-results"  {
  bucket = aws_s3_bucket.mw-dev-athena-results.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
 
resource "aws_s3_bucket_policy" "mw-dev-athena-resultspolicy" {
  bucket = aws_s3_bucket.mw-dev-athena-results.id
 
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowHTTPSRequestsOnly",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::mw-dev-athena-results/*"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      }
    }
  ]
}
POLICY
}
 
resource "aws_s3_bucket_ownership_controls" "s3-bucket-acl-ownership-mw-dev-athena-results" {
  bucket = aws_s3_bucket.mw-dev-athena-results.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
 
resource "aws_s3_bucket_metric" "enable-metrics-bucket-mw-dev-athena-results" {
  bucket = aws_s3_bucket.mw-dev-athena-results.id
  name   = "EntireBucket"
}

# middleware-dev-object-storage-s3-bucket

resource "aws_s3_bucket" "middleware-dev-object-storage-new" {
  # (resource arguments)
}
