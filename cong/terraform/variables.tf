variable "project_id" {
  description = "The GCP project ID."
  type        = string
  default     = "avathon-saas-runtime-setup"

}

variable "region" {
  description = "The GCP region to deploy resources in."
  type        = string
  default     = "us-central1"
}

variable "gke_cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = "console_cluster"
}



variable "gke_num_nodes" {
  description = "Number of GKE nodes."
  type        = number
  default     = 3
}

variable "zone" {
  description = "The GCP zone to deploy resources in."
  type        = string
  default     = "us-central1-a"
}

# variable "db_password" {
#   description = "The password for the Cloud SQL database."
#  type        = string
#  sensitive   = true
# }
