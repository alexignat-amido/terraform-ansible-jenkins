output "jenkins-url" {
  value = "http://${aws_instance.jenkins-master.public_ip}:8080"
}

output "ssh-jenkins" {
  value =  "ssh -i '/jenkins-key.pem' ec2-user@${aws_instance.jenkins-master.public_dns}"
}