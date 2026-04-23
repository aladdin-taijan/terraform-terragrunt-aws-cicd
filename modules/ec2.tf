

resource "aws_security_group" "ec2_sg" {
  name = "${var.environment}-ec2-sg"
  description = "Allow SSH , HTTPS and HTTP inbound traffic"
  vpc_id = aws_vpc.main.id

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "SSH from anywhere"
  }
  ingress {
      from_port = 80
      to_port = 80
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      
  }
  ingress {
      from_port = 443
      to_port = 443
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      
  }

  ingress {
    from_port       = 3306   # MySQL default port; for PostgreSQL use 5432
    to_port         = 3306
    protocol        = "tcp"
    description     = "MySQL from EC2"
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
      Name = "${var.environment}-ec2-rds-sg"
  }
}

resource "aws_instance" "web" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    key_name = var.key_name
    user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
    echo "<h1>Helllo from $(hostname -f) in ${var.environment} EC2</h1>" > /var/www/html/index.html
    EOF
    tags = {
      Name = "${var.environment}-ec2"
      Environment = var.environment
    }
  
}