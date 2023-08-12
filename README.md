# **Terraform**
<div align="center">
  <img src="https://se.ewi.tudelft.nl/desosa2019/chapters/terraform/images/617845e3592d99b71c40470d33c1785090cc4afa.png" alt="Terraform Logo" width="500">
</div>

## Purpose

The purpose of this repository is to manage Google Cloud Platform (GCP) resources for "devops-workshop-2023" project.
Repository functionality provides the gitops approach for managing GCP resources:

- Google Cloud Storage (GCS),
- Google Kubernetes Engine (GKE),
- Identity and Access Management (IAM),
- Load Balancer,
- Virtual Private Cloud (VPC)



## Features

###### Infrastructure as Code:

GCP resources defined with Terraform configuration files.

###### Modifiable Terraform Versions

Terraform-runner based on tfswitch tool. 

You can specify terraform version separately for each directory in tfswitch.toml file.

###### GitLab CI/CD Integration:

.gitlab-ci.yml files create GitLab CI/CD pipelines for separate infrastructures under the "DevOps Workshop 2023" project.


## How to contribute to GCP infrastructure

To use this Terraform repository and create infrastructure on GCP, follow these steps:

###### Step 1: Create merge request 
- Cut your own branch from master
- Add your changes to infrastructure
- Push changes your changes and create merge request 
- Merge request CI/CD pipeline will run the plan stage
- Ensure that plan is valid

###### Step 2 : Merge into master
- Merge your MR to master branch
- The CI/CD pipeline will run the plan stage
- Ensure that terraform plan still valid 
- Trigger `apply job` manually
