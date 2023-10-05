variable "project" {
  type = string
  default = ""
  description = "project name"
}

variable "env" {
  type = string
  default = ""
  description = "environment"
}

variable "region" {
  type = string
  default = ""
  description = "aws region e.g. ap-northeast-2"
}

variable "slackChannelId" {
  type = string
  default = ""
  description = "slack channel id"
}

variable "slackWorkspaceId" {
  type = string
  default = ""
  description = "slack workspace id"
}

variable "aws_sns_topic_arn" {
  type = string
  default = ""
  description = "slack workspace id"
}
