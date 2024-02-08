# IPAM

resource "aws_vpc_ipam" "lennar_global_ipam" {
  description = "Lennar IPAM for all AWS regions"
  dynamic operating_regions {
    for_each = local.all_ipam_regions
    content {
      region_name = operating_regions.value
    }
  }
  tags = {
    Environment = var.environment
    "Application Name" = "aws-leninfrap01"
  }
}

data "aws_region" "current" {}

locals {
  all_ipam_regions = distinct(concat([data.aws_region.current.name], var.ipam_regions))
}

# IPAM Pools


resource "aws_vpc_ipam_pool" "lennar_global_ipam_pool" {
  address_family = "ipv4"
  description = "Lennar Global IP Pool"
  ipam_scope_id  = aws_vpc_ipam.lennar_global_ipam.private_default_scope_id
}

resource "aws_vpc_ipam_pool_cidr" "lennar_global_ipam_pool_cidr" {
  ipam_pool_id = aws_vpc_ipam_pool.lennar_global_ipam_pool.id
  cidr         = "10.192.0.0/12"
}

resource "aws_vpc_ipam_pool" "lennar_east_infra_ipam_pool" {
  address_family      = "ipv4"
  description = "Lennar US East 1 Region Infra IP Pool"
  ipam_scope_id       = aws_vpc_ipam.lennar_global_ipam.private_default_scope_id
  locale              = "us-east-1"
  source_ipam_pool_id = aws_vpc_ipam_pool.lennar_global_ipam_pool.id
}

resource "aws_vpc_ipam_pool_cidr" "lennar_east_infra_ipam_pool_cidr" {
  ipam_pool_id = aws_vpc_ipam_pool.lennar_east_infra_ipam_pool.id
  cidr         = "10.192.0.0/15"
}

resource "aws_vpc_ipam_pool" "lennar_east_sandbox_ipam_pool" {
  address_family      = "ipv4"
  description = "Lennar US East 1 Region Sandbox IP Pool"
  ipam_scope_id       = aws_vpc_ipam.lennar_global_ipam.private_default_scope_id
  locale              = "us-east-1"
  source_ipam_pool_id = aws_vpc_ipam_pool.lennar_global_ipam_pool.id
}

resource "aws_vpc_ipam_pool_cidr" "lennar_east_sandbox_ipam_pool_cidr" {
  ipam_pool_id = aws_vpc_ipam_pool.lennar_east_sandbox_ipam_pool.id
  cidr         = "10.194.0.0/15"
}

resource "aws_vpc_ipam_pool" "lennar_east_devtest_ipam_pool" {
  address_family      = "ipv4"
  description = "Lennar US East 1 Region DevTest IP Pool"
  ipam_scope_id       = aws_vpc_ipam.lennar_global_ipam.private_default_scope_id
  locale              = "us-east-1"
  source_ipam_pool_id = aws_vpc_ipam_pool.lennar_global_ipam_pool.id
}

resource "aws_vpc_ipam_pool_cidr" "lennar_east_devtest_ipam_pool_cidr" {
  ipam_pool_id = aws_vpc_ipam_pool.lennar_east_devtest_ipam_pool.id
  cidr         = "10.196.0.0/15"
}

resource "aws_vpc_ipam_pool" "lennar_east_uat_ipam_pool" {
  address_family      = "ipv4"
  description = "Lennar US East 1 Region UAT IP Pool"
  ipam_scope_id       = aws_vpc_ipam.lennar_global_ipam.private_default_scope_id
  locale              = "us-east-1"
  source_ipam_pool_id = aws_vpc_ipam_pool.lennar_global_ipam_pool.id
}

resource "aws_vpc_ipam_pool_cidr" "lennar_east_uat_ipam_pool_cidr" {
  ipam_pool_id = aws_vpc_ipam_pool.lennar_east_uat_ipam_pool.id
  cidr         = "10.198.0.0/15"
}


resource "aws_vpc_ipam_pool" "lennar_east_prod_ipam_pool" {
  address_family      = "ipv4"
  description = "Lennar US East 1 Region Prod IP Pool"
  ipam_scope_id       = aws_vpc_ipam.lennar_global_ipam.private_default_scope_id
  locale              = "us-east-1"
  source_ipam_pool_id = aws_vpc_ipam_pool.lennar_global_ipam_pool.id
}

resource "aws_vpc_ipam_pool_cidr" "lennar_east_prod_ipam_pool_cidr" {
  ipam_pool_id = aws_vpc_ipam_pool.lennar_east_prod_ipam_pool.id
  cidr         = "10.200.0.0/15"
}

