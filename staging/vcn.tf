module "vpc_subnet_1" {
    source = "../common/modules/vpc"
    env = "stg"
    vcn_cidr = "10.1.3.0/24"
    vcn_dns_label = "hoge"
    vcn_display_name = "hoge"
    igw_display_name = "hoge"
    public_subnet_route_table_display_name = "hoge"
    public_subnet_security_list_display_name = "hoge"
    public_subnet_cidr_block = "10.1.3.0/25"
    public_subnet_dns_label = "hoge"
    public_subnet_display_name = "hoge"
}

module "vpc_subnet_2" {
    source = "../common/modules/vpc"
    env = "stg"
    vcn_cidr = "10.1.4.0/24"
    vcn_dns_label = "hoge"
    vcn_display_name = "hoge"
    igw_display_name = "hoge"
    public_subnet_route_table_display_name = "hoge"
    public_subnet_security_list_display_name = "hoge"
    public_subnet_cidr_block = "10.1.4.0/25"
    public_subnet_dns_label = "hoge"
    public_subnet_display_name = "hoge"
}
