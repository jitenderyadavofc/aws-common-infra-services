

resource "aws_flow_log" "len-vpc-flow-logs" {
 for_each = var.resources
  vpc_id=var.vpc_details[each.key].id 
  log_destination = aws_cloudwatch_log_group.len-aws-cloudwatch.arn
  traffic_type    = "ALL"
  iam_role_arn    = aws_iam_role.len-vpc-flow-logs-role.arn

  tags = merge( 
     {"Name"="flow_logs-${var.vpc_details[each.key].id}"},
    {
     
     for key1,value1 in var.tag_names:  
        key1=>value1
        
        })


}

resource "aws_cloudwatch_log_group" "len-aws-cloudwatch" {
  name = "len-aws-cloudwatch-log-group"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "len-vpc-flow-logs-role" {
  name               = "len-vpc-flow-logs-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "len-policy-permission" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "len-policy-attch" {
  name   = "len-policy-attch"
  role   = aws_iam_role.len-vpc-flow-logs-role.id
  policy = data.aws_iam_policy_document.len-policy-permission.json
}

