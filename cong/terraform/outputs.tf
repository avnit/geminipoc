output "gke_cluster_name" {
  value = google_container_cluster.primary.name
}

output "gke_cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "cloud_sql_instance_name" {
  value = google_sql_database_instance.mysql.name
}
