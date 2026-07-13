data "aws_iam_policy" "iam_policy" {
  name = var.iam_policy_name
}

resource "aws_iam_user_policy_attachment" "attachment" {
  user       = var.iam_user_name
  policy_arn = data.aws_iam_policy.iam_policy.arn
}