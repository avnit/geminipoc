
export USER=terraform
export TF_VAR_org_id=gvts-core
export TF_VAR_billing_account=01CEE9-AC5060-6BA6C2
export TF_ADMIN=${USER}-admin
export TF_CREDS=GCP/gvts-core-fa7cb69d1b74.json

# gcloud init --console-only 

echo "create the service account for terraform -- gcloud iam service-accounts create terraform --display-name "Terraform admin account""
gcloud iam service-accounts create terraform --display-name "Terraform admin account"

echo "generate the key"
gcloud iam service-accounts keys create ${TF_CREDS} --iam-account terraform@${TF_VAR_org_id}.iam.gserviceaccount.com
 
gcloud projects add-iam-policy-binding ${TF_VAR_org_id} --member serviceAccount:terraform@${TF_VAR_org_id}.iam.gserviceaccount.com --role roles/viewer
 
gcloud projects add-iam-policy-binding ${TF_VAR_org_id} --member serviceAccount:terraform@${TF_VAR_org_id}.iam.gserviceaccount.com --role roles/storage.admin

echo "enable services"
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable cloudbilling.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable serviceusage.googleapis.com
 
# Add the service layer permission 
 
echo "add service layer permissions gcloud organizations add-iam-policy-binding ${TF_VAR_org_id} --member serviceAccount:terraform@${TF_VAR_org_id}.iam.gserviceaccount.com --role roles/resourcemanager.projectCreator"
# gcloud organizations add-iam-policy-binding ${TF_VAR_org_id} --member serviceAccount:terraform@${TF_VAR_org_id}.iam.gserviceaccount.com --role roles/resourcemanager.projectCreator
 
# gcloud organizations add-iam-policy-binding ${TF_VAR_org_id} --member serviceAccount:terraform@${TF_VAR_org_id}.iam.gserviceaccount.com --role roles/billing.user

echo "gsutil mb -p ${TF_VAR_org_id} gs://${TF_VAR_org_id}"
gsutil mb -p ${TF_VAR_org_id} gs://${TF_VAR_org_id}
 
cat > backend.tf << EOF
terraform {
 backend "gcs" {
   bucket  = "${TF_VAR_org_id}"
   prefix  = "terraform/state"
 }
}
EOF
 
gsutil versioning set on gs://${TF_VAR_org_id}
export GOOGLE_APPLICATION_CREDENTIALS=${TF_CREDS}
export GOOGLE_PROJECT=${TF_VAR_org_id}
 
gcloud auth activate-service-account terraform@gvts-core.iam.gserviceaccount.com --key-file=gvts-core-fa7cb69d1b74.json