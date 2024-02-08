# Tags
environment = "PROD"

# IPAM
ipam_regions = ["us-east-1", "us-west-2"]


resources = {

  res1 = { vpc_name = "len-egress-pd-vpc01",
           sn_name = ["len-network-pd-vpc01-sn1"],
  }

  res2 = { vpc_name = "len-ingress-pd-vpc02",
           sn_name = ["len-network-pd-vpc02-sn2"],
  }

  res3 = { vpc_name = "len-inspection-pd-vpc03",
          sn_name = ["len-network-pd-vpc03-sn3"],
  }

}



tags = {
  ApplicationName = "aws-leninfravpcp01",
  "Cost Center"   = "100"
  AppID           = "len-54321"
  Environment     = "prod"
}



