resource "google_compute_instance" "dataplatform2" {
  boot_disk {
    auto_delete = true
    device_name = "dataplatform2"

    initialize_params {
      image = "https://www.googleapis.com/compute/beta/projects/debian-cloud/global/images/debian-12-bookworm-v20250812"
      size  = 100
      type  = "pd-balanced"
    }

    mode   = "READ_WRITE"
    source = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/zones/us-central1-a/disks/dataplatform2"
  }

  confidential_instance_config {
    enable_confidential_compute = false
  }

  labels = {
    managed-by-cnrm = "true"
  }

  machine_type = "n2-standard-8"

  metadata = {
    ssh-keys       = "mona:ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBHaZk7qyjTuzkjSWwAVorVnabqKx98je5MEVE5aY5Frpcjb3YYFSRRk2ATq63DIVs9D8rMcF21taOGpjMHG7nEw= google-ssh {\"userName\":\"mona@asbsolutionsgroup.com\",\"expireOn\":\"2025-10-21T23:45:22+0000\"}\nmona:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAHHFBhzlNHF+07LRROgkhPop43t+taydbvD3zlNpn4N50iLvfKEjMO1xKk3jB8sWO99o3rL7Gm56bGaGOjTjCnwRSu9vig8TfVJXOinYCcjCLNw8WQnMHeDvLh1UHuu1LwJJFGjVwzhOGp2TKw15D1oSFt5QHe1wAHkryrsW0yhT0PCb9d8wLMa5nAPsErx4O7jgi4eQvJBQ0bAe+HN2TEnAMGvj6IuuUJVvKUShHX83KN85PPKFNIXu0+n82Qeay/beb9uTx4dSO1qlGY1VgqF3LnPNQhYPA8FcDRFyqK1Fd7innLYwBkICtxV+wQ3Qf79I++KGdVI73y9Z/MNZu0s= google-ssh {\"userName\":\"mona@asbsolutionsgroup.com\",\"expireOn\":\"2025-10-21T23:45:26+0000\"}\nmona:ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOfDqBa4cHRCc4tZgaMVtHSvpEC60AyFlsOMqJhshrn1kYkXQNYZIsBt9wgB2JA22H4NnZIyr6VFUC7zrTJkOWI= google-ssh {\"userName\":\"mona@asbsolutionsgroup.com\",\"expireOn\":\"2025-10-21T23:48:08+0000\"}\nmona:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCY12gVfpSRavM5NMiLDw/BXXWGx8fS8FdU9IOXjTFwm3OL0x+aQaovb0D4aBol/px0xpMCutnAKs+OyltU8r6/20g8f7JclPAOsjNI4bwGGTEY5xEA08KMKo9y40Ojp9/+oldtsm9J2wT87TAvlEQSRtdyQ9Kx0PREdFMISANnOXrbYoIxKi/jp4yNp0Er3rPYGU3oG6I2KE3sWn/7vfRG+VocVW96hNVDoNE3894x1WietFfC4QSaeHtoYM6d0yDW6gvRE6xtdiIpOKkS/PgGJHvCA14NTw3zg7T0/PMfT+VykjeD+ia+mM4b46LTHa3dYksmT13sCqcFq30d/Ood google-ssh {\"userName\":\"mona@asbsolutionsgroup.com\",\"expireOn\":\"2025-10-21T23:48:12+0000\"}"
    startup-script = "apt update && apt install -y \\\n    docker.io \\\n    docker-compose \\\n    git \\\n    curl \\\n    wget \\\n    unzip\n\nsudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg2 -y\n\ncurl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -\necho \"deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list\napt update && apt install -y docker-ce docker-ce-cli containerd.io\nsudo systemctl enable docker\n\nDOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}\nmkdir -p $DOCKER_CONFIG/cli-plugins\ncurl -SL https://github.com/docker/compose/releases/download/v2.38.2/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose\nchmod +x $DOCKER_CONFIG/cli-plugins/docker-compose"
  }

  name = "dataplatform2"

  network_interface {
    access_config {
      nat_ip       = "146.148.108.35"
      network_tier = "PREMIUM"
    }

    network            = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
    network_ip         = "10.117.2.3"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/regions/us-central1/subnetworks/avathon-saas-runtime-setup-cloudrun"
    subnetwork_project = "avathon-saas-runtime-setup"
  }

  project = "avathon-saas-runtime-setup"

  reservation_affinity {
    type = "ANY_RESERVATION"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "saas-service-account@avathon-saas-runtime-setup.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
  }

  tags = ["http-server", "https-server", "lb-health-check"]
  zone = "us-central1-a"
}
# terraform import google_compute_instance.dataplatform2 projects/avathon-saas-runtime-setup/zones/us-central1-a/instances/dataplatform2
