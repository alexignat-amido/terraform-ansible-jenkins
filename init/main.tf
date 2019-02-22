terraform {
  backend "s3" {
  bucket = "ima-terraform-state"
  key    = "terraform-state/init/terraform-statefile"
  region = "eu-west-1"
  }
}
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}

resource "aws_iam_user" "default" {
  name = "jenkins-user"
}
resource "aws_iam_access_key" "default" {
  user = "${aws_iam_user.default.name}"
}
resource "aws_iam_policy" "default" {
  name = "S3-policy"
  description = "S3 bucket policy"
  policy = "${file("policy/s3-policy.json")}"
}

resource "aws_iam_user_policy_attachment" "s3-policy" {
  user = "${aws_iam_user.default.name}"
  policy_arn = "${aws_iam_policy.default.arn}"
}

resource "aws_iam_user_policy_attachment" "VPC-full-access" {
  user = "${aws_iam_user.default.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}