#######################################################################
####                          AWS SOURCE                           ####
#######################################################################

# Time stamps for image file placed into Cloud
locals {
	timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "base" {
  region = var.aws_region

  source_ami_filter {
    filters = {
       virtualization-type = "hvm"
       name = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
       root-device-type = "ebs"
    }
    owners = ["099720109477"] # Canonical
    most_recent = true
  }

  instance_type = "t2.micro"
  ssh_username = "ubuntu"
  ami_name = "ubuntu-${var.prefix}-${local.timestamp}"
  tags = {
    owner = var.owner
    delete_date = "2022-04-08"
    application = "base-build"
    golden    = "false"
    security_hardened = "true"
    cis_benchmarked = "true"
    github_action = "true"
  }
}

#######################################################################
####                        VSPHERE SOURCE                         ####
#######################################################################

source "vsphere-iso" "base" {
  CPUs                 = 1
  RAM                  = 1024
  RAM_reserve_all      = false
  boot_command         = ["<enter><wait2><enter><wait><f6><esc><wait>", " autoinstall<wait2> ds=nocloud;", "<wait><enter>"]
  boot_wait            = "5s"
  cd_files             = ["./http/user-data", "./http/meta-data"]
  cd_label             = "cidata"
  convert_to_template  = true
  datacenter           = "${var.vsphere-datacenter}"
  datastore            = "${var.vsphere-datastore}"
  disk_controller_type = ["pvscsi"]
  guest_os_type        = "ubuntu64Guest"
  http_directory       = "http"
  insecure_connection  = "true"
  iso_paths            = ["${var.iso_url}"]
  network_adapters {
    network      = "${var.vsphere-network}"
    network_card = "vmxnet3"
  }
  notes                  = "Built via Packer"
  password               = "${var.vsphere-password}"
  shutdown_command       = "echo 'ubuntu'|sudo -S shutdown -P now"
  ssh_handshake_attempts = "100"
  ssh_password           = "ubuntu"
  ssh_timeout            = "20m"
  ssh_username           = "ubuntu"
  storage {
    disk_size             = 15000
    disk_thin_provisioned = true
  }
  username       = "${var.vsphere-user}"
  vcenter_server = "${var.vsphere-server}"
  cluster        = "${var.vsphere-cluster}"
  vm_name        = "ubuntu-${var.prefix}-${local.timestamp}"
  folder         = "${var.vm-folder}"
}




