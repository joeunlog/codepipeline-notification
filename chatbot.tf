module "chatbot" {
  source = "./modules/chatbot"

  project = var.project
  env = var.env
  region = var.region

  slackWorkspaceId = var.slackWorkspaceId
  slackChannelId = var.slackChannelId

  aws_sns_topic_arn = module.aws_sns.aws_sns_topic_arn
}