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

    secondary_ranges = {
        devops-workshop-2023-subnet = [
            {
                range_name    = var.secondary_range_pod
                ip_cidr_range = "10.0.4.0/22"
            },

            {
                range_name    = var.secondary_range_svc
                ip_cidr_range = "10.0.8.0/22"
            },
        ]
    }
}
