# Second private subnet (different AZ)
resource "aws_subnet" "private_second" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
  tags = { Name = "${var.environment}-private-subnet-second" }
}

# DB Subnet Group (needs at least two private subnets in different AZs)
resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = [aws_subnet.private.id, aws_subnet.private_second.id]
  tags = { Name = "${var.environment}-db-subnet-group" }
}

resource "aws_db_instance" "main" {
  identifier          = "${var.environment}-db"
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"   # free tier eligible
  allocated_storage   = 20
  storage_type        = "gp2"
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  skip_final_snapshot = true   # for dev environments (set false in prod)
  publicly_accessible = false
  backup_retention_period = 7
  backup_window       = "03:00-04:00"
  maintenance_window  = "Mon:04:00-Mon:05:00"
  tags = {
    Name        = "${var.environment}-rds"
    Environment = var.environment
  }
}