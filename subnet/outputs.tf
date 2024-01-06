/*
output "public_subnet_id" {
  value = aws_subnet.each.public_subnet.id
}

output "public_subnet_cidr" {
  value = aws_subnet.each.public_subnet.cidr_block
}

output "private_subnet_id" {
  value = aws_subnet.each.private_subnet.id
}

output "private_subnet_cidr" {
  value = aws_subnet.each.private_subnet.cidr_block
}
*/

output "subnet_ids" {
  value = {
    for k, v in aws_subnet.subnet : k => v.id
  }
}

output "subnet_cidr" {
  value = {
    for k, v in aws_subnet.subnet : k => v.cidr_block
  }
}

