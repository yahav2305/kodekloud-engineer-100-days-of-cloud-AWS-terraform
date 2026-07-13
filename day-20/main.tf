data "aws_iam_policy" "iam_policy" {
  name = var.iam_policy_name
}

resource "aws_iam_role" "iam_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "sts:AssumeRole"
          ],
          "Principal" : {
            "Service" : [
              "ec2.amazonaws.com"
            ]
          }
        }
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "name" {
  role       = aws_iam_role.iam_role.name
  policy_arn = data.aws_iam_policy.iam_policy.arn
}