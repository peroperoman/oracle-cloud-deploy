data "template_file" "init-server" {
    template = file("${path.module}/scripts/init.sh")
}

resource "oci_core_instance" "instance" {
    count = var.instance_num
    availability_domain = var.ad
    compartment_id = lookup(var.compartment_id, "${var.env}")
    shape = lookup(var.instance_shape, "${var.env}")
    display_name = "${format("${var.env}-${var.instance_display_name}%02d", count.index + 1)}"
    create_vnic_details {
        display_name = "${format("${var.env}-${var.instance_display_name}%02d", count.index + 1)}"
        subnet_id = var.subnet_id
        assign_public_ip = "true"
        private_ip = "${format("${var.third_octet}%d", count.index + 2)}"
    }
    shape_config {
        memory_in_gbs = lookup(var.mem_gb, "${var.env}")
        ocpus = lookup(var.cpu, "${var.env}")
    }
    source_details {
        source_id = lookup(var.CentOS7, var.region)
        source_type = "image"
    }
    metadata = {
        ssh_authorized_keys = "${var.instance_ssh_public_key}"
        user_data = base64encode(join("\n", tolist([
            "#!/usr/bin/env bash",
            "set -x",
            (data.template_file.init-server.rendered)],
        )))
    }
}
