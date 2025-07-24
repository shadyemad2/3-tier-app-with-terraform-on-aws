module "vpc" {
    source = "./modules/vpc"
    project_name = var.project_name
    vpc_cidr = "10.0.0.0/16"
    public_subnets_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
    availability_zones = ["us-east-1a", "us-east-1b" ]
}
module "sg" {
    source = "./modules/sg"
    project_name = "app"
    vpc_id = module.vpc.vpc_id 
}

module "bastion" {
  source = "./modules/bastion_host"
  project_name = var.project_name
  instance_type = var.instance_type
    subnet_id          = module.vpc.public_subnet_ids[0]
  security_group_id  = module.sg.bastion_sg_id
  key_name           = var.key_name
}
  
module "db" {
  source            = "./modules/db"
  project_name      = var.project_name
  db_subnet_ids     = module.vpc.private_subnet_ids
  security_group_id = module.sg.rds_sg_id
  db_instance_class = var.db_instance_class
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
}

module "alb" {
  source            = "./modules/alb"
  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.sg.alb_sg_id
}

module "autoscaling" {
  source             = "./modules/autoscaling"
  project_name       = var.project_name
  instance_type      = var.instance_type
  key_name           = var.key_name
  user_data_file     = var.user_data_file
  ec2_sg_id          = module.sg.frontend_sg_id
  private_subnet_ids = module.vpc.private_subnet_ids
  target_group_arn   = module.alb.alb_target_group_arn
  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity
  db_endpoint        = module.db.db_endpoint
  db_name            = var.db_name
  db_user            = var.db_username
  db_password        = var.db_password
}
module "cloud_watch" {
  source = "./modules/cloudwatch"
  project_name = var.project_name
  email_address = var.email_address
  rds_identifier = module.db.db_identifier
}

module "waf" {
  source = "./modules/waf"
  project_name = var.project_name
  alb_arn = module.alb.alb_arn
}
