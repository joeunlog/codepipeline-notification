module "aws_codestarnotifications_rule" {
  for_each = var.notification_rule
  source = "./modules/aws_codestarnotification_rule"

  project = var.project
  env = var.env
  region = var.region

  codepipeline_name = each.value.codepipeline_name
  event_type_ids = each.value.event_type_ids

  aws_sns_topic_arn = module.aws_sns.aws_sns_topic_arn
}