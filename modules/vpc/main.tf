resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

# resource "aws_internet_gateway" "internet_gateway" {
#   vpc_id = aws_vpc.vpc.id
# }

# resource "" "name" {
  
# }

resource "aws_subnet" "pub_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_subnet_cidr
  availability_zone = "${var.aws_region}a"
}

resource "aws_subnet" "pub_subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_subnet2_cidr
  availability_zone = "${var.aws_region}b"
}

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.internet_gateway.id
#   }
# }

# resource "aws_route_table_association" "route_table_association" {
#   subnet_id      = aws_subnet.pub_subnet.id
#   route_table_id = aws_route_table.public.id
# }





