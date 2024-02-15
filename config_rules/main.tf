
module "len-config-rc-mod" {
  source = "./modules/config_rc"

}

module "len-config-rule-mod" {
  source            = "./modules/config_rules"
  for_each          = var.config_rules_list
  config_rule_name  = "CONFIG_RULE-${upper(each.key)}"
  source_identifier = upper(replace(each.key, "-", "_"))
  parameters        = each.value.input_params ? each.value.parameters : null
  input_params      = each.value.input_params


  depends_on = [module.len-config-rc-mod]
}

