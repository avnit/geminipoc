resource "google_sql_database_instance" "mysql" {
  name             = "mysql-instance"
  database_version = "MYSQL_5_7"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }

  deletion_protection = false # Set to true in production
}

resource "google_sql_database" "uaa" {
  name     = "uaa"
  instance = google_sql_database_instance.mysql.name
}

resource "google_sql_user" "uaa" {
  name     = "uaa"
  instance = google_sql_database_instance.mysql.name
  password = var.db_password
}
