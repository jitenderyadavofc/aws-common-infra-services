#IPAM Module
module "ipam" {
  source       = "./modules/ipam"
  ipam_regions = var.ipam_regions
  environment  = var.environment
}



#VPC Module

module "len-net-vpc-mod" {
  source    = "./modules/vpc"
  tag_names = var.tags

  for_each = var.resources

  vpc_name = each.value.vpc_name
  sn_name  = each.value.sn_name

  depends_on = [module.ipam]
}




#tgw module

module "len-tgw-mod" {
    source = "./modules/tgw"
     tags = var.tags
  
}

# module "len-tgw-attachment-mod" {
#     source="./modules/tgw-attachments"
#     vpc_ids =   module.len-net-vpc-mod.vpc_ids
#     subnet_ids = module.len-net-vpc-mod.subnet_ids
# }
