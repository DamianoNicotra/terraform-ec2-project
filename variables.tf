variable "aws_region" {
  description = "Regione AWS"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Nome del progetto"
  type        = string
  default     = "terraform-ec2"
}

variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "demo"
}

variable "instance_type" {
  description = "Tipo di istanza (t2.micro è Free Tier)"
  type        = string
  default     = "t3.micro"
}

