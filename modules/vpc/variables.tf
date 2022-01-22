variable "aws_access_key_id" {
  type      = string
  sensitive = true
}

variable "aws_secret_access_key" {
  type      = string
  sensitive = true
}

variable "aws_region" {
  type = string
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "pub_subnet_cidr" {
  type    = string
  default = "10.0.0.0/24"
} 
variable "pub_subnet2_cidr" {
  type    = string
  default = "10.0.1.0/24"
} 