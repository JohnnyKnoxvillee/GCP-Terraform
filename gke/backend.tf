terraform {
  backend "gcs" {
    bucket  = "bucket131"
    prefix  = "gke"
    credentials = "./key_devops_workshop_2023.json"
  }
}
