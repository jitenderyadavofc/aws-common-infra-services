resource "aws_networkfirewall_firewall_policy" "len-aws-firewall-policy" {
  name = "len-aws-firewall-policy"

  firewall_policy {
    policy_variables {
      rule_variables {
        key = "HOME_NET"
        ip_set {
          definition = ["10.0.0.0/16", "10.1.0.0/24"]
        }
      }
    }
    stateless_default_actions          = ["aws:pass"]
    stateless_fragment_default_actions = ["aws:drop"]
    # stateful_rule_group_reference {
    #   priority     = 1
    #   resource_arn = "arn:aws:network-firewall:us-east-1:aws-managed:stateful-rulegroup/AbusedLegitBotNetCommandAndControlDomainsStrictOrder"
    # }
  }

  tags = merge( 
     {"Name"="len-aws-firewall-policy"},
     {
      for key1,value1 in var.tag_names:  
        key1=>value1}
    )
}


output "fw_policy-output" {
  value = aws_networkfirewall_firewall_policy.len-aws-firewall-policy
}