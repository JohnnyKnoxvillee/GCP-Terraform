terraform {
  backend "gcs" {
    bucket  = "devops-workshop-2023-terraform-state"
    prefix  = "loadbalancer"
    credentials = "../../../service-account.json"
  }
}
