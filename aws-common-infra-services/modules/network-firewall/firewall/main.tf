

resource "aws_networkfirewall_firewall" "len-aws-network-firewall" {
  name                = "len-aws-firewall-main-01"
  delete_protection   =  true
#  aws_availability_zones=["us-east-1a","us-east-1b"]
  for_each = { for i,k in var.resources:
                  i=>k if k.firewall}
  firewall_policy_arn = tostring(var.fw_policy_details.arn)
  vpc_id              = var.subnet_details[each.key].vpc_id
  subnet_mapping {
    subnet_id = var.subnet_details[each.key].id
  } 



  
  timeouts {
    create = "40m"
    update = "50m"
    delete = "1h"
  }

   tags = merge( 
     {"Name"="len-aws-firewall-main-01"},
     {
      for key1,value1 in var.tag_names:  
        key1=>value1}
    )
}


output "fw-output" {
  value = aws_networkfirewall_firewall.len-aws-network-firewall
}