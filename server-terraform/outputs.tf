output "ses_verification_token" {
  value = aws_ses_domain_identity.dr_domain.verification_token
}

output "dkim_tokens" {
  value = aws_ses_domain_dkim.dkim.dkim_tokens
}