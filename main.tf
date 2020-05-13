resource "aws_cloudwatch_metric_alarm" "vpn_state_alarm" {
  alarm_name          = var.alarm_name
  alarm_description   = var.alarm_description
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  actions_enabled     = var.actions_enabled
  alarm_actions       = [aws_sns_topic.sns_topic.arn]
  ok_actions          = [aws_sns_topic.sns_topic.arn]

  dimensions = {
    VpnId = var.aws_vpn_connection_id
  }

  tags = {
    Terraform = true
    Name      = var.alarm_name
  }
}

resource "aws_sns_topic" "sns_topic" {
  name         = var.sns_topic_name
  display_name = var.sns_topic_display_name

  tags = {
    Terraform = true
    Name      = var.sns_topic_name
  }
  #The provisioner that calls the AWS CLI command does not use the credentials in TF - it uses the ones configured against your CLI.
  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint ${var.sns_topic_subscriber}"
  }
}
