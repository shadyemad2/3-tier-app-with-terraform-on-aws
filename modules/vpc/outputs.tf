output "vpc_id" {
    value = aws_vpc.vpc_shady.id 
}

output "public_subnet_ids" {
  description = "A list of public subnet IDs."
  value       = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  description = "A list of private subnet IDs."
  value       = aws_subnet.private_subnet[*].id
}
