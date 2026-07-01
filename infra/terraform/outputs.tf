output "control_plane_public_ip" {
  description = "Public IP of the k3s control plane node"
  value       = module.compute.control_plane_public_ip
}

output "control_plane_private_ip" {
  description = "Private IP of the k3s control plane node"
  value       = module.compute.control_plane_private_ip
}

output "worker_public_ips" {
  description = "Public IPs of the k3s worker nodes"
  value       = module.compute.worker_public_ips
}

output "worker_private_ips" {
  description = "Private IPs of the k3s worker nodes"
  value       = module.compute.worker_private_ips
}

output "ssh_control_plane" {
  description = "SSH command for control plane"
  value       = "ssh -i ~/.ssh/${var.key_name}.pem ubuntu@${module.compute.control_plane_public_ip}"
}

output "ssh_workers" {
  description = "SSH commands for worker nodes"
  value       = [for ip in module.compute.worker_public_ips : "ssh -i ~/.ssh/${var.key_name}.pem ubuntu@${ip}"]
}