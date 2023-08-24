data "terraform_remote_state" "vpc" {
  backend = "gcs"
  config = {
    bucket = "devops-workshop-2023-terraform-state"
    prefix = "vpc"
    credentials = "../../../service-account.json"
  }
}
