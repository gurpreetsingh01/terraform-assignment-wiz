output "instance_id" {
  value       = aws_instance.vizh_web_server[*].id
}