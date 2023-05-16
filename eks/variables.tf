#Define input variables

variable "region" {
  type    = string
}

variable "cluster_name" {
  type    = string
}

variable "vpc_id" {
  type    = string
}

variable "subnet_ids" {
}

variable "Environment" {
  type    = string
}

variable "cluster_version" {
  type    = string
}