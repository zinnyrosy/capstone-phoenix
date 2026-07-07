# Architecture

## Overview
This capstone deploys the TaskApp (React frontend + Flask backend + PostgreSQL) on a 3-node k3s Kubernetes cluster on AWS EC2, managed by Argo CD GitOps.

## Node Topology
- **Control Plane** (ip-10-0-1-80, 51.21.244.36): k3s server, runs Argo CD, cert-manager
- **Worker 1** (ip-10-0-1-142, 13.62.18.251): runs backend, frontend replicas
- **Worker 2** (ip-10-0-1-100, 13.49.245.87): runs backend, frontend replicas, ingress-nginx

## How a Request Flows
1. User browser → DNS (zinnydev-taskapp.site) → 13.49.245.87
2. nginx ingress controller (hostNetwork, port 80/443)
3. TLS termination (cert-manager + Let's Encrypt certificate)
4. Frontend service → React/nginx pod (serves static files)
5. Frontend calls /api → backend service → Flask pod
6. Flask → PostgreSQL StatefulSet (persistent storage via PVC)

## Network
- VPC: 10.0.0.0/16
- Subnet: 10.0.1.0/24
- Security Group: 22 (admin IP), 80/443 (world), 6443 (VPC only)
- k3s pod CIDR: 10.42.0.0/16
- k3s service CIDR: 10.43.0.0/16

## Single-Server Assumptions Fixed
| Assumption | Fix |
|-----------|-----|
| One server = no failover | 3 nodes; pods reschedule on failure |
| Single replica = downtime on deploy | 2+ replicas + maxUnavailable:0 |
| Local disk = data lost on restart | PVC backed by local-path provisioner |
| No autoscaling | HPA on backend (CPU + memory) |
| Manual deployments | Argo CD GitOps auto-sync |
| No TLS | cert-manager + Let's Encrypt |

## GitOps
Argo CD watches manifests/taskapp/ in this repo. Any commit triggers automatic sync — no manual kubectl apply in final state.

## Secrets Strategy
Secrets are created out-of-band (not committed in plaintext). Argo CD ignores them during sync.
