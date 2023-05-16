terraform {

  backend "s3" {       # √ Terraform state store backend
    bucket = "devopsengineersm-terraform-state-backend"
    key = "tf/terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "terraform_state"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl" # √ This provider allows you to manage kubernetes resources by using yaml
      version = ">= 1.14.0"  # √ The latest version as of 15th May
    }
    helm = {
      source  = "hashicorp/helm"  # √ Manage installed Charts in your Kubernetes cluster, in the same way Helm does, through Terraform
      version = ">= 2.9.0"  # √ The latest version as of 15th May
    }
  }
}

provider "aws" {
  # Configuration options
  region = "eu-west-1"
}

module "vpc" {
  source = "./vpc"
}

module "eks" {
  source = "./eks"
  vpc_id            = var.vpc_id
  subnet_ids        = [ var.subnet_ids ]
  region            = var.region
  Environment       = var.Environment
  cluster_name      = var.cluster_name
  cluster_version   = var.cluster_version
}
