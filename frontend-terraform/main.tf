terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 5.0"
    }
  }
}

resource "heroku_app" "dream_renewables_frontend" {
  name   = var.heroku_frontend_app_name
  region = "eu"
}