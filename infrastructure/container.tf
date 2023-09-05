resource "aws_ecr_repository" "api_ecr" {
  name = "${var.project_name}-repository"
}

resource "aws_ecs_cluster" "cluster" {
  name = "${var.project_name}-cluster"
}

module "container_definition" {
  source = "git::https://github.com/cloudposse/terraform-aws-ecs-container-definition.git?ref=tags/0.45.0"

  container_name  = "${var.project_name}-container"
  container_image = "xxx.amazonaws.com/${var.project_name}-repository"
  port_mappings = [
    {
      containerPort = 80
      hostPort      = 80
      protocol      = "tcp"
    }
  ]
}

module "ecs_alb_service_task" {
  source = "git::https://github.com/cloudposse/terraform-aws-ecs-alb-service-task.git?ref=tags/0.41.0"

  namespace                 = "paulr909"
  stage                     = "dev"
  name                      = var.project_name
  container_definition_json = module.container_definition.json_map_encoded_list
  ecs_cluster_arn           = aws_ecs_cluster.cluster.arn
  launch_type               = "FARGATE"
  vpc_id                    = data.aws_vpc.default.id
  security_group_ids        = [module.security_group.this_security_group_id]
  subnet_ids                = module.subnets.public_subnet_ids

  health_check_grace_period_seconds = 60
  ignore_changes_task_definition    = false

  ecs_load_balancers = [
    {
      target_group_arn = module.alb.target_group_arns[0]
      elb_name         = ""
      container_name   = "prediction-api-container"
      container_port   = 80
  }]
}