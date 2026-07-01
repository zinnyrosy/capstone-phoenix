variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-north-1"
}

variable "project_name" {
  description = "Project name used for naming resources"
  type        = string
  default     = "capstone-phoenix"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type for all nodes"
  type        = string
  default     = "t3.medium"
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
}

variable "ami_id" {
  description = "Ubuntu 24.04 AMI ID for eu-north-1"
  type        = string
  default     = "ami-08eb150f611ca277f"
}

variable "key_name" {
  description = "AWS key pair name for SSH access"
  type        = string
}

variable "my_ip" {
  description = "Your public IP for SSH access (format: x.x.x.x/32)"
  type        = string
}