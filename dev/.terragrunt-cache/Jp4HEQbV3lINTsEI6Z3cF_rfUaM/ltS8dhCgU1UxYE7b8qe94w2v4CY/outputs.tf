output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.web.public_dns
}

output "rds_endpoint" {
  value = aws_db_instance.main.endpoint
  description = "RDS endpoint (host:port)"
}

output "rds_db_name" {
  value = aws_db_instance.main.db_name
}