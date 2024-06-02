variable "project_id" {
  type        = "string"
  description = "the project id of the project"
  default     = "astrologyash"
}
variable "credentials" {
  type        = "string"
  description = "GCP credentials file"
  default     = "astrologyash-fa7cb69d1b74.json"
}
variable "region" {
  type        = "string"
  description = "only run in one region for now for testing"
  default     = "us-east1"
}
variable "vpc_name" {
  type        = "string"
  default     = "custom-network-astrologyash"
}
