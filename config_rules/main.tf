
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

resource "aws_config_config_rule" "approved-amis-by-tag" {
  name        = upper("config_rule-approved-amis-by-tag")
  description = "Checks whether running instances are using specified AMIs. Running instances that dont have at least one of the specified tags are noncompliant"

  source {
    owner             = "AWS"
    source_identifier = "APPROVED_AMIS_BY_TAG"
  }

  input_parameters = jsonencode({
    "amisByTagKeyAndValue" = {
      "approvedAmiLinux"       = "amazonLinux",
      "approvedAmiLinux2"      = "amazonLinux2",
      "approvedAmiUbuntu20.04" = "Ubuntu20.04",
      "approvedAmiUbuntu22.04" = "Ubuntu22.04"
    }
  })
}