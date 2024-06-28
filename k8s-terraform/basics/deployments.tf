/*--DEPLOYMENT---*/
resource "kubernetes_deployment_v1" "nginx" {
  metadata {
    name      = var.nginx_deployment_name
    namespace = kubernetes_namespace_v1.basic.metadata[0].name
    labels    = var.nginx_deployment_labels
  }

  spec {
    selector {
      match_labels = var.nginx_deployment_labels
    }
    replicas               = var.nginx_replicas
    revision_history_limit = 3
    # strategy {
    #   type = var.strategy_type
    # }
    template {
      metadata {
        labels = var.nginx_deployment_labels
      }
      spec {
        container {
          name  = var.nginx_container_name
          image = var.nginx_container_image
          port {
            container_port = var.nginx_container_port
            protocol       = var.nginx_container_protocol
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment_v1" "nginx2" {
  metadata {
    name      = var.nginx2_deployment_name
    namespace = kubernetes_namespace_v1.basic.metadata[0].name
    labels    = var.nginx2_deployment_labels
  }

  spec {
    selector {
      match_labels = var.nginx2_deployment_labels
    }
    replicas               = 2
    revision_history_limit = 3
    template {
      metadata {
        labels = var.nginx2_deployment_labels
      }
      spec {
        container {
          name  = var.nginx_container_name
          image = var.nginx_container_image
          port {
            container_port = var.nginx_container_port
            protocol       = var.nginx_container_protocol
          }
        }
      }
    }
  }
}

/*--DAEMONSET---*/
resource "kubernetes_daemon_set_v1" "fluentd-elasticsearch" {
  metadata {
    name      = var.daemon_set_name
    namespace = kubernetes_namespace_v1.basic.metadata[0].name
    labels    = var.k8s_app_label
  }

  spec {
    selector {
      match_labels = var.name_label
    }
    template {
      metadata {
        labels = var.name_label
      }
      spec {
        container {
          name  = var.fluentd_elasticsearch_container_name
          image = var.fluentd_elasticsearch_container_image
        }
      }
    }
  }
}

/*--STATEFULSET---*/
resource "kubernetes_stateful_set_v1" "mysql" {
  metadata {
    name      = var.stateful_set_name
    namespace = kubernetes_namespace_v1.basic.metadata[0].name
    labels    = var.app_label
  }

  spec {
    service_name = var.mysql_service_name
    replicas     = var.replicas

    selector {
      match_labels = var.app_label
    }

    template {
      metadata {
        labels = var.app_label
      }
      spec {
        container {
          name  = var.container_name
          image = var.container_image
          port {
            container_port = var.container_port
            name           = var.port_name
          }
          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = var.mysql_root_password
          }
          env {
            name  = "MYSQL_DATABASE"
            value = var.mysql_database
          }
        }
      }
    }
  }
}
