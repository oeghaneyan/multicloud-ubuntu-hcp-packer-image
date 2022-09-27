#######################################################################
####                   AWS VARIABLE DEFINITIONS                    ####
#######################################################################
prefix = "base"
aws_region = "us-east-1"
owner = "Omid"


#######################################################################
####                 VSPHERE VARIABLE DEFINITIONS                  ####
#######################################################################

iso_url = "[host-1-ssd] ISOs/ubuntu-20.04.2-live-server-amd64.iso"
vm-cpu-num = 1
vm-disk-size = "25600"
vm-mem-size = "1024"
vm-name  = "ubuntu-2004-template"
vm-folder = "Templates"
vsphere-datacenter = "Home Lab"
vsphere-datastore = "host-1-ssd"
vsphere-network = "VM Network"
#vsphere-password  = ""
vsphere-server = "vcenter.bo.local"
vsphere-user = "administrator@vsphere.local"
vsphere-cluster = "cluster"
