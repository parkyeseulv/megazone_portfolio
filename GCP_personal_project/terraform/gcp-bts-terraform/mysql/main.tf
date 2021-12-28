#data resources
data "google_compute_network" "vpc_network" {
  provider = google
  project = var.project_id
  name = var.network_name
}

#sql instance
resource "google_sql_database_instance" "instance" {
  provider            = google-beta
  name                = var.sql_instance_name
  database_version    = var.database_version
  
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = false
      private_network = data.google_compute_network.vpc_network.name
    }
  }
}

resource "google_sql_user" "default" {
  count      = var.enable_default_user ? 1 : 0
  name       = var.db_user_name
  instance   = google_sql_database_instance.instance.name
  password   = var.db_user_password
}
