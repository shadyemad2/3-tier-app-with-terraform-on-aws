variable "project_name" {
  description = "The name of the project (used for naming WAF ACL)"
  type        = string
}

variable "alb_arn" {
  description = "The ARN of the ALB to associate with this WAF"
  type        = string
}
