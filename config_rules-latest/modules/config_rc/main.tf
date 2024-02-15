resource "aws_config_configuration_recorder" "len-aws-config-rc" {
  name     = "len-aws-config-rc"
  role_arn = aws_iam_role.len-config-rule-role.arn
}


data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "len-config-rule-role" {
  name               = "len-aws-config-rule-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}