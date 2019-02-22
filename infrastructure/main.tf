terraform {
  backend "s3" {
  bucket = "ima-terraform-state"
  key    = "terraform-state/terraform-statefile"
  region = "eu-west-1"
  }
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}