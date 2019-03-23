provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}

resource "aws_subnet" "main" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Main"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

#resource "aws_eks_cluster" "example" {
#  name = "example"
#  role_arn = "${aws_iam_role.example.arn}"
#  vpc_config {
#     subnet_ids = ["${aws_subnet.main.id}"]
#   }
#}
#
#output "endpoint" {
#  value = "${aws_eks_cluster.example.endpoint}"
#}
#
#output "kubeconfig-certificate-authority-data" {
#  value = "${aws_eks_cluster.example..certificate_authority.0.data}"
#}
