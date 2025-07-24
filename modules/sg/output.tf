output "alb_sg_id" {
    value = aws_security_group.alb_sg.id
}

output "frontend_sg_id" {
    value = aws_security_group.frontend_sg.id
}

output "rds_sg_id" {
    value = aws_security_group.db_sg.id
}

output "bastion_sg_id" {
    value = aws_security_group.bastion_sg.id
}