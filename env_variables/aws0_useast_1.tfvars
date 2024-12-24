tfc_organization          = "mudragiri"
tfc_workspace             = "aws0_useast_1_vpc"
aws_region                = "us-east-1"
cidr_block                = "10.1.0.0/16"
main_vpc_tags             = { "Name" = "First VPC" }
public_subnet_cidr_block  = "10.1.1.0/24"
private_subnet_cidr_block = "10.1.128.0/20"
route_table_local_tags    = { "Name" = "Default Route Table" }
route_table_internet_tags = { "Name" = "Internet Route Table" }
public_subnet_tags        = { "Name" = "Public Subnet" }
private_subnet_tags       = { "Name" = "Private Subnet" }
ami                       = "ami-0ca9fb66e076a6e32"