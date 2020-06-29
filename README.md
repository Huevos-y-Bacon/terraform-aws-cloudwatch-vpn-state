# Terraform Module for enabling VPN state Monitoring

A CloudWatch Alarm that triggers when the state of one or both tunnels in an AWS VPN connection are down.

CloudWatch Alarm is configured per VPN connection, which is set as an alarm dimension. Provide the VPN Connection ID as a variable.

This Module will create a cloudwatch alarm with AWS VPN and also create one SNS topic with email subscription. You need to manually subscribe to the topic.

## How to use

```yaml
module "cloudwatch_vpn_state" {
  source                = "git::ssh://git@github.com:jobin-james/cloudwatch_vpn_state.git?ref=master"
  alarm_name            = var.alarm_name
  alarm_description     = var.alarm_description
  comparison_operator   = var.comparison_operator
  evaluation_periods    = var.evaluation_periods
  metric_name           = var.metric_name
  namespace             = var.namespace
  period                = var.period
  statistic             = var.statistic
  threshold             = var.threshold
  actions_enabled       = var.actions_enabled
  aws_vpn_connection_id = var.aws_vpn_connection_id

  sns_topic_name         = var.sns_topic_name
  sns_topic_display_name = var.sns_topic_display_name
}
```
