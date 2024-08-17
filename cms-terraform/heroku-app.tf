resource "heroku_app" "dream_renewables_strapi" {
  name= var.heroku_cms_app_name
  region = "eu"
}
