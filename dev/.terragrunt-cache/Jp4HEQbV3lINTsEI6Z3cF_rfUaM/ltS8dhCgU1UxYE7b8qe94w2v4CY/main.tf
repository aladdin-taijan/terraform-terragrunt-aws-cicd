

terraform {
  backend "local" {}
}


resource "aws_s3_bucket" "state_bucket" {
  bucket = var.bucket_name # unique bucket name
  tags = {
    Name        = "terraform state bucket"
    Environment = var.environment
  }
}
resource "aws_s3_bucket_versioning" "state_bucket_versioning" {
  bucket = aws_s3_bucket.state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
  
}
# VPC
resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = { Name = "main-VPC" }
  
}
#Subnet -public
resource "aws_subnet" "public"  {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = { Name = "public-subnet" }
  
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
  tags = { Name = "private-subnet" }
}

#Internret gateway
resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.main.id
    tags = { Name = "Main-IGW" }
}
#Public Route table 
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = { Name = "Public-RT" }
}

#Public Route table association
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}