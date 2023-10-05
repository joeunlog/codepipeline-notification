data "local_file" "template" {
  filename = "${path.module}/template/aws_chatbot_template.yaml"
}

resource "aws_cloudformation_stack" "chatbot" {
  name          = "${var.project}-${var.env}-chatbot-stack"
  template_body = data.local_file.template.content
  parameters = {
    configurationName = "${var.project}-${var.env}-codepipeline-notification"
    roleArn           = aws_iam_role.chatbot.arn
    logLevel          = "INFO"
    slackChannelId    = var.slackChannelId
    slackWorkspaceId  = var.slackWorkspaceId
    snsTopicArn       = var.aws_sns_topic_arn
  }
}