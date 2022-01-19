terraform {
  backend "s3" {
    bucket = "tf-states-bajaks"
    key    = "WebshopAPI-AuthMS/terraform.tfstate"
    region = "eu-west-2"
  }
}

module "auth-svc-pipeline" {
  source                 = "../../modules/codepipeline"
  ecr_repo               = var.ecr_repo
  bucket_name            = var.bucket_name
  codebuild_project_name = var.codebuild_project_name
  codebuild_project_desc = var.codebuild_project_desc
  repo_owner             = var.repo_owner
  repo                   = var.repo
  branch                 = var.branch
  pipeline_name          = var.pipeline_name
  aws_region             = var.aws_region
  github_token           = var.github_token
  env                    = var.env
  aws_access_key_id      = var.aws_access_key_id
  aws_secret_access_key  = var.aws_secret_access_key
}

