variable "envt" {}
variable "project_id" {
  type = map
  description = "the project id of the project"
  default     =  { 
    "prod" = "gvts-prod"
    "stage" = "gvts-stage"
    "core" = "gvts-core" 
}
}

variable "credentials" {
  type = map 
  description = "GCP credentials file"
  default     = { 
    "prod" = "../gvts-prod-fa7cb69d1b74.json"
    "core" = "../gvts-core-fa7cb69d1b74.json"
    "stage" = "../gvts-stage-fa7cb69d1b74.json"
    "dev"   = "../gvts-dev-fa7cb69d1b74.json"
}
}

variable "region" {
  type = string
  description = "only run in one region for now for testing"
  default     = "us-central1"
}
