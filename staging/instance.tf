module "instance_1" {
    source = "../common/modules/instance"
    env = "stg"
    third_octet = "10.1.3."
    instance_num = "2"
    instance_display_name = "test1"
    ad = module.vpc_subnet_1.ad
    subnet_id = module.vpc_subnet_1.subnet_id
}

module "instance_2" {
    source = "../common/modules/instance"
    env = "stg"
    third_octet = "10.1.4."
    instance_num = "2"
    instance_display_name = "test2"
    ad = module.vpc_subnet_2.ad
    subnet_id = module.vpc_subnet_2.subnet_id
}
