resource "aws_s3_bucket" "strapi_dr_s3_media_bucket" {
  bucket = "strapi-dr-s3-media-bucket"
  tags = {
    Name        = "Strapi S3 Media Bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_ownership_controls" "strapi_dr_s3_media_bucket_ownership_controls" {
  bucket = aws_s3_bucket.strapi_dr_s3_media_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "strapi_dr_s3_media_bucket_access_block" {
  bucket = aws_s3_bucket.strapi_dr_s3_media_bucket.id

  block_public_acls       = false
  block_public_policy     = true
  ignore_public_acls      = false
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "strapi_dr_s3_media_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.strapi_dr_s3_media_bucket_ownership_controls,
    aws_s3_bucket_public_access_block.strapi_dr_s3_media_bucket_access_block
  ]

  bucket = aws_s3_bucket.strapi_dr_s3_media_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_cors_configuration" "strapi_dr_s3_media_bucket_cors" {
  bucket = aws_s3_bucket.strapi_dr_s3_media_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}

output "strapi_bucket_name" {
  value = aws_s3_bucket.strapi_dr_s3_media_bucket.bucket
}

output "strapi_bucket_region" {
  value = aws_s3_bucket.strapi_dr_s3_media_bucket.region
}
