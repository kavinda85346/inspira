

vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]

app_ami             = "ami-12345678"
instance_type       = "t3.micro"
alb_listener_port   = 80

create_db           = true
aws_region          = "us-east-1"
