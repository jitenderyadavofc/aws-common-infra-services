
## WORKLOAD OU
module "scp_tag_delete_deny_mod" { # workload generic tags delete scp policy
  source    = "./modules/scp"
  for_each  = fileset(path.root, "policies/scp_policies/scp_len_generic_tag_delete_deny_enforcement.json")
  json_file = each.value
  ou_list   = var.workload_ou_id
}

module "scp_au_tag_mod" { # workload auto update tags create scp policy
  source    = "./modules/scp"
  for_each  = fileset(path.root, "policies/scp_policies/scp_len_au_tag_create_enforcement.json")
  json_file = each.value
  ou_list   = var.workload_ou_id
}

module "tags_auto_update_mod" { # workload auto update tags policy    
  source    = "./modules/tags"
  for_each  = fileset(path.root, "policies/tags_policies/tags_auto_update_policy.json")
  json_file = each.value
  ou_list   = var.workload_ou_id
}

## PROD OU

# module "scp_prod_env_mod" {                      ### AutoUpdate scp tag create  
#   source    = "./modules/scp"
#   for_each  = fileset(path.root, "policies/scp_policies/scp_len_env_tag_create_enforcement.json")
#   json_file = each.value
#   ou_list   = var.prod_ou_id
# }

# module "tags_prod_env_mod" {                                    # prod env tags policy    
#   source    = "./modules/tags"
#   for_each  = fileset(path.root, "policies/tags_policies/tags_prod_env_policy.json")
#   json_file = each.value
#   ou_list   = var.prod_ou_id
# }


##### UAT OU 

# module "scp_uat_env_mod" {                      ### uat scp tag create  
#   source    = "./modules/scp"
#   for_each  = fileset(path.root, "policies/scp_policies/scp_len_env_tag_create_enforcement.json")
#   json_file = each.value
#   ou_list   = var.uat_ou_id
# }

# module "tags_uat_env_mod" {                                    # uat env tags policy    
#   source    = "./modules/tags"
#   for_each  = fileset(path.root, "policies/tags_policies/tags_uat_env_policy.json")
#   json_file = each.value
#   ou_list   = var.uat_ou_id
# }

## DEV OU

# module "scp_dev_env_mod" {                      ### dev scp tag create  
#   source    = "./modules/scp"
#   for_each  = fileset(path.root, "policies/scp_policies/scp_len_env_tag_create_enforcement.json")
#   json_file = each.value
#   ou_list   = var.dev_ou_id
# }

# module "tags_dev_env_mod" {                                    # dev env tags policy    
#   source    = "./modules/tags"
#   for_each  = fileset(path.root, "policies/tags_policies/tags_dev_env_policy.json")
#   json_file = each.value
#   ou_list   = var.dev_ou_id
# }



###################################################################

