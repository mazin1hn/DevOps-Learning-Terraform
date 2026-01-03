module "ec2" {
    source = "./modules/ec2"

    vpc_cidr_block = var.vpc_cidr_block
    vpc_tags = var.vpc_tags

    subnet_cidr_block = var.subnet_cidr_block
    subnet_tags = var.subnet_tags

    igw_tags = var.igw_tags
    route_table_tags = var.route_table_tags

    ingress_rules = var.ingress_rules
    egress_rules = var.egress_rules

    key_name = var.key_name
    public_key = var.public_key

    instance_type = var.instance_type
    ami_id = var.ami_id
    ec2_tags = var.ec2_tags
    associate_public_ip_address = var.associate_public_ip_address
    user_data_path = var.user_data_path







  

}