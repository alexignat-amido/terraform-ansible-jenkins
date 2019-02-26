
resource "aws_instance" "jenkins-master" {
    ami = "${var.aws_linux_ami}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public-subnet.id}"
    # security_groups = ["${aws_security_group.default.id}"]
    vpc_security_group_ids = ["${aws_security_group.default.id}"]
    key_name = "jenkins-key"
    associate_public_ip_address = true
    source_dest_check           = true
    depends_on = ["aws_internet_gateway.default"]
    provisioner "file" {
    source      = "userdata.sh"
    destination = "/tmp/userdata.sh"
    }
    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/userdata.sh",
      "/tmp/userdata.sh args",
    ]
    }

    tags = {
        Name = "jenkins-master"
    }
}