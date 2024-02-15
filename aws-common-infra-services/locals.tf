# locals {
#   xyz={ for i,k in module.len_net_vpc_mod.vpc_ids:
#        i=>k.tags.Name
#   }
# }

# output "local_output" {
#   value = local.xyz
# }

locals {
 tgw_id = module.len_tgw_mod.tgw-id.id

  fw_rule_group1-output=module.len_aws_fw_rule_group_mod.rule_group1_output.arn
  fw_rule_group2-output=module.len_aws_fw_rule_group_mod.rule_group2_output.arn
  fw_rule_group3-output=module.len_aws_fw_rule_group_mod.rule_group3_output.arn
}
