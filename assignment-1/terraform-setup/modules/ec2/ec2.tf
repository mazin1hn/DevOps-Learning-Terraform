resource "aws_security_group" "main" {
    vpc_id = var.vpc_id 

    dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
  
}


resource "aws_key_pair" "main" {
    key_name   = var.key_name
    public_key = var.public_key
}

resource "aws_instance" "main" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id 
    vpc_security_group_ids = [aws_security_group.main.id]
    key_name = var.key_name
    associate_public_ip_address = var.associate_public_ip_address

    user_data = var.user_data_path != null ? file(var.user_data_path) : null

  user_data_replace_on_change = true
    
tags = var.ec2_tags
            
}