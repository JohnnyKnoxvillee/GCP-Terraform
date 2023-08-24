module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 7.2"
    project_id   = var.project_id
    network_name = var.vpc_network

    subnets = [
        {
            subnet_name           = var.vpc_subnetwork
            subnet_ip             = var.subnet_ip
            subnet_region         = var.vpc_region
        }
    ]
}
