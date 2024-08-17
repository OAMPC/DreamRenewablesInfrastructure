resource "heroku_addon" "strapi_postgres_db" {
  name   = var.heroku_cms_db_name
  app_id = heroku_app.dream_renewables_strapi.id
  plan   = "heroku-postgresql:essential-1"
}