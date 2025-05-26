resource "heroku_app" "dream_renewables_server" {
  name   = var.heroku_server_app_name
  region = "eu"
}

resource "heroku_config" "server_service_config" {
  vars = {
    AWS_REGION = "eu-west-2"
  }

  sensitive_vars = {
    AWS_ACCESS_KEY_ID     = aws_iam_access_key.server_service_access_key.id
    AWS_SECRET_ACCESS_KEY = aws_iam_access_key.server_service_access_key.secret
  }
}

resource "heroku_app_config_association" "dream_renewables_server_config_association" {
  app_id         = heroku_app.dream_renewables_server.id
  vars           = heroku_config.server_service_config.vars
  sensitive_vars = heroku_config.server_service_config.sensitive_vars
}