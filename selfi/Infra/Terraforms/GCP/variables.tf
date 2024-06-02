variable "project_id" {
  description = "the project id of the project"
  default     = "gvts-prod"
}

variable "credentials" {

  description = "GCP credentials file"
  default     = "gvts-prod-fa7cb69d1b74.json"
}

variable "region" {

  description = "only run in one region for now for testing"
  default     = "us-central1"
}
