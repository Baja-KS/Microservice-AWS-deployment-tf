output "subnet_id" {
    value = aws_subnet.pub_subnet.id
}
output "subnet2_id" {
  value = aws_subnet.pub_subnet2.id
}

output "vpc_id" {
    value = aws_vpc.vpc.id
}