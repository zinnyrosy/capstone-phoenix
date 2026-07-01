module "network" {
  source       = "./modules/network"
  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr
  subnet_cidr  = var.subnet_cidr
  aws_region   = var.aws_region
}

module "security_group" {
  source       = "./modules/security_group"
  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.network.vpc_id
  my_ip        = var.my_ip
}

module "compute" {
  source            = "./modules/compute"
  project_name      = var.project_name
  environment       = var.environment
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  key_name          = var.key_name
  node_count        = var.node_count
  subnet_id         = module.network.subnet_id
  security_group_id = module.security_group.security_group_id
}