data "aws_vpc_ipam_pool" "infra" {
  filter {
    name   = "description"
    values = ["*Infra*"]
  }

  filter {
    name   = "address-family"
    values = ["ipv4"]
  }
}

resource "aws_vpc" "len-network-vpc" {

  for_each = var.resources

  ipv4_ipam_pool_id                = data.aws_vpc_ipam_pool.infra.id
  ipv4_netmask_length              = var.vpc_ipv4_netmask_length
  
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support   = var.vpc_enable_dns_support
  instance_tenancy     = var.vpc_instance_tenancy

  tags = merge( 
     {"Name"=each.value.vpc_name},
    {
     
     for key1,value1 in var.tag_names:  
        key1=>value1
        
        })
 
}

output "len-vpc-ids" {
  value = aws_vpc.len-network-vpc
}




# resource "aws_internet_gateway" "len-network-igw" {
#   vpc_id = aws_vpc.len-network-vpc.id

#    tags = merge( 
#      {"Name"=var.vpc_name},
#     {
     
#      for key1,value1 in var.tag_names:  
#         key1=>value1
        
#         })
# }



  output "vpc_ids" {
    value = aws_vpc.len-network-vpc
  }

  #   output "subnet_ids" {
  #   value = [ aws_subnet.len-network-subnet[*].id ]
  # }



