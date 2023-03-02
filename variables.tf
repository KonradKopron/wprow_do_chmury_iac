variable "vpc_name" {
  description = "name_of_vpc"
  type        = string
  default = "vpc-net-shop"
}

variable "subnet_name" {
  description = "Name of subnet"
  type        = string
  default = "subnet-shop"
}

variable "gcp_region" {
  type        = string
  description = "Region to use for GCP provider"
  default     = "us-central1"
}

variable "gcp_zone" {
  description = "zona gcp"
  type        = string
  default = "us-central1-a"
}