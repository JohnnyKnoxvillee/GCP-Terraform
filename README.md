# **Terraform Google Cloud Infrastructure Repository**


<div align="center">
  <img src="https://se.ewi.tudelft.nl/desosa2019/chapters/terraform/images/617845e3592d99b71c40470d33c1785090cc4afa.png" alt="Terraform Logo" width="500">
</div>



## Purpose

The Terraform Google Cloud Infrastructure Repository is designed to create and manage infrastructure resources on Google Cloud Platform (GCP) using Terraform. This repository provides a modular approach to set up various components such as:
- Google Cloud Storage (GCS),
- Google Kubernetes Engine (GKE),
- Identity and Access Management (IAM),
- Load Balancer,
- Virtual Private Cloud (VPC)

for the "DevOps Workshop 2023" project.

## Features

###### Infrastructure as Code:

Define your infrastructure using Terraform configuration files to achieve version-controlled, repeatable, and consistent deployments on GCP.
Modularity: The repository is organized into different modules, allowing you to create specific resources independently.

###### GitLab CI/CD Integration:

The included .gitlab-ci.yml files configure GitLab CI/CD pipelines for separate infrastructures under the "DevOps Workshop 2023" project.


## User Flows

To use this Terraform repository and create infrastructure on GCP, follow these steps:

###### User Flow 1: Setting up Service Account Key
- Obtain a Service Account Key in JSON format from the GCP console.
- Encode the Service Account Key as Base64.
- Save the encoded Service Account Key as a CI/CD variable named `$SERVICE_ACCOUNT_JSON` .

###### User Flow 2: Terraform Plan Execution
- Navigate to the root directory of this repository.
- Add the Base64-encoded Service Account Key to the CI/CD pipeline configuration.
- Push changes to the repository to trigger the CI/CD pipeline.
- The CI/CD pipeline will run the plan stage using the gcr.io/devops-workshop-2023/terraform-runner:1.0.0 image.
- The `plan` stage will perform the following tasks:
  - Switch to the relevant directory using `$TF_DIR`.
  - Set up Terraform version using `tfswitch` and the specified version from the `.tfswitch.toml` file.
  - Initialize Terraform using `terraform init`.
  - Validate Terraform configurations using `terraform validate`.
  - Generate an execution plan using `terraform plan`.

###### User Flow 3: Terraform Apply Execution
- Ensure that the Service Account Key is properly configured as a CI/CD variable.
- Push changes to the repository to trigger the CI/CD pipeline.
- The CI/CD pipeline will run the `apply` stage using the gcr.io/devops-workshop-2023/terraform-runner:1.0.0 image.
- The `apply` stage will perform the following tasks:
  - Switch to the relevant directory using `$TF_DIR`.
  - Set up Terraform version using `tfswitch` and the specified version from the `.tfswitch.toml` file.
  - Initialize Terraform using `terraform init`.
  - Validate Terraform configurations using `terraform validate`.
  - Apply the changes and create the infrastructure using `terraform apply -auto-approve`.

###### User Flow 4: Exploring Separate Infrastructures
The repository contains separate .gitlab-ci.yml files in the following paths, each configuring GitLab CI/CD pipelines for specific infrastructures under the "DevOps Workshop 2023" project:

- `google/devops-workshop-2023/gcs/.gitlab-ci.yml`: Google Cloud Storage infrastructure
- `google/devops-workshop-2023/gke/.gitlab-ci.yml`: Google Kubernetes Engine infrastructure
- `google/devops-workshop-2023/iam/.gitlab-ci.yml`: Identity and Access Management infrastructure
- `google/devops-workshop-2023/loadbalancer/.gitlab-ci.yml`: Load Balancer infrastructure
- `google/devops-workshop-2023/vpc/.gitlab-ci.yml`: Virtual Private Cloud infrastructure

Each .gitlab-ci.yml file follows a similar pattern, utilizing .plan_template and .apply_template for Terraform plan and apply stages, respectively. The CI/CD pipelines automatically trigger when changes are made in the respective infrastructure directories.

## Getting Started

###### To get started, follow these steps:

- Obtain the Service Account Key for your GCP project and encode it as Base64.
- Set up Terraform versions for each infrastructure by creating .tfswitch.toml files in the respective directories.
- Customize the Terraform configurations in each infrastructure folder to meet your project's requirements.
- Commit and push your changes to the repository to trigger the CI/CD pipelines and create/update the infrastructures on GCP.
