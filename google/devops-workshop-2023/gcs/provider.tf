terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("../../../service-account.json")

  project = "devops-workshop-2023"
  region  = "us-central1"
  zone    = "us-central1-c"
}
