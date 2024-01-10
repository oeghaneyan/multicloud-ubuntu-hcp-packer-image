# IMAGE VARIABLES
variable "ansible_user_password" {
    type = string
    default = "ubuntu"
}

variable "user-password" {
  type    = string
  default = "${env("SSH_PASS")}"
  sensitive = true
}

# AWS VARIABLES 
variable "prefix" {
	type = string
	default = ""
}

variable "aws_region" {
    type = string
    default = ""
}

variable "owner" {
    type = string
    default = ""
}

# AZURE VARIABLES
variable "client_id" {
  type    = string
  default = "${env("AZURE_CLIENT_ID")}"
  sensitive = true
}

variable "client_secret" {
  type    = string
  default = "${env("AZURE_CLIENT_SECRET")}"
  sensitive = true
}

variable "subscription_id" {
  type    = string
  default = "${env("AZURE_SUBSCRIPTION_ID")}"
  sensitive = true
}

variable "tenant_id" {
  type    = string
  default = "${env("AZURE_TENANT_ID")}"
  sensitive = true
}

variable "azure_resource_group_name" {
  type    = string
  default = ""
}

variable "azure_vm_size" {
  type    = string
  default = ""
}

# VSPHERE VARIABLES
variable "iso_url" {
  type    = string
  default = ""
}

variable "vm-cpu-num" {
  type    = string
  default = "1"
}

variable "vm-disk-size" {
  type    = string
  default = "25600"
}

variable "vm-mem-size" {
  type    = string
  default = "1024"
}

#variable "vm-name" {
#  type    = string
#  default = "ubuntu-2004-template"
#}

variable "vm-folder" {
  type    = string
  default = ""
}

variable "vsphere-datacenter" {
  type    = string
  default = ""
}

variable "vsphere-datastore" {
  type    = string
  default = ""
}

variable "vsphere-network" {
  type    = string
  default = ""
}

variable "vsphere-password" {
  type    = string
  default = "${env("VSPHERE_PASS")}"
  sensitive = true
}

variable "vsphere-server" {
  type    = string
  default = ""
}

variable "vsphere-user" {
  type    = string
  default = ""
}

variable "vsphere-cluster" {
  type    = string
  default = ""
}