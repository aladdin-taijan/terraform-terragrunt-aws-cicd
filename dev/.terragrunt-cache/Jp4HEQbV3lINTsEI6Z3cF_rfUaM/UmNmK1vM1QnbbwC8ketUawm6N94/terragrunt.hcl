include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../modules/vpc-s3"
}

inputs = {
  environment = "dev"
  vpc_cidr    = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  bucket_name = "my-tfstate-dev-20260423"   # اسم فريد لكل بيئة
}
