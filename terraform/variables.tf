variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1" # אפשר לשנות לפי מה שתרצה
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "flask-eks"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}
