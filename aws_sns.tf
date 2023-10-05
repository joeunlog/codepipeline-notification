module "aws_sns" {
  source = "./modules/aws_sns"

  project = var.project
  env = var.env
}