# Apply specific versions of Kubernetes add-ons depending on EKS version
# https://docs.aws.amazon.com/eks/latest/userguide/update-cluster.html

locals {
  kubeproxy_version_map = {
    "1.13" = "1.13.12"
    "1.14" = "1.14.9"
    "1.15" = "1.15.11"
    "1.16" = "1.16.12"
    "1.17" = "1.17.7"
  }

  coredns_version_map = {
    "1.13" = "1.6.6"
    "1.14" = "1.6.6"
    "1.15" = "1.6.6"
    "1.16" = "1.6.6"
    "1.17" = "1.6.6"
  }

  vpccni_version_map = {
    "1.13" = "1.5.5"
    "1.14" = "1.5.5"
    "1.15" = "1.6.1"
    "1.16" = "1.6.3"
    "1.17" = "1.6.3"
  }
}

# Lookup actual add-on versions
locals {
  kubeproxy_version   = var.kubeproxy_version_override == "" ? local.kubeproxy_version_map[var.cluster_version] : var.kubeproxy_version_override
  coredns_version     = var.coredns_version_override == "" ? local.coredns_version_map[var.cluster_version] : var.coredns_version_override
  vpccni_version      = var.vpccni_version_override == "" ? local.vpccni_version_map[var.cluster_version] : var.vpccni_version_override
  vpccni_minorversion = join(".", slice(split(".", local.vpccni_version), 0, 2))
}

# Get current AWS region
data "aws_region" "current" {}
