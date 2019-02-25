
resource "aws_vpc" "jenkins-master" {
    cidr_block = "${var.vpc_cidr_block}"
    enable_dns_hostnames = true
    tags = {
        Name = "jenkins-master"
    }
}
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.jenkins-master.id}"
    tags = {
        Name = "jenkins-master"
    }
}
resource "aws_subnet" "public-subnet" {
    vpc_id = "${aws_vpc.jenkins-master.id}"
    availability_zone = "${var.availability_zone}"
    cidr_block = "${var.public_subnet_CIDR_block}"
    map_public_ip_on_launch = true
    tags = {
        Name = "jenkins-master"
    }
}
resource "aws_route" "default" {
  route_table_id            = "${aws_vpc.jenkins-master.main_route_table_id}"
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = "${aws_internet_gateway.default.id}"
}

resource "aws_security_group" "default" {
    name = "jenkins-master-sg" 
    vpc_id = "${aws_vpc.jenkins-master.id}"

    # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
        "85.92.217.166/32"
        ]
  }

  # HTTP
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [
        "85.92.217.166/32"
        ]
  }

  #All trafic
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
        "0.0.0.0/0"
        ]
  }

  # Outbound Traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
    tags = {
        Name = "jenkins-master"
    }
}
