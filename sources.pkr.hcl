# LOCAL SOURCE
locals {
	timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

# AZURE SOURCE
source "azure-arm" "base-ubuntu2004" {
  azure_tags = {
    dept = "Solution Engineering"
    task = "GitHub Packer Demo"
  }
  client_id                         = "${var.client_id}"
  client_secret                     = "${var.client_secret}"
  subscription_id                   = "${var.subscription_id}"
  tenant_id                         = "${var.tenant_id}"
  build_resource_group_name         = "${var.azure_resource_group_name}"
  image_offer                       = "UbuntuServer"
  image_publisher                   = "Canonical"
  image_sku                         = "20.04-LTS"
  managed_image_name                = "ubuntu-2004-${var.prefix}-${local.timestamp}"
  managed_image_resource_group_name = "${var.azure_resource_group_name}"
  os_type                           = "Linux"
  vm_size                           = "${var.azure_vm_size}"
}

# AWS SOURCE
source "amazon-ebs" "base-ubuntu2004" {
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
    application = "base-build"
    golden    = "false"
    security_hardened = "false"
    cis_benchmarked = "true"

  }
}

# VSPHERE SOURCE
source "vsphere-iso" "base-ubuntu2004" {
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




