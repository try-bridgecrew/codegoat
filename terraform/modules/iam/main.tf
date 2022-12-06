data "aws_iam_policy_document" "example-policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_role" "admin-role" {
  name                = "${var.environment}_admin_role"
  assume_role_policy  = data.aws_iam_policy_document.example-policy.json # (not shown)
  managed_policy_arns = []
  tags = {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/iam/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "6b7b8033-6e0a-482d-acc4-05584f723771"
  }
}
