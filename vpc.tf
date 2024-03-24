resource "aws_vpc" "VPC" {
  cidr_block           = "10.0.0.0/20"
  enable_dns_hostnames = true
  tags = {
    Name                                       = "vpc-${random_pet.pet.id}"
    "for-use-with-amazon-emr-managed-policies" = "true"
  }
}

resource "aws_subnet" "VPC-subnet" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = "10.0.0.0/21"
  availability_zone = "us-east-1e"

  tags = {
    Name                                       = "VPC-subnet-${random_pet.pet.id}"
    "for-use-with-amazon-emr-managed-policies" = "true"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.VPC.id
}



resource "aws_route_table" "route-table" {

  vpc_id = aws_vpc.VPC.id

  route {
    cidr_block = "10.0.0.0/20"
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
depends_on = [aws_internet_gateway.gw]
}

resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.VPC-subnet.id
  route_table_id = aws_route_table.route-table.id
}