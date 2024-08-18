resource "heroku_app" "dream_renewables_strapi" {
  name   = var.heroku_cms_app_name
  region = "eu"
}

resource "heroku_config" "strapi_service_config" {
  vars = {
    AWS_REGION = "eu-west-2"
    AWS_BUCKET = aws_s3_bucket.strapi_dr_s3_media_bucket.bucket
  }
  sensitive_vars = {
    AWS_ACCESS_KEY_ID     = aws_iam_access_key.strapi_service_access_key.id
    AWS_SECRET_ACCESS_KEY = aws_iam_access_key.strapi_service_access_key.secret
  }
}

resource "heroku_app_config_association" "dream_renewables_strapi_config_association" {
  app_id         = heroku_app.dream_renewables_strapi.id
  vars           = heroku_config.strapi_service_config.vars
  sensitive_vars = heroku_config.strapi_service_config.sensitive_vars
}