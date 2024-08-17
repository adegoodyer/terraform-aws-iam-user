# terraform-aws-iam-user

<!--toc:start-->
- [terraform-aws-iam-user](#terraform-aws-iam-user)
  - [Overview](#overview)
  - [Usage](#usage)
  - [Retrieve Secret Access Key](#retrieve-secret-access-key)
  - [Required Permissions](#required-permissions)
- [Terraform Docs](#terraform-docs)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Modules](#modules)
  - [Resources](#resources)
  - [Inputs](#inputs)
  - [Outputs](#outputs)
<!--toc:end-->

## Overview
Terraform module to create AWS IAM user with access keys and attached policies.

> Use roles (and OIDC) where possible, however unavoidable in certain situations.

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

## Retrieve Secret Access Key
```bash
# cli
tf output --raw aws_secret_access_key

# also held in tf state file
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

# Terraform Docs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.63.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description for the IAM user | `string` | n/a | yes |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | List of actions the user is allowed to perform | `list(string)` | n/a | yes |
| <a name="input_resources"></a> [resources](#input\_resources) | List of resources the policy applies to | `list(string)` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Name of the IAM user | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_access_key_id"></a> [aws\_access\_key\_id](#output\_aws\_access\_key\_id) | n/a |
| <a name="output_aws_secret_access_key"></a> [aws\_secret\_access\_key](#output\_aws\_secret\_access\_key) | n/a |
| <a name="output_username"></a> [username](#output\_username) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
