terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0" 
    }
  }
  backend "gcs" {
    bucket  = "satisfi-core"
   prefix  = "terraform/state/artifact"
  }
}

provider "google" {
  credentials = file(var.credentials[var.envt])
  project     = var.project_id[var.envt]
  region      = var.region
}


# Cloud Build Trigger (build_trigger.tf)
resource "google_cloudbuild_trigger" "terraform_trigger" {
  name        = "terraform-apply-trigger"
  description = "Trigger Terraform apply on code changes"
  location = "global"

  # Trigger on changes to the Terraform configuration in a Git repository
  trigger_template {
    # this should be bitbucket 
    bitbucket {
      hostUrl = "https://bitbucket.org/satisfi/"
      project = "GeminiPoC"
      repository = "GeminiPoC"
      branch = "^main$"
      invertRegex = false
    }
    #branch_name = "main"
    #repo_name   = "us-docker.pkg.dev/sl-dev-gmni-prj/genai-repo/pubsubprocessing"
 
  }

  build {
    # Steps to initialize, plan, and apply Terraform
    step {
      name       = "terraform/gcloud"
      args       = ["init"]
      entrypoint = "terraform"
    }
    step {
      name       = "terraform/gcloud"
      args       = ["plan"]
      entrypoint = "terraform"
    }
    step {
      name       = "terraform/gcloud"
      args       = ["apply", "-auto-approve"]
      entrypoint = "terraform"
    }
  }

  # (Optional) service_account = google_service_account.cloudbuild_sa.email
}

# Cloud Function & Pub/Sub (function.tf)
resource "google_pubsub_topic" "example_topic" {
  name = "example-topic"
}

resource "google_pubsub_subscription" "example_subscription" {
  name  = "example-subscription"
  topic = google_pubsub_topic.example_topic.name

  # Cloud Function as a push endpoint
  push_config {
    push_endpoint = google_cloudfunctions_function.example_function.https_trigger_url
  }
}

resource "google_cloudfunctions_function" "example_function" {
  # ... (Configure your Cloud Function based on the "function.tf" example)
}
