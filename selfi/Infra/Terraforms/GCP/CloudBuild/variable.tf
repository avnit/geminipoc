variable "envt" {
  type = string
  default = "dev"
}

variable "project_id" {
  type = map
  description = "the project id of the project"
  default     =  { 
    "prod" = "satisfi-prod"
    "stage" = "satisfi-stage"
    "dev" = "sl-dev-gmni-prj"
}
}

variable "credentials" {
  type = map 
  description = "GCP credentials file"
  default     = { 
    # Unix format 
    "prod" = "../satisfi-prod-fa7cb69d1b74.json"
    "core" = "../satisfi-core-fa7cb69d1b74.json"
    "stage" = "../satisfi-stage-fa7cb69d1b74.json"
    # windows format 
    "dev"   =  "C:\\Users\\abamb\\Downloads\\sl-dev-gmni-prj-8f920a74eb81.json"
}
}
variable "region" {
  type        = string
  description = "only run in one region for now for testing"
  default     = "us-central1"
}
