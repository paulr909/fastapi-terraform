resource "aws_cloudwatch_log_group" "fastapi-app-log-group" {
  name              = "/ecs/${var.environment_name}"
  retention_in_days = var.log_retention_in_days
}

resource "aws_cloudwatch_log_stream" "fastapi-app-log-stream" {
  name           = "${var.environment_name}-app-log-stream"
  log_group_name = aws_cloudwatch_log_group.fastapi-app-log-group.name
}