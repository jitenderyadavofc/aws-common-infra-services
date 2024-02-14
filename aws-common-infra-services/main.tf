locals {
  tgw_id = module.len-tgw-mod.tgw-id.id
}


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


  resources = var.resources

  depends_on = [module.ipam]
}


output "vpcids" {
  value = module.len-net-vpc-mod.vpc_ids
}

# locals {
#   xyz={ for i,k in module.len-net-vpc-mod.vpc_ids:
#        i=>k.tags.Name
#   }
# }

# output "local-output" {
#   value = local.xyz
# }

module "len-net-flow-logs-mod" {
  source    = "./modules/flow_logs"
  tag_names   = var.tags
  vpc_details = module.len-net-vpc-mod.vpc_ids
  resources   = var.resources



  depends_on = [module.ipam, module.len-net-vpc-mod]
}

module "len-net-subnet-mod" {
  source      = "./modules/subnets"
  tag_names   = var.tags
  vpc_details = module.len-net-vpc-mod.vpc_ids
  resources   = var.resources


  depends_on = [module.ipam, module.len-net-vpc-mod]
}

output "subnetids" {
  value = module.len-net-subnet-mod.subnetids
}


module "len-net-igw-mod" {
  source = "./modules/internet-gateway"

  tag_names   = var.tags
  vpc_details = module.len-net-vpc-mod.vpc_ids
  resources   = var.resources
  depends_on  = [module.ipam, module.len-net-vpc-mod]
}

output "igw-output" {
  value = module.len-net-igw-mod.igws-ids
}
#tgw module

module "len-tgw-mod" {
  source = "./modules/tgw"
  tags   = var.tags

}

output "tgw-output" {
  value = module.len-tgw-mod.tgw-id
}


module "len-tgw-attachment-mod" {
  source         = "./modules/tgw-attachments"
  tag_names      = var.tags
  tgw_id         = local.tgw_id
  subnet_details = module.len-net-subnet-mod.subnetids
  resources      = var.resources

  depends_on = [module.len-tgw-mod]
}

output "tgwa-output" {
  value = module.len-tgw-attachment-mod.tgwa-output
}


# module "len-nat-gateway-mod" {
#   source         = "./modules/nat-gateway"
#   tag_names      = var.tags
#   subnet_details = module.len-net-subnet-mod.subnetids
#   resources      = var.resources


# }

# output "nat-gw-output" {
#   value = module.len-nat-gateway-mod.nat-gw-output
# }

########################### FIREWALL #######################################

module "len-aws-network-firewall" {
  source = "./modules/network-firewall/firewall"

  tag_names      = var.tags

  subnet_details = module.len-net-subnet-mod.subnetids
  resources      = var.resources
  fw_policy_details=module.len-aws-fw-policy-mod.fw_policy-output

  depends_on = [ module.len-net-subnet-mod, module.len-aws-fw-policy-mod]
  
}

output "len-aws-fw-output" {
  value = module.len-aws-network-firewall.fw-output
}

module "len-aws-fw-policy-mod" {
  source = "./modules/network-firewall/policy"
  
  tag_names      = var.tags

  rule_group1_details = local.fw_rule_group1-output
  rule_group2_details = local.fw_rule_group2-output
  rule_group3_details = local.fw_rule_group3-output


  depends_on = [module.len-aws-fw-rule-group-mod]
  
}

output "fw_policy_output" {
  value = module.len-aws-fw-policy-mod.fw_policy-output
}





module "len-aws-fw-rule-group-mod" {
  source = "./modules/network-firewall/rule-group"
  tag_names      = var.tags

  depends_on = [module.len-tgw-mod]
  
}

locals{ 
  fw_rule_group1-output=module.len-aws-fw-rule-group-mod.rule_group1_output.arn
  fw_rule_group2-output=module.len-aws-fw-rule-group-mod.rule_group2_output.arn
  fw_rule_group3-output=module.len-aws-fw-rule-group-mod.rule_group3_output.arn
}


