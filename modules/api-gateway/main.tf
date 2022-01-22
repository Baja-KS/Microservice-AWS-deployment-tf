resource "aws_apigatewayv2_api" "api_gateway" {
  name          = "app-api-gateway"
  protocol_type = "HTTP"
  target        = "http://${var.lb_url}"
}

