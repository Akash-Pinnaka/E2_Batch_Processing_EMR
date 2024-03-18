# resource "aws_vpc" "VPC" {
#   cidr_block = "10.0.0.0/20"

#   tags = {
#     Name                                       = "vpc-${random_pet.pet.id}"
#     "for-use-with-amazon-emr-managed-policies" = "true"
#   }
# }

# resource "aws_subnet" "Private-VPC" {
#   vpc_id            = aws_vpc.VPC.id
#   cidr_block        = "10.0.0.0/21"
#   availability_zone = "us-east-1e"

#   tags = {
#     Name                                       = "Private-${random_pet.pet.id}"
#     "for-use-with-amazon-emr-managed-policies" = "true"
#   }
# }

# resource "aws_route_table" "private-route-table" {

#   vpc_id = aws_vpc.VPC.id

#   route {
#     cidr_block = "10.0.0.0/20"
#     gateway_id = "local"
#   }

#   tags = {
#     Name = "private-route-table-${random_pet.pet.id}"
#   }
# }