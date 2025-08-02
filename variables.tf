
# Given below are the variables that are used in the main.tf

variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }

variable "app_ami" {}
variable "instance_type" { default = "t3.micro" }
variable "alb_listener_port" { default = 80 }

variable "create_db" { default = false }
