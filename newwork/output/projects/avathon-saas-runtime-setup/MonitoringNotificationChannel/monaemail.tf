resource "google_monitoring_notification_channel" "monaemail" {
  display_name = "monaemail"
  enabled      = true

  labels = {
    email_address = "mona@asbsolutionsgroup.com"
  }

  project = "avathon-saas-runtime-setup"
  type    = "email"

  user_labels = {
    managed-by-cnrm = "true"
  }
}
# terraform import google_monitoring_notification_channel.monaemail avathon-saas-runtime-setup projects/avathon-saas-runtime-setup/notificationChannels/6058681205074340191
