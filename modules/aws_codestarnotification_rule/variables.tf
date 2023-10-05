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

variable "codepipeline_name" {
  type = string
  default = ""
  description = "code pipeline name"
}

variable "event_type_ids" {
  type = list(string)
  default = [
    "codepipeline-pipeline-pipeline-execution-failed",
    "codepipeline-pipeline-pipeline-execution-started",
    "codepipeline-pipeline-pipeline-execution-succeeded"
  ]
}

variable "aws_sns_topic_arn" {
  type = string
  default = ""
  description = "slack workspace id"
}