output "image" {
  value       = aws_ecr_repository.ecr_repo.repository_url
  description = "Full ECR repository url of app image"
}