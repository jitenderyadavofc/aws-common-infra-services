resource "aws_internet_gateway" "len-network-igw" {
     for_each = {for i,k in var.resources :
                       i=>k if k.egress   }
     vpc_id=var.vpc_details[each.key].id 

   tags = merge( 
     {"Name"="IGW_${each.value.vpc_name}"},
    {
     
     for key1,value1 in var.tag_names:  
        key1=>value1
        
        })
}

output "igws-ids" {
  value = aws_internet_gateway.len-network-igw
}