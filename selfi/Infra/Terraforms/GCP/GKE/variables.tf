variable "envt" {}
variable "project_id" {
  type = map
  description = "the project id of the project"
  default     =  { 
    "prod" = "satisfi-prod"
    "stage" = "satisfi-stage"
    "core" = "satisfi-dev" 
}
}

variable "credentials" {
  type = map 
  description = "GCP credentials file"
  default     = { 
    "prod" = "../satisfi-prod-fa7cb69d1b74.json"
    "core" = "../satisfi-core-fa7cb69d1b74.json"
    "stage" = "../satisfi-stage-fa7cb69d1b74.json"
    "dev"   = "../satisfi-dev-fa7cb69d1b74.json"
}
}
variable "region" {
  type        = string
  description = "only run in one region for now for testing"
  default     = "us-central1"
}

variable "zone" {
  type = string
  default = "us-central1-a"
}

variable "vpc_name" {
  type    = map
  default =  { 
   "prod" =  "custom-network-satisfi-prod"
   "stage" = "custom-network-satisfi-core"
   "core" = "custom-network-satisfi-core"
  }
}

variable "gke_cluster_name" {
  type    = map
  default = {
    "prod"  = "gke-cluster-name"
    "core" = "gke-cluster-core"
}
}
variable "ip_range_pods" {
  description = "The secondary ip range to use for pods"
  default     = "subnet-01-secondary-pods"
}

variable "ip_range_services" {
  description = "The secondary ip range to use for pods"
  default     = "subnet-01-secondary-services"
}

variable "gke_minimal_worknode_count" { 
  type = "string"
  default = "1" 
}
variable "gke_maximum_worknode_count" { 
  type = "string" 
  default = "5"
}
