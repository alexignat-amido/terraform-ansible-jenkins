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

resource "aws_iam_user_policy_attachment" "name" {
  user = "${aws_iam_user.default.name}"
  policy_arn = "${aws_iam_policy.default.arn}"
}