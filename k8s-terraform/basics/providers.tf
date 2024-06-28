provider "kubernetes" {
  config_path    = "/etc/rancher/k3s/k3s.yaml"
  config_context = "default"
}

provider "helm" {
  kubernetes {
    config_path    = "/etc/rancher/k3s/k3s.yaml"
    config_context = "default"
  }
}