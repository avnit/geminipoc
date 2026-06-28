resource "google_monitoring_alert_policy" "14273542002196579467" {
  alert_strategy {
    auto_close = "604800s"

    notification_rate_limit {
      period = "3600s"
    }
  }

  combiner = "OR"

  conditions {
    condition_matched_log {
      filter = "resource.type=(\"gke_cluster\" OR \"gke_nodepool\") AND log_id(\"container.googleapis.com/notifications\") AND jsonPayload.@type=\"type.googleapis.com/google.container.v1beta1.SecurityBulletinEvent\""

      label_extractors = {
        briefDescription       = "EXTRACT(jsonPayload.briefDescription)"
        bulletinId             = "EXTRACT(jsonPayload.bulletinId)"
        bulletinUri            = "EXTRACT(jsonPayload.bulletinUri)"
        severity               = "EXTRACT(jsonPayload.severity)"
        suggestedUpgradeTarget = "EXTRACT(jsonPayload.suggestedUpgradeTarget)"
      }
    }

    display_name = "Log match condition"
  }

  display_name = "GKE Security Bulletin Affecting Your Cluster"

  documentation {
    content   = "A security bulletin has been issued that affects your cluster. Check the bulletin details and follow the recommended steps to mitigate the vulnerability.\n\nBulletin details:\\\n[$${log.extracted_label.bulletinId}]($${log.extracted_label.bulletinUri}).\n\nDescription:\\\n$${log.extracted_label.briefDescription}\n\nSuggested upgrade target:\\\n$${log.extracted_label.suggestedUpgradeTarget}\n\nNote, if multiple clusters are affected, the alert system may suppress individual notifications due to high volume. You might receive only one alert even if many clusters require patching. Use the \"log match condition\" to see the full set of logs and verify if other clusters are also impacted.\n\nFor a general overview of security bulletins, see the [GKE Security Bulletins documentation](https://cloud.google.com/kubernetes-engine/docs/security-bulletins).\n\nFor more information on upgrade events, see the [GKE SecurityBulletinEvent documentation](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1/SecurityBulletinEvent)."
    mime_type = "text/markdown"
  }

  enabled               = true
  notification_channels = ["projects/avathon-saas-runtime-setup/notificationChannels/6058681205074340191"]
  project               = "341534251420"

  user_labels = {
    managed-by-cnrm = "true"
  }
}
# terraform import google_monitoring_alert_policy.14273542002196579467 341534251420 projects/341534251420/alertPolicies/14273542002196579467
