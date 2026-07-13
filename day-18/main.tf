resource "aws_iam_policy" "iam_policy" {
  name = var.iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Resource = "*"
        Action = [
          "ec2:Describe*",
          "ec2:List*",
          "ec2:Get*",
        ]
      },
    ]
  })
}