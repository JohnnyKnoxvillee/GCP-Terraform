terraform {
  backend "gcs" {
    bucket  = "devops-workshop-2023-terraform-state"
    prefix  = "gke"
    credentials = "../../../service-account.json"
  }
}
