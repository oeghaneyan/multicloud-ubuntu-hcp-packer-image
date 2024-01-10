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