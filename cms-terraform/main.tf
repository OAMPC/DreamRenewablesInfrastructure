terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 5.0"
    }
  }
}

resource "heroku_app" "dream_renewables_strapi" {
  name   = var.heroku_cms_app_name
  region = "eu"
}

resource "heroku_addon" "strapi_postgres_db" {
  name   = var.heroku_cms_db_name
  app_id = heroku_app.dream_renewables_strapi.id
  plan   = "heroku-postgresql:essential-1"
}