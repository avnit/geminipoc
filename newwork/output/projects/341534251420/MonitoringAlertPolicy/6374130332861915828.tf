resource "google_monitoring_alert_policy" "6374130332861915828" {
  alert_strategy {
    auto_close = "604800s"

    notification_rate_limit {
      period = "3600s"
    }
  }

  combiner = "OR"

  conditions {
    condition_matched_log {
      filter = "resource.type=(\"gke_cluster\" OR \"gke_nodepool\") AND log_id(\"container.googleapis.com/notifications\") AND jsonPayload.@type=\"type.googleapis.com/google.container.v1beta1.UpgradeEvent\""

      label_extractors = {
        operation      = "EXTRACT(jsonPayload.operation)"
        resourceType   = "EXTRACT(jsonPayload.resourceType)"
        upgrading_from = "EXTRACT(jsonPayload.currentVersion)"
        upgrading_to   = "EXTRACT(jsonPayload.targetVersion)"
      }
    }

    display_name = "Log match condition"
  }

  display_name = "GKE Resource Upgrade Started"

  documentation {
    content   = "This informational alert indicates that an upgrade operation has started. Track the upgrade progress via the Google Cloud Console or gcloud commands.\n\nDetails:\n\n- Resource Type: $${log.extracted_label.resourceType}\n- Upgrading From: $${log.extracted_label.upgrading_from}\n- Upgrading To: $${log.extracted_label.upgrading_to}\n- Operation: $${log.extracted_label.operation}\n\nFor more information on upgrade events, see the [GKE UpgradeEvent documentation](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1/UpgradeEvent)."
    mime_type = "text/markdown"
  }

  enabled               = true
  notification_channels = ["projects/avathon-saas-runtime-setup/notificationChannels/6058681205074340191"]
  project               = "341534251420"

  user_labels = {
    managed-by-cnrm = "true"
  }
}
# terraform import google_monitoring_alert_policy.6374130332861915828 341534251420 projects/341534251420/alertPolicies/6374130332861915828
