
locals {
  ips = ["1.1.1.1/32", "1.0.0.1/32"]
}

resource "aws_networkfirewall_rule_group" "len-aws-fw-rule-group" {
  capacity = 100
  name     = "len-aws-fw-rule-group-01"
  type     = "STATEFUL"
  rule_group {
    rules_source {
      rules_source_list {
        generated_rules_type = "DENYLIST"
        target_types         = ["HTTP_HOST"]
        targets              = ["test.example.com"]
      }
    }
  }

  
  

  tags = merge( 
     {"Name"="len-aws-fw-rule-group-01"},
     {
      for key1,value1 in var.tag_names:  
        key1=>value1}
    )
}


output "rule_group_output" {
  value = aws_networkfirewall_rule_group.len-aws-fw-rule-group
}