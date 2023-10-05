data "aws_iam_policy_document" "assume" {
  version = "2012-10-17"
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      identifiers = ["chatbot.amazonaws.com"]
      type        = "Service"
    }
    effect = "Allow"
  }
}

resource "aws_iam_role" "chatbot" {
  name               = "${var.project}-${var.env}-chatbot-role"
  assume_role_policy = data.aws_iam_policy_document.assume.json
}

data "aws_iam_policy_document" "chatbot" {
  statement {
    effect = "Allow"
    actions = [
      "logs:*",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "chatbot" {
  name        = "${var.project}-${var.env}-chatbot-policy"
  policy      = data.aws_iam_policy_document.chatbot.json
}

resource "aws_iam_role_policy_attachment" "chatbot" {
  role       = aws_iam_role.chatbot.name
  policy_arn = aws_iam_policy.chatbot.arn
}

output "chatbot_iam_role_arn" {
  value = aws_iam_role.chatbot.arn
}