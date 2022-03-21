## Copyright (c) 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

module "adb" {
  source = "./modules/COA_adb/"

  # general oci parameters
  default_compartment_id = var.default_compartment_id

  # adb parameters
  adb = {
    compartment_id                   = var.default_compartment_id
    db_name                          = var.adb_db_name
    display_name                     = var.adb_display_name
    admin_password                   = var.adb_password
    are_primary_whitelisted_ips_used = null
    ocpu_count                       = null
    cpu_core_count                   = "1"
    customer_contacts                = [{ "email" : "pablo.alonso@oracle.com" }]
    data_storage_size_in_gb          = null
    data_storage_size_in_tbs         = "1"
    data_safe_status                 = "NOT_REGISTERED"
    db_version                       = var.adb_db_version
    db_workload                      = var.adb_workload
    defined_tags                     = {}
    freeform_tags                    = {}
    is_access_control_enabled        = null
    is_auto_scaling_enabled          = true
    is_data_guard_enabled            = false
    is_free_tier                     = false
    is_mtls_connection_required      = true
    is_refreshable_clone             = null
    license_model                    = "BRING_YOUR_OWN_LICENSE"
    nsg_ids                          = null
    refreshable_mode                 = null
    operations_insights_status       = "NOT_ENABLED"
    private_endpoint_label           = "DBATP1"
    rotate_key_trigger               = null
    scheduled_operations             = [{ "day_of_week" : [{ "name" : "MONDAY" }], "scheduled_start_time" : "09:00", "scheduled_stop_time" : "20:00" }, { "day_of_week" : [{ "name" : "TUESDAY" }], "scheduled_start_time" : "09:00", "scheduled_stop_time" : "20:00" }, { "day_of_week" : [{ "name" : "WEDNESDAY" }], "scheduled_start_time" : "09:00", "scheduled_stop_time" : "20:00" }, { "day_of_week" : [{ "name" : "THURSDAY" }], "scheduled_start_time" : "09:00", "scheduled_stop_time" : "20:00" }, { "day_of_week" : [{ "name" : "FRIDAY" }], "scheduled_start_time" : "09:00", "scheduled_stop_time" : "18:00" }]
    standby_whitelisted_ips          = []
    state                            = "AVAILABLE"
    subnet_id                        = oci_core_subnet.coa_atp_private_subnet.id
    vcn_id                           = oci_core_vcn.coa_demo_vcn.id
    nsg_ids                          = tolist([oci_core_network_security_group.adb_nsg.id])
    whitelisted_ips                  = []

    autonomous_container_database_id               = null
    autonomous_database_backup_id                  = null
    autonomous_database_id                         = null
    clone_type                                     = null
    autonomous_maintenance_schedule_type           = "REGULAR"
    is_dedicated                                   = false
    is_preview_version_with_service_terms_accepted = null
    kms_key_id                                     = ""
    source                                         = null
    source_id                                      = null
    switchover_to                                  = null
    timestamp                                      = null
    vault_id                                       = ""
  }

}

resource "local_file" "adb_wallet_file" {
  content_base64 = module.adb.adb_database.adb_wallet_content
  filename       = "${path.module}/adb_wallet.zip"
}

