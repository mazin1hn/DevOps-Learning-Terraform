#Holistic EC2 module 

resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_block

    tags = {
      Name = var.vpc_tags
    }
  
}

resource "aws_subnet" "main" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.subnet_cidr_block

     tags = {
      Name = var.subnet_tags
    }
  
}

resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id

     tags = {
      Name = var.igw_tags
    }
  
}

resource "aws_route_table" "main" {
    vpc_id = aws_vpc.main.id
      
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.main.id
  }

   tags = {
      Name = var.route_table_tags
    }
}

resource "aws_route_table_association" "a" {

  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id



}

resource "aws_security_group" "main" {
    vpc_id = aws_vpc.main.id 

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
    subnet_id = aws_subnet.main.id
    vpc_security_group_ids = [aws_security_group.main.id]
    key_name = var.key_name
    associate_public_ip_address = var.associate_public_ip_address

    user_data = var.user_data_path != null ? file(var.user_data_path) : null

  user_data_replace_on_change = true
    
tags = var.ec2_tags
            
}



