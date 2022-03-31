# Oracle Cloud Infrastructure (OCI) ADB Module for Terraform for example ATP-S creation

# 1. Introduction

This example shows how to create an Autonomous Transaction Processing on Exadata Shared infrastructure (from here on out, ATP-S) with the following non-default arguments:

| Attribute | Values | Description |
| --- | --- | --- | 
| comparment_id | OCID of your compartment id | Where you want to put the ATP-S |
| db_name | DBATP2 | The db name of your ATP-S | 
| admin_password | ADMIN password | Remember the rules: Must be between 12 and 30 characters long, must contain at least 1 uppercase, 1 lowercase, and 1 numeric character. Cannot contain the double quote symbol ("), username "admin" regardless of casing. |
| cpu_core_count | 1 | OCPUs assigned to your ATP-S |
| db_version | 19c | Database version of your ATP-S |
| db_workload| OLTP | The attribute which defines that this is an ATP-S! |
| is_auto_scaling_enabled | true | We enable the auto-scaling feature, it will add up to x3 times your OCPU capacity |
| is_mtls_connection_required | true | We required that DB clients use the wallet |
| license_model | BRING_YOUR_OWN_LICENSE | You should have a licenses available to use this ATP-S (Oracle Database EE)
| nsg_ids | OCID of your NSG which enables access to the DB | Network Security Group with valid security rules to enable access to this ATP-S | 
| private_endpoint_label | DBATP2 | The label to be added to your VCN DNS resolver to configure the connection string |
| scheduled_operations | Week days to start the DB at 9:00 (UTC) and stop at 20:00 (UTC), but fridays, which goes for weekend at 18:00 (UTC) ;-) | This ATP-S has a default schedule to start and stop the ADB every working week day. |
| subnet_id | Put here the OCID of the subnet where you want that the ATP-S got a private IP to attend clients | OCID of the subnet where to put ATP-S |
| is_dedicated | false | This is an ATP-***S***, for being shared. |

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

