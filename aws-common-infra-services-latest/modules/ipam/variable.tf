variable "environment" {
    type = string
    default = "PROD"
}

variable "ipam_regions" {
  type    = list
  default = ["us-east-1"]
}
