

resource "aws_security_group" "inspira" {
  name = "app-sg"
  vpc_id = var.vpc_id
}

resource "aws_lb" "app_alb" {
  name               = "app-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  security_groups    = [aws_security_group.app.id]
}

resource "aws_launch_template" "app" {
  name_prefix   = "app-template"
  image_id      = var.app_ami
  instance_type = var.instance_type

  user_data = base64encode(file("${path.module}/user_data.sh"))
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = var.public_subnet_ids
  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
}
