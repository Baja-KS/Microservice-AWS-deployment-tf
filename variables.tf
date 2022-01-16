variable "bucket_name" {
  type    = string
  default = "example-bucket"
}

variable "env" {
  type    = string
  default = "development"
}

variable "ecr_repo" {
  type = string
}

variable "github_token" {
  type      = string
  sensitive = true
}