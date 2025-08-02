

resource "aws_db_instance" "app_db" {
  count = var.create_db ? 1 : 0

  identifier = "webapp-db"
  engine     = "mysql"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  name              = "webapp"
  username          = "inspira4231"
  password          = "$inspira$@4523"
  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  skip_final_snapshot    = true
}
