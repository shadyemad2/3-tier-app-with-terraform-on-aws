# monitoring for rds
resource "aws_cloudwatch_metric_alarm" "rds_cpu_high" {
  alarm_name          = "${var.project_name}-rds-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "RDS instance CPU > 80%"
  dimensions = {
    DBInstanceIdentifier = var.rds_identifier
  }
  alarm_actions = [aws_sns_topic.alert_topic.arn]
  ok_actions = [ aws_sns_topic.alert_topic.arn ]
}

resource "aws_sns_topic" "alert_topic" {
  name = "${var.project_name}-alerts"
  tags = {
    Name = "${var.project_name}-alerts"
  }
}
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alert_topic.arn
  protocol  = "email"
  endpoint  = var.email_address
}
