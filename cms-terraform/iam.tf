resource "aws_iam_user" "strapi_service_user" {
  name = "strapi-service-user"
}

resource "aws_iam_access_key" "strapi_service_access_key" {
  user = aws_iam_user.strapi_service_user.name
}

data "aws_iam_policy_document" "strapi_service_policy" {
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject", "s3:GetObject", "s3:DeleteObject"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "strapi_s3_policy" {
  name   = "StrapiServiceAccess"
  user   = aws_iam_user.strapi_service_user.name
  policy = data.aws_iam_policy_document.strapi_service_policy.json
}

