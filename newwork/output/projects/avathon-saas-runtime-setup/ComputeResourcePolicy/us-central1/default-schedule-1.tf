resource "google_compute_resource_policy" "default_schedule_1" {
  name    = "default-schedule-1"
  project = "avathon-saas-runtime-setup"
  region  = "us-central1"

  snapshot_schedule_policy {
    retention_policy {
      max_retention_days    = 14
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }

    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "13:00"
      }
    }
  }
}
# terraform import google_compute_resource_policy.default_schedule_1 projects/avathon-saas-runtime-setup/regions/us-central1/resourcePolicies/default-schedule-1
