variable "project_name" {
  description = "Project name used for naming resources"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "ami_id" {
  description = "Ubuntu 24.04 AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "AWS key pair name"
  type        = string
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
}

variable "subnet_id" {
  description = "ID of the subnet to launch instances in"
  type        = string
}

variable "security_group_id" {
  description = "ID of the security group"
  type        = string
}