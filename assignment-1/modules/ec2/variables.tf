#VPC variables 

variable "vpc_cidr_block" {
  type = string 
  default = "10.0.0.0/16"
  
}

variable "vpc_tags" {
  type = string 
  default = "main"
  
}

#Subnet variables 

variable "subnet_cidr_block" {
  type = string 
  default = "10.0.0.0/24"
  
}

variable "subnet_tags" {
  type = string 
  default = "main"
  
}

#IGW variables 

variable "igw_tags" {
  type = string 
  default = "main"
  
}

#Route table variables 


variable "route_table_tags" {
  type = string 
  default = "main"
  
}

#Security group variables 

#ingress 

variable "ingress_rules" {
  description = "Ingress rules for the security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

#egress

variable "egress_rules" {
  description = "Egress rules for the security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}


#AWS key pair variables 

variable "key_name" {
  type = string 
  
}

variable "public_key" {
  type = string 
  
}

#EC2 instance variables

variable "instance_type" {
  type    = string
  
   
}

variable "ami_id" {
  type    = string
  
   
}

variable "ec2_tags" {
  type    = map(string)
  
   
}

variable "associate_public_ip_address" {
  type = bool 
  
}

variable "user_data_path" {
  description = "Path to user-data script"
  type        = string
  default     = null
}








       