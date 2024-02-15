// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

resource "aws_organizations_policy" "scp_policy_name" {
  name    = local.scp_name
  type = "SERVICE_CONTROL_POLICY"
  content = file(var.json_file)
}

resource "aws_organizations_policy_attachment" "scp_apply" {
  for_each  = toset(var.ou_list)
  policy_id = aws_organizations_policy.scp_policy_name.id
  target_id = each.value
}

