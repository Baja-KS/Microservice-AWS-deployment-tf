resource "aws_codebuild_project" "project" {
  name          = var.codebuild_project_name
  description   = var.codebuild_project_desc
  build_timeout = "5"
  service_role  = aws_iam_role.pipeline_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  cache {
    type     = "S3"
    location = aws_s3_bucket.bucket.bucket
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:2.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      status              = "ENABLED"
      location            = "${aws_s3_bucket.bucket.id}/build-log"
      encryption_disabled = true
    }
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/${var.repo_owner}/${var.repo}.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }

  source_version = var.branch

}