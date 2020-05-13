variable "region" {
  type        = string
  default     = "eu-central-1"
  description = "Name of the Aws Region"
}

variable "alarm_name" {
  type        = string
  default     = ""
  description = "Name of the Alarm"
}

variable "alarm_description" {
  type        = string
  default     = ""
  description = "The description for the alarm."
}

#GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. 
#Additionally, the values LessThanLowerOrGreaterThanUpperThreshold, LessThanLowerThreshold, and GreaterThanUpperThreshold
variable "comparison_operator" {
  type        = string
  default     = "LessThanOrEqualToThreshold"
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold."
}

variable "evaluation_periods" {
  type        = number
  default     = "1"
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "metric_name" {
  type        = string
  default     = "TunnelState"
  description = "The name for the alarm's associated metric."
}

variable "namespace" {
  type        = string
  default     = "AWS/VPN"
  description = "The namespace for the alarm's associated metric."
}

variable "period" {
  type        = number
  default     = "120"
  description = "The period in seconds over which the specified statistic is applied."
}

variable "statistic" {
  type        = string
  default     = "Maximum"
  description = "The statistic to apply to the alarm's associated metric."
}

variable "threshold" {
  type        = number
  default     = "0"
  description = "The value against which the specified statistic is compared."
}

variable "actions_enabled" {
  type        = bool
  default     = true
  description = "Indicates whether or not actions should be executed during any changes to the alarm's state."
}

//variable "alarm_actions" {
//  type        = list
//  default     = ["aws_sns_topic.sns_topic.arn"]
//  description = "The list of actions to execute when this alarm transitions into an alarm state from any other state"
//}
//
//variable "ok_actions" {
//  type        = list
//  default     = ["aws_sns_topic.sns_topic.arn"]
//  description = "The list of actions to execute when this alarm transitions into an OK state from any other state."
//}

variable "aws_vpn_connection_id" {
  type        = string
  default     = ""
  description = "VPN connection id to be monitored "
}

####
# SNS Topic Variables
####

variable "sns_topic_name" {
  type        = string
  default     = "VpnTopic"
  description = "Name of the sns topic"
}
variable "sns_topic_display_name" {
  type        = string
  default     = "VpnTopic"
  description = "Display name of SNS topic"
}
variable "sns_topic_subscriber" {
  type        = string
  default     = ""
  description = "Subscriber Email ID"
}
