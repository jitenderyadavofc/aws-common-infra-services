
#IPAM Module
module "ipam" {
  source       = "./modules/ipam"
  ipam_regions = var.ipam_regions
  environment  = var.environment
}



#VPC Module

module "len_net_vpc_mod" {
  source    = "./modules/vpc"
  tag_names = var.tags


  resources = var.resources

  depends_on = [module.ipam]
}


#vpc flow logs module

module "len_net_flow_logs_mod" {
  source    = "./modules/flow_logs"
  tag_names   = var.tags
  vpc_details = module.len_net_vpc_mod.vpc_ids
  resources   = var.resources

  depends_on = [module.ipam, module.len_net_vpc_mod]
}

#subnet module

module "len_net_subnet_mod" {
  source      = "./modules/subnets"
  tag_names   = var.tags
  vpc_details = module.len_net_vpc_mod.vpc_ids
  resources   = var.resources


  depends_on = [module.ipam, module.len_net_vpc_mod]
}

#internet gateway module

module "len_net_igw_mod" {
  source = "./modules/internet-gateway"

  tag_names   = var.tags
  vpc_details = module.len_net_vpc_mod.vpc_ids
  resources   = var.resources
  depends_on  = [module.ipam, module.len_net_vpc_mod]


}


#tgw module

module "len_tgw_mod" {
  source = "./modules/tgw"
  tags   = var.tags

}

module "len_tgw_attachment_mod" {
  source         = "./modules/tgw-attachments"
  tag_names      = var.tags
  tgw_id         = local.tgw_id
  subnet_details = module.len_net_subnet_mod.subnetids
  resources      = var.resources

  depends_on = [module.len_tgw_mod, module.len_net_subnet_mod]
}



# module "len-nat-gateway-mod" {
#   source         = "./modules/nat-gateway"
#   tag_names      = var.tags
#   subnet_details = module.len_net_subnet_mod.subnetids
#   resources      = var.resources

#   depends_on=[module.len_net_vpc_mod]
# }

# output "nat-gw-output" {
#   value = module.len-nat-gateway-mod.nat-gw-output
# }

########################### FIREWALL #######################################

#firewall module

module "len_aws_network_firewall" {
  source = "./modules/network-firewall/firewall"

  tag_names      = var.tags

  subnet_details = module.len_net_subnet_mod.subnetids
  resources      = var.resources
  fw_policy_details=module.len_aws_fw_policy_mod.fw_policy-output

  depends_on = [ module.len_net_subnet_mod, module.len_aws_fw_policy_mod]
  
}

#firewall policy module

module "len_aws_fw_policy_mod" {
  source = "./modules/network-firewall/policy"
  
  tag_names      = var.tags

  rule_group1_details = local.fw_rule_group1-output
  rule_group2_details = local.fw_rule_group2-output
  rule_group3_details = local.fw_rule_group3-output


  depends_on = [module.len_aws_fw_rule_group_mod]
  
}

#firewall rule group module

module "len_aws_fw_rule_group_mod" {
  source = "./modules/network-firewall/rule-group"
  tag_names      = var.tags

  
}




