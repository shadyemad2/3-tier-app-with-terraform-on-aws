variable "project_name" {}
variable "instance_type" {}
variable "bastion_instance_type" {}
variable "key_name" {}
variable "user_data_file" {}
variable "min_size" {}
variable "max_size" {}
variable "desired_capacity" {}
variable "db_instance_class" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}
variable "email_address" {
  type = string 
}