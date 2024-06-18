variable "project_id" {
  description = "the project id of the project"
  default     = "sl-dev-gmni-prj"
}

variable "credentials" {

  description = "GCP credentials file"
  default     = "C:\\Users\\abamb\\Downloads\\sl-dev-gmni-prj-8f920a74eb81.json"
}

variable "region" {

  description = "only run in one region for now for testing"
  default     = "us-central1"
}
