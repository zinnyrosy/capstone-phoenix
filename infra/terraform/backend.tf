terraform {
  backend "s3" {
    bucket         = "zinnydev-taskapp-tfstate-781897846859"
    key            = "phoenix/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}