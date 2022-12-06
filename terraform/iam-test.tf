resource "aws_iam_policy" "policy_resource_fail" {
  name        = "policy with *"
  path        = "/"
  description = "policy with *"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:ec2:*"
      },
      {
        Action = [
          "s3:*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::some_bucket"
      }
    ]
  })
  tags = {
    git_commit           = "998fa380a0b13b29df92d8edf55693d57e9a660b"
    git_file             = "terraform/iam-test.tf"
    git_last_modified_at = "2022-10-26 12:53:34"
    git_last_modified_by = "mroberts@paloaltonetworks.com"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "5c3c5011-041d-487a-a6e6-3072edc7b5e6"
  }
}

resource "aws_iam_policy" "policy_resource_pass" {
  name        = "policy with *"
  path        = "/"
  description = "policy with *"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:ec2:us-east-1:etcetc"
      },
      {
        Action = [
          "s3:*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::some_bucket"
      }
    ]
  })
  tags = {
    git_commit           = "998fa380a0b13b29df92d8edf55693d57e9a660b"
    git_file             = "terraform/iam-test.tf"
    git_last_modified_at = "2022-10-26 12:53:34"
    git_last_modified_by = "mroberts@paloaltonetworks.com"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "e56108da-6d0e-4e78-8fc5-f3f2567ffed9"
  }
}

data "aws_iam_policy_document" "policy_data_fail" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
    ]
  }
}

data "aws_iam_policy_document" "policy_data_pass" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
    ]
  }
}