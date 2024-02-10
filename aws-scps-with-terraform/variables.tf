
variable "region" {
  description = "region for deployment"
  type        = string
}


variable "sandbox_ou" {
  description = "list of sandbox OUs"
  type        = list(string)
}