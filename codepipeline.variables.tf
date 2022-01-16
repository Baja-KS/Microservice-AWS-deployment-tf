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

variable "codebuild_project_name" {
  type    = string
  default = "example_project"
}

variable "codebuild_project_desc" {
  type    = string
  default = "example_codebuild_project"
}

variable "repo_owner" {
  type = string
}

variable "repo" {
  type = string
}

variable "branch" {
  type    = string
  default = "master"
}

variable "pipeline_name" {
  type    = string
  default = "pipeline"
}