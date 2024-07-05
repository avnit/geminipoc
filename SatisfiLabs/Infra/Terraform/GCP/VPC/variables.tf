variable "envt" {
    type = string
    default = "dev"
}
variable "project_id" {
  type = map
  description = "the project id of the project"
  default     =  { 
    "dev" = "satisfi-hackathon-vertex-ai-poc"
}
}

variable "credentials" {
  type = map 
  description = "GCP credentials file"
  default     = { 
    "dev"   = "satisfi-stage-fa7cb69d1b74.json"
}
}

variable "region" {
  type = string
  description = "only run in one region for now for testing"
  default     = "us-central1"
}
