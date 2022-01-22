resource "aws_lb" "main" {
  name               = "alb-base-test"
  load_balancer_type = "application"
  internal           = true
  subnets            = [var.subnet_id, var.subnet2_id]
}

# adds a tcp listener to the load balancer and allows ingress
resource "aws_lb_listener" "lb80" {
  load_balancer_arn = aws_lb.main.id
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.tg80.id
    type             = "forward"
  }
}

resource "aws_lb_target_group" "tg80" {
  name        = "alb-backend-cluster"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_listener" "lb8080" {
  load_balancer_arn = aws_lb.main.id
  port              = 8080
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.tg8080.id
    type             = "forward"
  }
}

resource "aws_lb_target_group" "tg8080" {
  name        = "alb-backend-cluster-2"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}