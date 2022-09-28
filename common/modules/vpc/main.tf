resource "oci_core_vcn" "vcn_cidr" {
    cidr_block = var.vcn_cidr
    compartment_id = lookup(var.compartment_id, "${var.env}")
    dns_label = var.vcn_dns_label
    display_name = "${var.env}-${var.vcn_display_name}"
}

resource "oci_core_internet_gateway" "igw" {
    compartment_id = lookup(var.compartment_id, "${var.env}")
    vcn_id = oci_core_vcn.vcn_cidr.id
    display_name = "${var.env}-${var.igw_display_name}"
    enabled = true
}

resource "oci_core_route_table" "public_subnet_route_table" {
    compartment_id = lookup(var.compartment_id, "${var.env}")
    route_rules {
        network_entity_id = oci_core_internet_gateway.igw.id
        destination = "0.0.0.0/0"
    }
    vcn_id = oci_core_vcn.vcn_cidr.id
    display_name = "${var.env}-${var.public_subnet_route_table_display_name}"
}

resource "oci_core_security_list" "public_subnet_security_list" {
    compartment_id = lookup(var.compartment_id, "${var.env}")
    egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "6"
        stateless = false
        }
    
    dynamic "ingress_security_rules" {
        for_each = var.ssh_allows
        content {
            source = ingress_security_rules.value
            protocol = "6"
            stateless = false
            description = ingress_security_rules.key
            tcp_options {
                min = 22
                max = 22
            }
        }
    }

    dynamic "ingress_security_rules" {
        for_each = var.service_allow_ports
        content {
            source = "0.0.0.0/0"
            protocol = "6"
            stateless = false
            description = ingress_security_rules.key
            tcp_options {
                min = ingress_security_rules.value
                max = ingress_security_rules.value
            }
        }
    }

    dynamic "ingress_security_rules" {
        for_each = var.system_allow_cidrs
        content {
            source = ingress_security_rules.value
            protocol = "6"
            stateless = false
            description = ingress_security_rules.key
            tcp_options {
                min = 25
                max = 25
            }
        }
    }

    ingress_security_rules {
        source = var.vcn_cidr
        protocol = "6"
        stateless = false
        description = "internal"
        }
    vcn_id = oci_core_vcn.vcn_cidr.id
    display_name = "${var.env}-${var.public_subnet_security_list_display_name}"
}

resource "oci_core_subnet" "public_subnet" {
    availability_domain = "${var.ad_list[0]}"
    cidr_block = var.public_subnet_cidr_block
    compartment_id = lookup(var.compartment_id, "${var.env}")
    security_list_ids = ["${oci_core_security_list.public_subnet_security_list.id}"]
    vcn_id = oci_core_vcn.vcn_cidr.id
    dns_label = var.public_subnet_dns_label
    prohibit_public_ip_on_vnic = "false"
    route_table_id = oci_core_route_table.public_subnet_route_table.id
    display_name = "${var.env}-${var.public_subnet_display_name}"
}
