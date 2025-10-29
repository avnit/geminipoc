output "gke_cluster_name" {
  value = google_container_cluster.primary.name
}

output "gke_cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "filestore_ip_address" {
  value = google_filestore_instance.main.networks[0].ip_addresses[0]
}
