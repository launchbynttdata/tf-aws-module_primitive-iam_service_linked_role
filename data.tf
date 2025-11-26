data "aws_iam_roles" "all" {}

data "aws_iam_role" "existing" {
  count = local.role_exists ? 1 : 0
  name  = local.expected_role_name
}
