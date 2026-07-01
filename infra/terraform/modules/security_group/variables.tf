variable "project_name" {
  description = "Project name used for naming resources"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "my_ip" {
  description = "Your public IP for SSH access (format: x.x.x.x/32)"
  type        = string
}