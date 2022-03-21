# Copyright 2022 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "adb_id" {
    description = "OCID of the new ADB created"
    value = oci_database_autonomous_database.adb_database.id
}

output "adb_database" {
  value = {
    adb_database_id    = oci_database_autonomous_database.adb_database.id
    connection_urls    = oci_database_autonomous_database.adb_database.connection_urls
    adb_wallet_content = oci_database_autonomous_database_wallet.adb_database_wallet.content
  }
}

