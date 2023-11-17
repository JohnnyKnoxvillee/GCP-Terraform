terraform {
  backend "gcs" {
    bucket  = "devops-workshop-2023-terraform-state"
    prefix  = "vpc"
    credentials = "../../../service-account.json"
  }
}
