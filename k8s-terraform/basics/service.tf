/*--SERVICE---*/

resource "kubernetes_service_v1" "service-cluster-ip" {
  metadata {
    name      = var.cluster_ip_service_name
    namespace = kubernetes_namespace_v1.basic.metadata[0].name
  }
  spec {
    port {
      port        = 8080
      target_port = 80
    }
    type     = "ClusterIP"
    selector = var.nginx_deployment_labels
  }
}

resource "kubernetes_service_v1" "service-node-port" {
  metadata {
    name      = var.node_port_service_name
    namespace = kubernetes_namespace_v1.basic.metadata[0].name
  }
  spec {
    port {
      node_port   = 32400
      port        = 80
      target_port = 80
    }
    type     = "NodePort"
    selector = var.nginx2_deployment_labels
  }
}
