output "aws_access_key_id" {
  value = aws_iam_access_key.this.id
}

output "aws_secret_access_key" {
  value     = aws_iam_access_key.this.secret
  sensitive = true
}

output "username" {
  value = aws_iam_user.this.name
}

