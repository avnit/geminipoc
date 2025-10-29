resource "google_sql_database_instance" "mysql_instance" {
  database_version    = "MYSQL_5_7"
  instance_type       = "CLOUD_SQL_INSTANCE"
  maintenance_version = "MYSQL_5_7_44.R20250531.01_23"
  name                = "mysql-instance"
  project             = "avathon-saas-runtime-setup"
  region              = "us-central1"

  settings {
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"

    backup_configuration {
      backup_retention_settings {
        retained_backups = 7
        retention_unit   = "COUNT"
      }

      start_time                     = "05:00"
      transaction_log_retention_days = 7
    }

    connector_enforcement = "NOT_REQUIRED"
    disk_autoresize       = true
    disk_autoresize_limit = 0
    disk_size             = 10
    disk_type             = "PD_SSD"
    edition               = "ENTERPRISE"

    ip_configuration {
      ipv4_enabled = true
    }

    location_preference {
      zone = "us-central1-c"
    }

    pricing_plan = "PER_USE"
    tier         = "db-f1-micro"

    user_labels = {
      managed-by-cnrm = "true"
    }
  }
}
# terraform import google_sql_database_instance.mysql_instance projects/avathon-saas-runtime-setup/instances/mysql-instance
