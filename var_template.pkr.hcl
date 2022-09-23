
variable "ansible_user_password" {
    type = string
    default = "ansible"
}

#######################################################################
####                         AWS VARIABLES                         ####
#######################################################################

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

#######################################################################
####                      VSPHERE VARIABLES                        ####
#######################################################################


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

variable "vm-name" {
  type    = string
  default = "ubuntu-2004-template"
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

variable "vsphere-host" {
  type    = string
  default = ""
}