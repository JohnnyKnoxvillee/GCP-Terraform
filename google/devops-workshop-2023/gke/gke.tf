resource "local_file" "kubeconfig" {
  filename = "~/.kube/config"
  content = <<-EOT
apiVersion: v1
kind: Config
clusters:
- name: devops-workshop-2023-gke
  cluster:
    server: https://${module.gke.endpoint}
    certificate-authority-data: ${module.gke.ca_certificate}
contexts:
- name: devops-workshop-2023-context
  context:
    cluster: devops-workshop-2023-gke
current-context: devops-workshop-2023-context
  EOT
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = var.cluster_name
  region                     = var.vpc_region
  regional                   = false
  ip_range_pods              = var.vpc_subnetwork
  ip_range_services          = var.vpc_subnetwork
  zones                      = ["us-central1-c"]
  network                    = var.vpc_network
  subnetwork                 = var.vpc_subnetwork
  http_load_balancing        = false
  horizontal_pod_autoscaling = true
  network_policy             = false

  node_pools = [
    {
      name               = var.node_pool_name
      machine_type       = "e2-small"
      min_count          = 1
      max_count          = 8
      disk_size_gb       = 25
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = true
      service_account    = var.gke_service_account
      preemptible        = true
      initial_node_count = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}
