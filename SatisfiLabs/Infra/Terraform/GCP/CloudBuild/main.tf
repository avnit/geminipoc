terraform {
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

resource "google_cloudbuild_trigger" "build-trigger" {
  name = "pubsub-trigger"
  location = "global"

  trigger_template {
    branch_name = "main"
    repo_name   = "us-docker.pkg.dev/sl-dev-gmni-prj/genai-repo/pubsubprocessing"
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
    step {
      name = "gcr.io/cloud-builders/gsutil"
      args = ["cp", "gs://mybucket/remotefile.zip", "localfile.zip"]
      timeout = "120s"
      secret_env = ["MY_SECRET"]
    }

    step {
      name   = "ubuntu"
      script = "echo hello" # using script field
    }

    source {
      storage_source {
        bucket = "mybucket"
        object = "source_code.tar.gz"
      }
    }
    tags = ["build", "newFeature"]
    substitutions = {
      _FOO = "bar"
      _BAZ = "qux"
    }
    queue_ttl = "20s"
    logs_bucket = "gs://mybucket/logs"
    secret {
      kms_key_name = "projects/myProject/locations/global/keyRings/keyring-name/cryptoKeys/key-name"
      secret_env = {
        PASSWORD = "ZW5jcnlwdGVkLXBhc3N3b3JkCg=="
      }
    }
    available_secrets {
      secret_manager {
        env          = "MY_SECRET"
        version_name = "projects/myProject/secrets/mySecret/versions/latest"
      }
    }
    artifacts {
      images = ["gcr.io/$PROJECT_ID/$REPO_NAME:$COMMIT_SHA"]
      objects {
        location = "gs://bucket/path/to/somewhere/"
        paths = ["path"]
      }

      npm_packages {
        package_path = "package.json"
        repository   = "https://us-west1-npm.pkg.dev/myProject/quickstart-nodejs-repo"
      }

      python_packages {
        paths      = ["dist/*"]
        repository = "https://us-west1-python.pkg.dev/myProject/quickstart-python-repo"
      }

      maven_artifacts {
        repository  = "https://us-west1-maven.pkg.dev/myProject/quickstart-java-repo"
        path        = "/workspace/my-app/target/my-app-1.0.SNAPSHOT.jar"
        artifact_id = "my-app"
        group_id    = "com.mycompany.app"
        version     = "1.0"
      }
    }
    options {
      source_provenance_hash = ["MD5"]
      requested_verify_option = "VERIFIED"
      machine_type = "N1_HIGHCPU_8"
      disk_size_gb = 100
      substitution_option = "ALLOW_LOOSE"
      dynamic_substitutions = true
      log_streaming_option = "STREAM_OFF"
      worker_pool = "pool"
      logging = "LEGACY"
      env = ["ekey = evalue"]
      secret_env = ["secretenv = svalue"]
      volumes {
        name = "v1"
        path = "v1"
      }
    }
  }
}