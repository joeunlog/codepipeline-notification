data "aws_iam_policy_document" "chatbot_sns" {
  version   = "2012-10-17"
  policy_id = "ChatBotSns"
  statement {
    sid       = "AllowSnsPublish"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["sns:Publish"]
    principals {
      identifiers = ["events.amazonaws.com"]
      type        = "Service"
    }
  }

  statement {
    sid    = "AllowSnsFullAccessOnTopic"
    effect = "Allow"
    actions = [
      "sns:GetTopicAttributes",
      "sns:SetTopicAttributes",
      "sns:AddPermission",
      "sns:RemovePermission",
      "sns:DeleteTopic",
      "sns:Subscribe",
      "sns:ListSubscriptionsByTopic",
      "sns:Publish",
      "sns:Receive"
    ]
    resources = ["arn:aws:sns:*:*:${var.project}-${var.env}-codepipeline-notification"]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
  }
}

resource "aws_sns_topic" "chatbot" {
  name   = "${var.project}-${var.env}-codepipeline-notification"
  policy = data.aws_iam_policy_document.chatbot_sns.json
}

output "aws_sns_topic_arn" {
  value = aws_sns_topic.chatbot.arn
}