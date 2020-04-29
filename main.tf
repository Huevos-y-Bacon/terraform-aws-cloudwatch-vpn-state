provider "aws" {
  region = var.region
}

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
  alarm_actions       = var.alarm_actions
  ok_actions          = var.ok_actions

  dimensions {
    VpnId = var.aws_vpn_connection_id
  }

  tags = {
    Terraform = "true"
  }
}
