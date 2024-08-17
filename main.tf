# define the IAM user
resource "aws_iam_user" "this" {
  name = var.username

  tags = {
    Description = var.description
  }
}

# define the IAM policy
resource "aws_iam_policy" "this" {
  name        = "${var.username}_policy"
  description = "Policy for user ${var.username}"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = var.permissions,
        Resource = var.resources
      }
    ]
  })
}

# attach the policy to the IAM user
resource "aws_iam_policy_attachment" "this" {
  name       = "${var.username}_policy_attachment"
  policy_arn = aws_iam_policy.this.arn
  users      = [aws_iam_user.this.name]
}

# create an access key for the IAM user
resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

