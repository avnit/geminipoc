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
# Fix buid steps to match the pipeline build steps 
# build steps 
# 1. copy terraform code 
# 2. terraform init set backend 
# 3. terraform plan and set variable envt 
# 4. terraform apply "tf.plan"
/*

# cloudbuild.yaml
steps:
  # 1. Checkout Terraform Code
  - name: 'gcr.io/cloud-builders/git'
    args: ['clone', 'https://github.com/<your-username>/<your-terraform-repo>.git']
    dir: 'terraform'

  # 2. Setup Terraform Environment
  - name: 'hashicorp/terraform:latest'
    entrypoint: 'sh'
    args:
      - '-c'
      - |
        terraform init -backend-config="bucket=${_STATE_BUCKET}" \
                      -backend-config="prefix=${_STATE_PREFIX}"

  # 3. Terraform Plan (Optional for Pull Requests)
  - name: 'hashicorp/terraform:latest'
    id: 'plan'  
    args: ['plan']
    env:
      - 'TF_VAR_project=${PROJECT_ID}'  # Example environment variable
    volumes:
      - name: 'terraform-state'
        path: /workspace/terraform/.terraform 

  # 4. Terraform Apply (Only for Production/Main Branch)
  - name: 'hashicorp/terraform:latest'
    id: 'apply'
    args: ['apply']
    env:
      - 'TF_VAR_project=${PROJECT_ID}'  # Example environment variable
    volumes:
      - name: 'terraform-state'
        path: /workspace/terraform/.terraform 
      
    # Conditional Execution
    when:
      branch: [main, master]  # Replace with your production branch name(s)
      
  # 5. Store Terraform State (Important!)
  - name: 'gcr.io/cloud-builders/gsutil'
    args:
      - 'cp'
      - '/workspace/terraform/.terraform/terraform.tfstate'
      - 'gs://${_STATE_BUCKET}/${_STATE_PREFIX}/terraform.tfstate'
    volumes:
      - name: 'terraform-state'
        path: /workspace/terraform/.terraform

# (Optional) Artifacts for Plan Output
artifacts:
  objects:
    location: 'gs://${_STATE_BUCKET}/${_STATE_PREFIX}/plans' 
    paths: ['terraform/plan.out']   # If you want to save the plan output

# Substitutions and Environment Variables
substitutions:
  _STATE_BUCKET: 'my-terraform-state-bucket' # Replace with your GCS bucket name
  _STATE_PREFIX: 'my-project/dev' # Replace with your desired prefix

options:
  dynamic_substitutions: true # Allows for environment variables in your substitutions
  substitution_option: 'ALLOW_LOOSE' 
*/





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
