
module "scp_mod" {
  source    = "./modules/scp"
  for_each  = fileset(path.root, "policies/scp_policies/*.json")
  json_file = each.value
  ou_list   = var.sandbox_ou
}

module "tags_mod" {
  source    = "./modules/tags"
  for_each  = fileset(path.root, "policies/tags_policies/*.json")
  json_file = each.value
  ou_list   = var.sandbox_ou
}