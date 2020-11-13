resource "helm_release" "goldpinger" {
  name          = "goldpinger"
  chart         = "goldpinger"
  repository    = "https://kubernetes-charts.storage.googleapis.com"
  version       = var.chart_version != null ? var.chart_version : null
  namespace     = var.namespace
  recreate_pods = true
  force_update  = true

  set {
    name  = "priorityClassName"
    value = var.priority_class
  }

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "serviceMonitor.enabled"
    value = "true"
  }

  set {
    name = "serviceMonitor.selector.release"
    value = "monitoring"
  }

  set {
    name  = "resources.requests.cpu"
    value = "10m"
  }

  set {
    name  = "resources.requests.memory"
    value = "50Mi"
  }

  values = [
    file("${path.module}/tolerations.yaml")
  ]
}
