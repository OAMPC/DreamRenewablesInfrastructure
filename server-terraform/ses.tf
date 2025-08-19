resource "aws_ses_email_identity" "alex_test_email" {
  email = "alexanderpope27@gmail.com"
}

resource "aws_ses_email_identity" "noreply_email" {
  email = "noreply@dreamrenewables.org"
}

resource "aws_ses_domain_identity" "dr_domain" {
  domain = "dreamrenewables.org"
}

resource "aws_ses_domain_dkim" "dkim" {
  domain = aws_ses_domain_identity.dr_domain.domain
}