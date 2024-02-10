locals {
  subnet_map= {for i,k in var.resources :
            i=>k.sn_name}
}

resource "aws_subnet" "len-network-subnet" {
  for_each = var.resources
    vpc_id=var.vpc_details[each.key].id 
      cidr_block        = cidrsubnet(var.vpc_details[each.key].cidr_block, 2,2)
      

  #count = length(var.sn_name)
 
  tags = merge( 
     {"Name"=each.value.sn_name},
    {
     
     for key1,value1 in var.tag_names:  
        key1=>value1
        
        })
}

output "subnetids" {
  value = aws_subnet.len-network-subnet
}