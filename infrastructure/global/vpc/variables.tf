variable "region" {
  description = "AWS region"
  default     = "eu-west-2"
  type        = string
}

variable "project_name" {
  description = "Project (Generic name used across this project)"
  default     = "fastapi-app"
  type        = string
}

variable "availability_zone" {
  default = "eu-west-2a"
  type    = string
}

variable "vpc_state_username" {
  type        = string
  description = "Username to access VPC's terraform state"
}
variable "vpc_state_password" {
  type        = string
  sensitive   = true
  description = "Password to access VPC's terraform state"
}

# networking

variable "public_subnet_1_cidr" {
  description = "CIDR Block for Public Subnet 1"
  default     = "10.0.1.0/24"
}
variable "public_subnet_2_cidr" {
  description = "CIDR Block for Public Subnet 2"
  default     = "10.0.2.0/24"
}
variable "private_subnet_1_cidr" {
  description = "CIDR Block for Private Subnet 1"
  default     = "10.0.3.0/24"
}
variable "private_subnet_2_cidr" {
  description = "CIDR Block for Private Subnet 2"
  default     = "10.0.4.0/24"
}
variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}
