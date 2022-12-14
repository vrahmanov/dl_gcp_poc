provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}
provider "helm" {
  kubernetes {
         config_path = "~/.kube/config"
  }
}