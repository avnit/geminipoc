
provider "helm" {
  kubernetes = {
    host                   = google_container_cluster.primary.endpoint
    cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
}

data "google_client_config" "default" {}

resource "helm_release" "main" {
  name      = "my-helm-release-2"
  chart     = "/home/mona/new/geminipoc/cong/helm/cong-chart/"
  namespace = kubernetes_namespace.console_app.id
  timeout   = 600
  replace   = true

  set = [
    {
      name  = "serviceAccount.create"
      value = "false"
    },
    {
      name  = "serviceAccount.name"
      value = "default"
    }
  ]
}
