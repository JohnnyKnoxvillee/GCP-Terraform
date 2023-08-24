provider "google" {
  credentials = file("../../../service-account.json")

  project = var.project_id
  region  = var.vpc_region
  zone    = var.zone
}

data "google_client_config" "default" {}

provider "kubernetes" {
  config_path            = "~/.kube/config"
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}
