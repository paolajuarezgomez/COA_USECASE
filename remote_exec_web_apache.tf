# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "null_resource" "configure_cluster_node_apache" {
  count = var.install_product == "Apache" ? var.cluster_size : 0

  provisioner "file" {
    connection {
      user         = "opc"
      agent        = false
      private_key  = chomp(file(var.ssh_private_key_path))
      timeout      = "10m"
      bastion_host = oci_core_instance.bastion_instance.public_ip
      host         = oci_core_instance.web_instance[count.index].create_vnic_details[0].private_ip
    }

    source      = "./scripts/apache_install.sh"
    destination = "/tmp/apache_install.sh"
  }

  provisioner "remote-exec" {
    connection {
      user         = "opc"
      agent        = false
      private_key  = chomp(file(var.ssh_private_key_path))
      timeout      = "10m"
      bastion_host = oci_core_instance.bastion_instance.public_ip
      host         = oci_core_instance.web_instance[count.index].create_vnic_details[0].private_ip
    }

    inline = [
      "chmod uga+x /tmp/apache_install.sh",
      "sudo su - root -c \"/tmp/apache_install.sh ${oci_core_instance.web_instance[count.index].display_name} \"",
    ]
  }
}