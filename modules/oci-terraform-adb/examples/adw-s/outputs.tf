# Copyright 2022 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "DBADWS1_id" {
    description = "OCID of the new ADW created"
   value = module.DBADWS1.adb_id
}