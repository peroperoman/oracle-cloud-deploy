# common
variable "ad" {}
variable "subnet_id" {}
variable "region" {
    type = string
    default = "ap-tokyo-1"
}

variable "env" {
    type = string
}

variable "instance_shape" {
    type = map(string)
    default = {
        "prd" = "VM.Standard.E4.Flex"
        "stg" = "VM.Standard.E3.Flex"
    }
}

variable "mem_gb" {
    type = map(number)
    default = {
        "prd" = "16"
        "stg" = "8"
    }
}

variable "cpu" {
    type = map(number)
    default = {
        "prd" = "8"
        "stg" = "4"
    }
}

variable "third_octet" {
    type = string
}

variable "CentOS7" {
    type = map(string)
    default = {
        ap-tokyo-1 = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaatq7pw2e6t4ushlnkas2e2bqyql7nmtfpafxunoblndpqadhn3h3a"
        ap-osaka-1 = "ocid1.image.oc1.ap-osaka-1.aaaaaaaa2pmn54xv2awwtrmmthvlhnt6fsmxzise6suxcvaa335q6evevnxq"
        }
}

variable "compartment_id" {
    type = map(string)
    default = {
        "prd" = "{PRODUCTION ID}"
        "stg" = "{STAGING ID}"
    }
}

variable "instance_ssh_public_key" {
    default = "{PUBLIC KEY}"
}

variable "instance_num" {
    type = number
}

variable "instance_display_name" {
    type = string
}
