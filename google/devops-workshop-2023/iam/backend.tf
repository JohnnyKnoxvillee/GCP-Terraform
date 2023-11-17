terraform {
  backend "gcs" {
    bucket  = "devops-workshop-2023-terraform-state"
    prefix  = "iam"
    credentials = "../../../service-account.json"
  }
}
