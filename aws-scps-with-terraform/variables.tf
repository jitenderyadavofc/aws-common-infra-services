
variable "region" {
  description = "region for deployment"
  type        = string
}


variable "workload_ou_id" {
  description = "list of OUs"
  type        = list(string)
}

# variable "prod_ou_id" {
#    description = "list of OUs"
#   type        = list(string)
# }

# variable "uat_ou_id" {
#    description = "list of OUs"
#   type        = list(string)
# }

# variable "dev_ou_id" {

# }

