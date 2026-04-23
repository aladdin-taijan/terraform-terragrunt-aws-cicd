include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../modules"
}

inputs = {
  environment = "dev"
  vpc_cidr    = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  bucket_name = "my-tfstate-dev-20260423"   # unique name 
  ami_id = "ami-0ec10929233384c7f"  # Ubuntu Linux 2 us-east-1
  instance_type = "t3.micro"
  key_name = "Iac-project"   # Replace with your key pair name
  db_username = "admin"
  db_password = "YourStrongP@ssw0rd123"   # غيّره بكلمة قوية
  db_name     = "mydb"
}
