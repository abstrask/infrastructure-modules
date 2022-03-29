
terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.9.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.13.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.4.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.19.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 4.21.0"
    }

    flux = {
      source  = "fluxcd/flux"
      version = "~> 0.12.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }

}
