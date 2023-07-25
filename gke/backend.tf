terraform {
  backend "gcs" {
    bucket  = "our_bucket"
    prefix  = "gke"
    credentials = "./key_devops_workshop_2023.json"
  }
}
