# Copyright 2022 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

module "DBADWS1" {
    source = "../../"
    default_compartment_id = var.default_compartment_id
    
    adb = {
        compartment_id                       = var.default_compartment_id
        db_name                              = "DBADWS1"
        display_name                         = "DBADWS1"
        admin_password                       = var.default_adb_admin_password
        are_primary_whitelisted_ips_used     = null
        ocpu_count                           = null
        cpu_core_count                       = "1"
        customer_contacts                    = var.default_customer_contacts
        data_storage_size_in_gb              = null
        data_storage_size_in_tbs             = "1"
        data_safe_status                     = "NOT_REGISTERED"
        db_version                           = "19c"
        db_workload                          = "DW"
        defined_tags                         = {}
        freeform_tags                        = {}
        is_access_control_enabled            = null
        is_auto_scaling_enabled              = false
        is_data_guard_enabled                = false
        is_free_tier                         = true
        is_mtls_connection_required          = true
        is_refreshable_clone                 = null
        license_model                        = ""
        nsg_ids                              = []
        refreshable_mode                     = null
        operations_insights_status           = "NOT_ENABLED"
        private_endpoint_label               = ""
        rotate_key_trigger                   = null
        scheduled_operations                 = []
        standby_whitelisted_ips              = []
        state                                = "AVAILABLE"
        subnet_id                            = ""
        whitelisted_ips                      = []

        autonomous_container_database_id     = null
        autonomous_database_backup_id        = null
        autonomous_database_id               = null
        clone_type                           = null 
        autonomous_maintenance_schedule_type = "REGULAR"
        is_dedicated                         = false
        is_preview_version_with_service_terms_accepted = null
        kms_key_id                           = null
        source                               = null
        source_id                            = null
        switchover_to                        = null
        timestamp                            = null
        vault_id                             = null
    }
}