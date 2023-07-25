terraform {
  backend "gcs" {
    bucket  = "devops-workshop-2023-terraform-state"
    prefix  = "gke"
    credentials = "./key_devops_workshop_2023.json"
  }
}
