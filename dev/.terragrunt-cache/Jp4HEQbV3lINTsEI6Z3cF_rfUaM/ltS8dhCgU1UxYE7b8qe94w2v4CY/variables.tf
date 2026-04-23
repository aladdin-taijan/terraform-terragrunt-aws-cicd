variable "environment" {}
variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "bucket_name" {}

#EC2 variables
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0ec10929233384c7f"  # Ubuntu Linux 2 us-east-1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of existing EC2 Key Pair"
  type        = string
  default     = "Iac-project"   # Replace with your key pair name
}

variable "db_username" {
  description = "Database master username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "mydb"
}