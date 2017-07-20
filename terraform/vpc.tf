provider "aws" {
    region = "us-west-2"
}

resource "aws_vpc" "eclipse" {
    cidr_block = "10.66.0.0/16"
    enable_dns_hostnames = true
    tags {
        Name = "eclipse"
        group = "eclipse-vpc"
    }
}
