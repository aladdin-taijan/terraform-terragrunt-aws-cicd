remote_state {
  backend = "local"
  config = {
    path = "terraform.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "dev"
    }
  }
}
EOF
}