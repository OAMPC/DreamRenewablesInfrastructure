terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 5.0"
    }
  }
}

resource "heroku_app" "dream_renewables_server" {
  name   = var.heroku_server_app_name
  region = "eu"
}