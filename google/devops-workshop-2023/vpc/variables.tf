variable "project_id" {
    type = string
    description = "GCP project id"
}

variable "vpc_network" {
    type = string
    description = "name of vpc network"
}

variable "vpc_subnetwork" {
    type = string
    description = "name of vpc subnetwork"
}

variable "subnet_ip" {
    type = string
    description = "subnet IP"
}

variable "vpc_region" {
    type = string
    description = "subnet region"
}

variable "cluster_name" {
    type = string
    description = "cluster_name"
}

variable "node_pool_name" {
    type = string
    description = "node pool name"
}

variable "gke_service_account" {
    type = string
    description = "service account email"
}

variable "zone" {
    type = string
    description = "Availability zone"
}

variable "secondary_range_pod" {
    type = string
    description = "secondary range pods"
}

variable "secondary_range_svc" {
    type = string
    description = "secondary range services"
}
