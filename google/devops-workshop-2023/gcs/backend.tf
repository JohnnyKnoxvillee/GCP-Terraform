terraform {
  backend "gcs" {
    bucket  = "devops-workshop-2023-terraform-state"
    prefix  = "gcs"
    credentials = "../../../service-account.json"
  }
}
