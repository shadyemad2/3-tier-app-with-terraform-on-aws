variable "project_name" {
    type = string
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16" 
}

variable "public_subnets_cidrs" {
    type = list(string)
    default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

variable "private_subnets_cidrs" {
    type = list(string)
    default = [ "10.0.3.0/24", "10.0.4.0/24" ]
}

variable "availability_zones" {
    type = list(string)
    default     = ["us-east-1a", "us-east-1b"]
}
