


resource "helm_release" "mongo" {
  name       = "mongo-release"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mongodb"
  namespace = "mongo"
  # version    = "6.0.1"

  # values = [
  #   "${file("values.yaml")}"
  # ]

  set {
    name  = "architecture"
    value = "replicaset"
  }
}

resource "helm_release" "prometheus" {
  chart      = "prometheus"
  name       = "prometheus"
  namespace  = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  version    = "15.5.3"

  set {
    name  = "podSecurityPolicy.enabled"
    value = true
  }

  set {
    name  = "server.persistentVolume.enabled"
    value = false
  }

  # You can provide a map of value using yamlencode. Don't forget to escape the last element after point in the name
  set {
    name = "server\\.resources"
    value = yamlencode({
      limits = {
        cpu    = "200m"
        memory = "50Mi"
      }
      requests = {
        cpu    = "100m"
        memory = "30Mi"
      }
    })
  }
}


resource "helm_release" "rabitmq" {
  name       = "rabit-release"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "rabbitmq"
  namespace = "rabitmq"
  # version    = "6.0.1"
  # values = [
  #   "${file("values.yaml")}"
  # ]
  # set {
  #   name  = "architecture"
  #   value = "replicaset"
  # }
}
resource "helm_release" "monitorstack" {
  name       = "mon-release"
  repository = "https://prometheus-community.github.io/helm-charts" 
  chart      = "kube-prometheus-stack"
  namespace = "monitoring"
  # version    = "6.0.1"
  # values = [
  #   "${file("values.yaml")}"
  # ]
  # set {
  #   name  = "architecture"
  #   value = "replicaset"
  # }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    name = "monitoring"
  }
}

resource "kubernetes_namespace" "services" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    name = "services"
  }
}


resource "kubernetes_namespace" "mongo" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    name = "mongo"
  }
}

resource "kubernetes_namespace" "rabitmq" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    name = "rabitmq"
  }
}