resource "aws_ec2_transit_gateway" "aws-len-tgw" {
  description = "Network transit gateway for lennar"


  tags = merge(
    { "Name" = "len-tgw-main-pd-01" },
    {

      for key1, value1 in var.tags :
      key1 => value1

  })

}