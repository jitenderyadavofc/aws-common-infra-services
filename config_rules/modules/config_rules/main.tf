resource "aws_config_config_rule" "len-aws-config-res" {
  name = var.config_rule_name

   source {
    owner             = "AWS"
    source_identifier = var.source_identifier
  }


input_parameters = var.input_params ? jsonencode({
     for key1,value1 in var.parameters:  
        key1=>value1
}): null


}




