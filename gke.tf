
module "gke" {
  source                 = "terraform-google-modules/kubernetes-engine/google"
  version = "24.0.0"
  project_id             = var.project_id
  name                   = var.cluster_name
  regional               = true
  region                 = var.region
  network                = module.gcp-network.network_name
  subnetwork             = module.gcp-network.subnets_names[0]
  ip_range_pods          = var.ip_range_pods_name
  ip_range_services      = var.ip_range_services_name
  create_service_account = false
}

