variable "project_name" {
  type = string
}

variable "db_subnet_ids" {
  description = "List of private subnet IDs for RDS"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group for RDS (allows MySQL from EC2)"
  type        = string
}

variable "db_instance_class" {
  default     = "db.t3.micro"
  description = "RDS instance class"
  type        = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
  sensitive = true
}

variable "db_name" {
  type = string
}
