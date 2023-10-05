data "aws_caller_identity" "current" {}

resource "aws_codestarnotifications_notification_rule" "events" {
  detail_type    = "FULL"
  event_type_ids = var.event_type_ids

  name     = var.codepipeline_name
  resource = "arn:aws:codepipeline:${var.region}:${data.aws_caller_identity.current.account_id}:${var.codepipeline_name}"

  target {
    address = var.aws_sns_topic_arn
  }
}
