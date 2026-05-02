# Terraform EC2 Project

This project demonstrates how to create an EC2 instance on AWS using Terraform, including:

- Security Group (SSH port 22 and HTTP port 80)
- Auto-generated SSH key pair
- User data script to install Docker and run an Nginx container

## Architecture

| Component | Port | Protocol | Description |
|-----------|------|----------|-------------|
| User → EC2 | 22 | SSH | Secure shell access to the VM |
| User → EC2 | 80 | HTTP | Web traffic to Nginx |
| EC2 → Docker | - | - | Runs Nginx container internally |
| Docker → Nginx | 80 | HTTP | Serves web pages |

**Flow:** User connects via HTTP (port 80) → EC2 instance running Docker → Nginx container serves the page.
**Admin access:** User connects via SSH (port 22) → EC2 instance for management.

## Resources Created

| Resource | Description |
|----------|-------------|
| `aws_security_group` | Firewall: allows SSH and HTTP |
| `tls_private_key` + `aws_key_pair` | SSH key pair to connect to the VM |
| `aws_instance` (EC2) | Ubuntu 24.04 VM with user_data |
| `local_file` | Saves the private key locally |

## How to Use

```bash
terraform init
terraform plan
terraform apply -auto-approve

Outputs

After terraform apply, you will see:

- instance_public_ip: Public IP address of the VM
- website_url: URL to see Nginx running
- ssh_command: Command to connect via SSH

Test

# Open in browser
http://<PUBLIC_IP>

# Connect via SSH
ssh -i terraform-ec2-key-demo.pem ubuntu@<PUBLIC_IP>

# Verify Docker is running
sudo docker ps

Cleanup
terraform destroy -auto-approve

Screenshots

lsla.png
nginx.png
dockerps.png
