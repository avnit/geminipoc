#/bin/bash
gcloud auth configure-docker us-docker.pkg.dev
docker build -t pubsubprocess .
docker tag pubsubprocess us-docker.pkg.dev/sl-dev-gmni-prj/genai-repo/pubsubprocessing:latest
docker push us-docker.pkg.dev/sl-dev-gmni-prj/genai-repo/pubsubprocessing:latest