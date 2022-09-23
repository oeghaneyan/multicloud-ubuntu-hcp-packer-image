

#######################################################################
####                      BUILD PARAMATERS                         ####
#######################################################################

build {
  hcp_packer_registry {
    bucket_name = "ore-ubuntu-image"
    description = "Bucket for ubuntu Images on prem and in AWS"
    bucket_labels = {
      "ubuntu" = "20.04-2022",
      "security_hardened" = "false",
      "cis_benchmarked" = "false"
    }
  }
  sources = [
    "source.vsphere-iso.base",
    "amazon-ebs.base"
  ]
  provisioner "shell" {
    script = "post-script.sh"
  }

}