variable "region" {
    description = "Define the region"
    default = "eu-west-1"
}

variable "aws_networking_bucket" {
  default = "ima-ddt-networking"
}

variable "aws_application_bucket" {
  default = "ima-ddt-application"
}

variable "aws_dynamodb_table" {
  default = "ima-ddt-tfstatelock"
}


# variable "aws_access_key" {
#     description = "Provide aws access key"
# }

# variable "aws_secret_key" {
#     description = "Provide aws secret key"
# }
