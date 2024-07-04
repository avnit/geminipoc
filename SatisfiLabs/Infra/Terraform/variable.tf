variable "envt" {}
variable "project_id" {
  type = map
  description = "the project id of the project"
  default     =  { 
    "prod" = "satisfi-prod"
    "stage" = "satisfi-stage"
    "core" = "satisfi-core" 
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
  type = string
  description = "only run in one region for now for testing"
  default     = "us-central1"
}