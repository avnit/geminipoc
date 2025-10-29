resource "google_project_iam_custom_role" "customprojectrole" {
  description = "A custom role with permissions added in future stages"
  permissions = ["logging.logEntries.list"]
  project     = "avathon-saas-runtime-setup"
  role_id     = "customProjectRole"
  stage       = "GA"
  title       = "Custom role at project scope"
}
# terraform import google_project_iam_custom_role.customprojectrole avathon-saas-runtime-setup##customProjectRole
