# terraform-ec2-project

[![Terraform CI](https://github.com/DamianoNicotra/terraform-ec2-project/actions/workflows/terraform.yml/badge.svg)](https://github.com/DamianoNicotra/terraform-ec2-project/actions/workflows/terraform.yml)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Deploy an EC2 instance with Nginx and Docker using Terraform.

## Architecture Decisions

| Decision | Reason |
|----------|--------|
| **EC2 vs ECS** | EC2 gives full control and is cheaper for simple workloads. ECS adds unnecessary complexity. |
| **Nginx vs Apache** | Nginx is lightweight, easier to configure, and better for static content. |
| **User_data script** | Automates Docker installation and container startup. No manual SSH required. |
| **Terraform vs CloudFormation** | Terraform is cloud-agnostic, easier to read, and has better community support. |

## Known Limitations

- No load balancer → single point of failure
- No auto-scaling → cannot handle traffic spikes
- No HTTPS → TLS not configured
- Terraform state stored locally → not safe for team use

## How to Improve

- Add ALB (Application Load Balancer) + Auto Scaling Group for high availability
- Add CloudWatch dashboard for monitoring CPU and memory
- Move Terraform state to S3 backend with DynamoDB lock
- Add HTTPS with ACM (AWS Certificate Manager)

## Cost Control

**This infrastructure is designed to be destroyable.**

After testing, run:
```bash
terraform destroy -auto-approve
