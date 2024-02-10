
resource "aws_organizations_policy" "rs-policy" {
  name    = local.scp_name
  type = "TAG_POLICY"
  content = file(var.json_file)
}

resource "aws_organizations_policy_attachment" "rs-policy-attachment" {
  for_each  = toset(var.ou_list)
  policy_id = aws_organizations_policy.rs-policy.id
  target_id = each.value
}

