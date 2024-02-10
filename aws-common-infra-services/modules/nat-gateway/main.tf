
resource "aws_nat_gateway" "len-aws-nat-gateway" {
     for_each = { for i,k in var.resources : 
                    i=>k if k.nat_gw}
     subnet_id=var.subnet_details[each.key].id               
     allocation_id = "eipalloc-096353826221231e1"
     tags = merge( 
     {"Name"="len-nat-gw-${each.value.sn_name}"},
     {
      for key1,value1 in var.tag_names:  
        key1=>value1}
    )
}


output "nat-gw-output" {
  value = aws_nat_gateway.len-aws-nat-gateway
}