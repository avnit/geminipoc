terraform {
 backend "gcs" {
   bucket  = "gvts-core"
   prefix  = "terraform/state"
 }
}
