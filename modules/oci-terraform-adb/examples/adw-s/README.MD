# Oracle Cloud Infrastructure (OCI) ADB Module for Terraform for example ADW-S creation

# 1. Introduction

This example shows how to create an Autonomous Data Warehouse on Exadata Shared infrastructure (from here on out, ADW-S) with the following non-default arguments:

| Attribute | Values | Description |
| --- | --- | --- | 
| comparment_id | OCID of your compartment id | Where you want to put the ADW-S |
| db_name | DBADWS1 | The db name of your ADW-S | 
| display_name | DBADWS1 | The display name of your ADW-S |
| admin_password | ADMIN password | Remember the rules: Must be between 12 and 30 characters long, must contain at least 1 uppercase, 1 lowercase, and 1 numeric character. Cannot contain the double quote symbol ("), username "admin" regardless of casing. |
| cpu_core_count | 1 | OCPUs assigned to your ADW-S |
| data_storage_size_in_tbs | 1 | This value is ignored as Always-free ADB has 20 GB of space. If you empty the value the provider will rise error |
| db_version | 19c | Database version of your ADW-S |
| db_workload| DW | The attribute which defines that this is an ADW-S! |
| is_free_tier | true | This is an Always-free ADW! |
| is_mtls_connection_required | true | We required that DB clients use the wallet |
| is_dedicated | false | This is an ADW-***S***, for being shared. |

NOTICE that the network access is permitted by everywhere. You could defined the whitelisted_ips by setting the public IP address that your ISP provider has given to you. You can get it from your web browser in https://www.whatismyip.com.

# 2. Using this example

Prepare one variable file named `terraform.tfvars` with the required information. The contents of `terraform.tfvars` should look something like the following (or copy and re-use the contents of `terraform.tfvars.template`:

```
tenancy_ocid = "ocid1.tenancy.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
user_ocid = "ocid1.user.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
fingerprint= "xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx"
private_key_path = "~/.oci/oci_api_key.pem"
region = "us-frankfurt-1"
default_adb_admin_password = "<ADMIN user password>
default_compartment_ocid = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

Then apply the example using the following commands:

```
$ terraform init
$ terraform plan
$ terraform apply
```


