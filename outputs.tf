output "dns_namr_alb" {
  value = module.alb.alb_dns_name
}

output "rds_endpoint" {
  value = module.db.db_endpoint
}

output "bation_instance_ip" {
  value = module.bastion.bastion_public_ip
}
