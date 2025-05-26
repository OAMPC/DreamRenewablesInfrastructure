resource "aws_iam_user" "server_service_user" {
  name = "server-service-user"
}

resource "aws_iam_access_key" "server_service_access_key" {
  user = aws_iam_user.server_service_user.name
}

resource "aws_iam_user_policy" "server_ses_policy" {
  name   = "ServerSESAccess"
  user   = aws_iam_user.server_service_user.name
  policy = data.aws_iam_policy_document.server_ses_policy.json
}

data "aws_iam_policy_document" "server_ses_policy" {
  statement {
    sid    = "AllowSendEmail"
    effect = "Allow"
    actions = [
      "ses:SendEmail",
      "ses:SendRawEmail"
    ]
    resources = ["*"]
  }
}