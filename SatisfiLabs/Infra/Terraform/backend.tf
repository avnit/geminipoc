terraform {
 backend "gcs" {
   bucket  = "satisfi-core"
   prefix  = "terraform/state"
 }
}
