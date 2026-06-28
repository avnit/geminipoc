resource "google_monitoring_alert_policy" "11898990532548379360" {
  alert_strategy {
    auto_close = "604800s"

    notification_rate_limit {
      period = "3600s"
    }
  }

  combiner = "OR"

  conditions {
    condition_matched_log {
      filter = "resource.type=(\"gke_cluster\" OR \"gke_nodepool\") AND log_id(\"container.googleapis.com/notifications\") AND jsonPayload.@type=\"type.googleapis.com/google.container.v1beta1.UpgradeInfoEvent\" AND jsonPayload.eventType=\"END_OF_SUPPORT\""

      label_extractors = {
        currentVersion         = "EXTRACT(jsonPayload.currentVersion)"
        description            = "EXTRACT(jsonPayload.description)"
        extendedSupportEndTime = "EXTRACT(jsonPayload.extendedSupportEndTime)"
        standardSupportEndTime = "EXTRACT(jsonPayload.standardSupportEndTime)"
      }
    }

    display_name = "Log match condition"
  }

  display_name = "GKE Version Nearing End of Support"

  documentation {
    content   = "Description:\\\n$${log.extracted_label.description}\n\nCurrent version:\\\n$${log.extracted_label.currentVersion}\n\nFor more information on upgrade events, see the [GKE UpgradeInfoEvent documentation](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1/UpgradeInfoEvent)."
    mime_type = "text/markdown"
  }

  enabled               = true
  notification_channels = ["projects/avathon-saas-runtime-setup/notificationChannels/6058681205074340191"]
  project               = "341534251420"

  user_labels = {
    managed-by-cnrm = "true"
  }
}
# terraform import google_monitoring_alert_policy.11898990532548379360 341534251420 projects/341534251420/alertPolicies/11898990532548379360
