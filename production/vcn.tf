module "vpc_subnet_1" {
    source = "../common/modules/vpc"
    env = "prd"
    vcn_cidr = "10.1.5.0/24"
    vcn_dns_label = "test"
    vcn_display_name = "test"
    igw_display_name = "test"
    public_subnet_route_table_display_name = "test"
    public_subnet_security_list_display_name = "test"
    public_subnet_cidr_block = "10.1.5.0/25"
    public_subnet_dns_label = "test"
    public_subnet_display_name = "test"
}

module "vpc_subnet_2" {
    source = "../common/modules/vpc"
    env = "prd"
    vcn_cidr = "10.1.6.0/24"
    vcn_dns_label = "test"
    vcn_display_name = "test"
    igw_display_name = "test"
    public_subnet_route_table_display_name = "test"
    public_subnet_security_list_display_name = "test"
    public_subnet_cidr_block = "10.1.6.0/24"
    public_subnet_dns_label = "test"
    public_subnet_display_name = "test"
}
