output "ad" {
    value = oci_core_subnet.public_subnet.availability_domain
}

output "subnet_id" {
    value = oci_core_subnet.public_subnet.id
}
