
### Stateful Inspection for denying access to a domain

resource "aws_networkfirewall_rule_group" "len-aws-fw-rule-group1" {
  capacity = 100
  name     = "len-aws-fw-rule-group-01"
  type     = "STATEFUL"
  rule_group {
    rules_source {
      rules_source_list {
        generated_rules_type = "DENYLIST"
        target_types         = ["HTTP_HOST"]
        targets              = ["docs.google.com"]
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


output "rule_group1_output" {
  value = aws_networkfirewall_rule_group.len-aws-fw-rule-group1
}

##########Stateful Inspection for permitting packets from a source IP address

resource "aws_networkfirewall_rule_group" "len-aws-fw-rule-group2" {
  capacity    = 50
  description = "Permits http traffic from source"
  name        = "len-aws-fw-rule-group-02"
  type        = "STATEFUL"
  rule_group {
    rules_source {
      dynamic "stateful_rule" {
        for_each = local.ips
        content {
          action = "PASS"
          header {
            destination      = "ANY"
            destination_port = "ANY"
            protocol         = "HTTP"
            direction        = "ANY"
            source_port      = "ANY"
            source           = stateful_rule.value
          }
          rule_option {
            keyword  = "sid"
            settings = ["1"]
          }
        }
      }
    }
  }

  tags = merge( 
     {"Name"="len-aws-fw-rule-group-02"},
     {
      for key1,value1 in var.tag_names:  
        key1=>value1}
    )
}

locals {
  ips = ["1.1.1.1/32"]
}

output "rule_group2_output" {
  value = aws_networkfirewall_rule_group.len-aws-fw-rule-group2
}

#####Stateful Inspection for blocking packets from going to an intended destination

resource "aws_networkfirewall_rule_group" "len-aws-fw-rule-group3" {
  capacity = 100
  name     = "len-aws-fw-rule-group-03"
  type     = "STATEFUL"
  rule_group {
    rules_source {
      stateful_rule {
        action = "DROP"
        header {
          destination      = "124.1.1.24/32"
          destination_port = 53
          direction        = "ANY"
          protocol         = "TCP"
          source           = "1.2.3.4/32"
          source_port      = 53
        }
        rule_option {
          keyword  = "sid"
          settings = ["1"]
        }
      }
    }
  }
   tags = merge( 
     {"Name"="len-aws-fw-rule-group-03"},
     {
      for key1,value1 in var.tag_names:  
        key1=>value1}
    )
}

output "rule_group3_output" {
  value = aws_networkfirewall_rule_group.len-aws-fw-rule-group3
}