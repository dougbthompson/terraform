
resource "aws_vpc" "terraform-vpc-test" {
  cidr_block = "10.100.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
    Name = "terraform-vpc"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.terraform-vpc-test.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.terraform-vpc-test.id}"
  availability_zone = "us-west-2a"
}
resource "aws_subnet" "subnet2" {
  cidr_block = "${cidrsubnet(aws_vpc.terraform-vpc-test.cidr_block, 2, 2)}"
  vpc_id = "${aws_vpc.terraform-vpc-test.id}"
  availability_zone = "us-west-2b"
}

resource "aws_security_group" "subnet_security" {
  vpc_id = "${aws_vpc.terraform-vpc-test.id}"

  ingress {
    cidr_blocks = [
      "${aws_vpc.terraform-vpc-test.cidr_block}"
    ]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
}

