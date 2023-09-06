output "load_balancer_dns" {
  value = module.fastapi-app-service.load_balancer_dns
}

output "ecr_url" {
  value = module.fastapi-app-service.ecr_url
}