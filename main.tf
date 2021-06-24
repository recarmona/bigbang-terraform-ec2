terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    sops = {
      source = "carlpett/sops"
      version = "~> 0.5"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#exec-plugins for eks
provider "kubernetes" {
  config_path = var.kube_conf_file
}

provider "kubectl" {
  config_path = var.kube_conf_file
}

data "sops_file" "sops-gpg" {
  source_file = "secrets.enc.yaml"
}
