resource "aws_ec2_transit_gateway" "aws-len-tgw" {
  description = "Network transit gateway for lennar"


  tags = merge(
    { "Name" = "len-aws-tgw-main-pd-01" },
    {

      for key1, value1 in var.tags :
      key1 => value1

  })

}

output "tgw-id" {
  value = aws_ec2_transit_gateway.aws-len-tgw
}