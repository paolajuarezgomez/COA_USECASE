# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

data "oci_identity_user" "coa_demo_executer" {
  #Required
  user_id = var.user_id
}

data "oci_identity_availability_domains" "availability_domains" {
  #Required
  compartment_id = var.tenancy_id
}

data "oci_core_images" "this" {
  #Required
  compartment_id = var.default_compartment_id

  #Optional
  display_name = var.image_name
}


data "template_file" "flask_ATP_py_template" {
  template = file("./scripts/flask_ATP.py")

  vars = {
    ATP_password                        = var.adb_password
    ATP_alias                           = join("", [var.adb_db_name, "_medium"])
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
  }
}

data "template_file" "flask_ATP_sh_template" {
  template = file("./scripts/flask_ATP.sh")

  vars = {
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
  }
}

data "template_file" "flask_bootstrap_template" {
  template = file("./scripts/flask_bootstrap.sh")

  vars = {
    ATP_tde_wallet_zip_file             = "adb_wallet.zip"
    oracle_instant_client_version       = var.oracle_instant_client_version
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
  }
}

data "template_file" "sqlnet_ora_template" {
  template = file("./scripts/sqlnet.ora")

  vars = {
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
  }
}

