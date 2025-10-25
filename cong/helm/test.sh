gcloud container clusters update primary-gke-cluster \
    --region=us-central1 \
    --update-addons=GcpFilestoreCsiDriver=ENABLED
