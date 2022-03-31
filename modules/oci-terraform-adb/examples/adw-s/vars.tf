# Copyright 2022 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

variable "tenancy_id" {
  type = string
}

variable "user_id" {
  type = string
}

variable "fingerprint" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "region" {
  type = string
  default = "eu-frankfurt-1"
}

variable "default_compartment_id" {
  type = string
}

variable "default_adb_admin_password" {
  type = string
  sensitive = true
} 

variable "default_customer_contacts" {
    type = list(object({
       email = string
    }))
}