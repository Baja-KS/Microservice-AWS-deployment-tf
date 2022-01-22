terraform {
  backend "s3" {
    bucket = "tf-states-bajaks"
    key    = "WebshopAPI-AuthMS/terraform.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  profile    = "default"
  region     = var.aws_region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
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


module "vpc" {
  source                = "../../modules/vpc"
  aws_region            = var.aws_region
  aws_access_key_id     = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
}

module "alb" {
  source                = "../../modules/lb"
  aws_region            = var.aws_region
  aws_access_key_id     = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  vpc_id                = module.vpc.vpc_id
  subnet_id             = module.vpc.subnet_id
  subnet2_id            = module.vpc.subnet2_id
}

module "api_gateway" {
  source                = "../../modules/api-gateway"
  aws_region            = var.aws_region
  aws_access_key_id     = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  lb_url                = module.alb.lb_dns
}

resource "aws_ecs_cluster" "foo" {
  name = "test-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}





resource "aws_network_interface" "eth" {
  subnet_id   = module.vpc.subnet_id
  private_ips = ["10.0.0.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "test" {
  ami           = "ami-0015a39e4b7c0966f" # us-west-2
  instance_type = "t2.micro"


  network_interface {
    network_interface_id = aws_network_interface.eth.id
    device_index         = 0
  }


}



