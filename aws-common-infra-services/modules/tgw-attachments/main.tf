resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
  count               = length(var.vpc_ids)
  transit_gateway_id = aws_ec2_transit_gateway.aws-len-tgw.id
  vpc_id             = var.vpc_ids[count.index]
  subnet_ids     =   var.subnet_ids[count.index]
}