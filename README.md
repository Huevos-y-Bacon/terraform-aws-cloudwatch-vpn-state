# Terraform Module for enabling VPN state Monitoring

A CloudWatch Alarm that triggers when the state of both VPN tunnels in an AWS VPN connection are down.

CloudWatch Alarm is configured per VPN connection, which is set as an alarm dimension. Provide the VPN Connection ID as a variable.

Note: Sns topic must be available to configure alarm action

## How to use

```yaml
module "cloudwatch_vpn_state" {
  source                = "git::ssh://git@technetscloud/cloudwatch_vpn_state"
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
  alarm_actions         = [var.alarm_actions]
  ok_actions            = [var.ok_actions]
  aws_vpn_connection_id = var.aws_vpn_connection_id
}
