output "jenkins-url" {
  value = "${aws_instance.jenkins-master.public_ip}"
}

# output "ssh-jenkins" {
#   value =  "ssh -i 'jenkins-key.pem' ec2-user@${aws_instance.jenkins-master.public_dns}"
# }