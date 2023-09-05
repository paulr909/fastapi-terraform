data "aws_vpc" "default" {
  default = true
}

data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "subnets" {
  source             = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=tags/0.33.0"
  namespace          = "paulr909"
  stage              = "dev"
  name               = var.project_name
  vpc_id             = data.aws_vpc.default.id
  igw_id             = data.aws_internet_gateway.default.id
  cidr_block         = "10.0.2.0/24"
  availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

module "security_group" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name                = "${var.project_name}-sg"
  vpc_id              = data.aws_vpc.default.id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"

  name            = "${var.project_name}-alb"
  vpc_id          = data.aws_vpc.default.id
  subnets         = module.subnets.public_subnet_ids
  security_groups = [module.security_group.this_security_group_id]

  target_groups = [
    {
      name        = "${var.project_name}-tg"
      port        = 80
      protocol    = "HTTP"
      target_type = "ip"
      vpc_id      = data.aws_vpc.default.id
      health_check = {
        path    = "/docs"
        port    = "80"
        matcher = "200-399"
      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
}