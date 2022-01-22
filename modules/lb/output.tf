output "lb_id" {
  value = aws_lb.main.id
}
output "lb_arn" {
  value = aws_lb.main.arn
}
output "lb_dns" {
  value = aws_lb.main.dns_name
}

# output "lb_tg_arn" {
#     value = aws_lb_target_group.main.arn
# }