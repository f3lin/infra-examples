variable "namespace_name" {
  description = "The name of the namespace to create"
  type        = string
  default     = "basic"
}

/*--POD---*/

variable "nginx_pod_name" {
  description = "The name of the nginx pod"
  type        = string
  default     = "nginx-pod"
}

variable "wordpress_pod_name" {
  description = "The name of the wordpress pod"
  type        = string
  default     = "wordpress-pod"
}

variable "wordpress_container_name" {
  description = "The name of the wordpress container"
  type        = string
  default     = "wordpress"
}

variable "wordpress_container_image" {
  description = "The image of the wordpress container"
  type        = string
  default     = "wordpress:latest"
}

/*--DEPLOYMENT---*/

variable "nginx_deployment_name" {
  description = "The name of the Nginx deployment"
  type        = string
  default     = "nginx-deployment"
}

variable "nginx_deployment_labels" {
  description = "Labels to apply to the Nginx deployment"
  type        = map(string)
  default = {
    app : "app-example"
    env : "dev"
  }
}

variable "nginx2_deployment_name" {
  description = "Labels to apply to the Nginx deployment"
  type        = string
  default     = "deploy-nginx"
}

variable "nginx2_deployment_labels" {
  description = "Labels to apply to the Nginx deployment"
  type        = map(string)
  default = {
    app : "nginx"
    env : "prod"
  }
}

variable "nginx_replicas" {
  description = "Number of Nginx replicas"
  type        = number
  default     = 3
}

# variable "strategy_type" {
#   description = "The strategy type for the deployment"
#   type        = string
#   default     = "RollingUpdate"
# }

variable "nginx_container_name" {
  description = "The name of the container"
  type        = string
  default     = "nginx"
}

variable "nginx_container_image" {
  description = "The image of the container"
  type        = string
  default     = "nginx:alpine"
}

variable "nginx_container_port" {
  description = "The container port to expose"
  type        = number
  default     = 80
}

variable "nginx_container_protocol" {
  description = "The protocol for the container port"
  type        = string
  default     = "TCP"
}

/*--DAEMONSET---*/

variable "daemon_set_name" {
  description = "The name of the Nginx deployment"
  type        = string
  default     = "fluentd-elasticsearch"
}

variable "fluentd_elasticsearch_container_name" {
  description = "The name of the container"
  type        = string
  default     = "fluentd-elasticsearch"
}

variable "fluentd_elasticsearch_container_image" {
  description = "The image of the container"
  type        = string
  default     = "quay.io/fluentd_elasticsearch/fluentd:v2.5.2"
}

variable "k8s_app_label" {
  description = "The k8s_app label to use"
  type        = map(string)
  default = {
    k8s_app = "fluentd-elasticsearch"
  }
}

variable "name_label" {
  description = "The name label to use"
  type        = map(string)
  default = {
    name = "fluentd-elasticsearch"
  }
}

/*--STATEFULSET---*/

variable "stateful_set_name" {
  description = "The name of the StatefulSet"
  type        = string
  default     = "mysql"
}

variable "app_label" {
  description = "The app label to use"
  type        = map(string)
  default = {
    app = "mysql"
  }
}

variable "mysql_service_name" {
  description = "The name of the service associated with the StatefulSet"
  type        = string
  default     = "mysql"
}

variable "replicas" {
  description = "The number of replicas for the StatefulSet"
  type        = number
  default     = 1
}

variable "container_name" {
  description = "The name of the container"
  type        = string
  default     = "mysql"
}

variable "container_image" {
  description = "The image of the container"
  type        = string
  default     = "mysql:8"
}

variable "container_port" {
  description = "The container port to expose"
  type        = number
  default     = 3306
}

variable "port_name" {
  description = "The name of the port"
  type        = string
  default     = "mysql"
}

variable "mysql_root_password" {
  description = "The root password for MySQL"
  type        = string
  default     = "datascientest@2022"
}

variable "mysql_database" {
  description = "The name of the MySQL database to create"
  type        = string
  default     = "datascientest"
}

/*--BOX FOR TEST--*/

variable "box_name" {
  type    = string
  default = "mybox"
}

variable "box_restart_policy" {
  type    = string
  default = "Always"
}

variable "box_container_name" {
  type    = string
  default = "mybox"
}

variable "box_container_image" {
  type    = string
  default = "busybox"
}

variable "box_container_command" {
  type    = list(string)
  default = ["sleep", "3600"]
}

variable "box_container_requests" {
  type = map(string)
  default = {
    cpu    = "100m"
    memory = "128Mi"
  }
}

variable "box_container_limits" {
  type = map(string)
  default = {
    cpu    = "250m"
    memory = "256Mi"
  }
}

/*--SERVICE--*/

variable "cluster_ip_service_name" {
  type    = string
  default = "svc-interne"
}

variable "node_port_service_name" {
  type    = string
  default = "svc-public"
}

# variable "service_selector" {
#   type        = map(string)
#   default     = {
#     app: "app-example"
#     env: "dev"
#   }
# }