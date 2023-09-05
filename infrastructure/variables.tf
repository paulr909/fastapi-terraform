variable "region" {
  description = "AWS region"
  default     = "eu-west-2"
  type        = string
}

variable "project_name" {
  description = "Project (Generic name used across this project)"
  default     = "fastapi-terraform"
  type        = string
}

variable "availability_zone" {
  default = "eu-west-2a"
  type    = string
}