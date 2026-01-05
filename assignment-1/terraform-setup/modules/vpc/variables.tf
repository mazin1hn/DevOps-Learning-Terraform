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

