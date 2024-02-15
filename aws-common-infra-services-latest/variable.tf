############################
# Tags
############################
variable "environment" {
  type    = string
  default = "PROD"
}
############################
# IPAM
############################

variable "ipam_regions" {
  type    = list(any)
  default = ["us-east-1"]
}


variable "resources" {

}

variable "tags" {

}

