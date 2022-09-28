variable "ad_list" {
    type = list
    default = ["xRCS:AP-TOKYO-1-AD-1", "xRCS:AP-TOKYO-1-AD-2"]
}

variable "env" {
    type = string
}

variable "compartment_id" {
    type = map(string)
    default = {
        "prd" = "{PRODUCTION ID}"
        "stg" = "{STAGING ID}"
    }
}

variable "vcn_cidr" {
    type = string
}

variable "vcn_dns_label" {
    type = string
}

variable "vcn_display_name" {
    type = string
}

variable "igw_display_name" {
    type = string
}

variable "public_subnet_route_table_display_name" {
    type = string
}

variable "ssh_allows" {
    type = map(string)
    default = {
        "my-office-1" = "{IP-1}"
        "my-office-2" = "{IP-2}"
    }
}

variable "service_allow_ports" {
    type = map(string)
    default = {
        "service-http" = "80"
        "service-https" = "443"
    }
}

variable "system_allow_cidrs" {
    type = map(string)
    default = {
        "internal-system-1" = "{IP-1}"
        "internal-system-2" = "{IP-2}"
        "internal-system-3" = "{IP-3}"
        "internal-system-4" = "{IP-4}"
    }
}

variable "public_subnet_security_list_display_name" {
    type = string
}

variable "public_subnet_cidr_block" {
    type = string
}

variable "public_subnet_dns_label" {
    type = string
}

variable "public_subnet_display_name" {
    type = string
}
