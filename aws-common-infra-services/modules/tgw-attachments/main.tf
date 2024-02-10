resource "aws_ec2_transit_gateway_vpc_attachment" "len-aws-tgwa-pd" {
  for_each = var.resources
  transit_gateway_id = var.tgw_id
   vpc_id             = var.subnet_details[each.key].vpc_id
   subnet_ids     =   [var.subnet_details[each.key].id]

   tags = merge( 
     {"Name"="tgwa-${each.value.vpc_name}"},
     {
      for key1,value1 in var.tag_names:  
        key1=>value1}
      )
}

output "tgwa-output" {
  value = aws_ec2_transit_gateway_vpc_attachment.len-aws-tgwa-pd
}