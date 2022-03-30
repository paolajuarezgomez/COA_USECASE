# Copyright 2022 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "DBATP1" {
    description = "OCID of the new ADB created"
    value = {
       adb_id = module.DBATP1.adb.adb_id
       wallet = module.DBATP1.adb.adb_wallet.content
    }
}