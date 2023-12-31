output "vpc_id" {
  value = aws_vpc.fastapi-app-vpc.id
}

output "ecs_security_group_id" {
  value = aws_security_group.ecs.id
}

output "load_balancer_security_group_id" {
  value = aws_security_group.load-balancer.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public-subnet-1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public-subnet-2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.private-subnet-1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private-subnet-2.id
}

output "domain_zone_id" {
  value = aws_route53_zone.primary.zone_id
}