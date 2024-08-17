# terraform-aws-iam-user

<!--toc:start-->
- [terraform-aws-iam-user](#terraform-aws-iam-user)
  - [Overview](#overview)
  - [Usage](#usage)
  - [Required Permissions](#required-permissions)
  - [Terraform Docs](#terraform-docs)
<!--toc:end-->

## Overview
Terraform module to create AWS IAM user with access keys and attached policies.

## Usage
```hcl
module "example-user" {
  source    = "github.com/adegoodyer/terraform-aws-iam-user"
  username  = "example"
	description = "This user has access to specific S3 buckets."
  permissions = [
    "s3:GetObject",
    "s3:PutObject",
    "s3:ListBucket"
  ]
  resources = [
    "arn:aws:s3:::example-bucket-name-unique",
    "arn:aws:s3:::example-bucket-name-unique/*"
  ]
}

output "aws_access_key_id" {
  value = module.example_user.aws_access_key_id
}

output "aws_secret_access_key" {
  value     = module.example_user.aws_secret_access_key
  sensitive = true
}

output "username" {
  value = module.example_user.username
}
```

## Required Permissions
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "iam:AttachUserPolicy",
                "iam:CreateAccessKey",
                "iam:CreatePolicy",
                "iam:CreateUser",
                "iam:DeleteAccessKey",
                "iam:DeletePolicy",
                "iam:DeleteUser",
                "iam:DetachUserPolicy",
                "iam:GetPolicy",
                "iam:GetUser",
                "iam:GetPolicyVersion",
                "iam:ListAccessKeys",
                "iam:ListEntitiesForPolicy",
                "iam:ListPolicyVersions",
                "iam:ListGroupsForUser",
                "iam:TagUser"
            ],
            "Resource": "*"
        }
    ]
}
```

## Terraform Docs
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
