output "instance_id" {
  value = aws_instance.web_server.id
}

output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "instance_public_dns" {
  value = aws_instance.web_server.public_dns
}

output "ssh_command" {
  value = "ssh -i ${var.project_name}-key-${var.environment}.pem ubuntu@${aws_instance.web_server.public_ip}"
}

output "website_url" {
  value = "http://${aws_instance.web_server.public_ip}"
}

