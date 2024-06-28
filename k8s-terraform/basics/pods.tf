resource "kubernetes_namespace_v1" "basic" {
  metadata {
    name = var.namespace_name
  }
}

/*--POD---*/
resource "kubernetes_pod_v1" "nginx" {
  metadata {
    name      = var.nginx_pod_name
    namespace = kubernetes_namespace_v1.basic.metadata[0].name
  }

  spec {
    container {
      image = var.nginx_container_image
      name  = var.nginx_container_name
    }
  }
}

resource "kubernetes_pod_v1" "wordpress" {
  metadata {
    name      = var.wordpress_pod_name
    namespace = kubernetes_namespace_v1.basic.metadata[0].name
  }

  spec {
    container {
      image = var.wordpress_container_image
      name  = var.wordpress_container_name
      port {
        container_port = 80
        protocol       = "TCP"
      }
    }
  }
}

resource "kubernetes_pod_v1" "busybox" {
  metadata {
    name      = var.box_name
    namespace = kubernetes_namespace_v1.basic.metadata[0].name
  }

  spec {
    container {
      image = var.box_container_image
      name  = var.box_container_name
      resources {
        requests = var.box_container_requests
        limits   = var.box_container_limits
      }
      command = var.box_container_command
    }
  }
}