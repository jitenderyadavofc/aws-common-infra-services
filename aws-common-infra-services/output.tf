output "vpcids" {
  value = module.len_net_vpc_mod.vpc_ids
}

output "subnetids" {
  value = module.len_net_subnet_mod.subnetids
}

output "igw-output" {
  value = module.len_net_igw_mod.igws-ids
}

output "tgw-output" {
  value = module.len_tgw_mod.tgw-id
}

output "tgwa-output" {
  value = module.len_tgw_attachment_mod.tgwa-output
}

output "len-aws-fw-output" {
  value = module.len_aws_network_firewall.fw-output
}


output "fw_policy_output" {
  value = module.len_aws_fw_policy_mod.fw_policy-output
}
