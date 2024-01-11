
# BUILD PARAMATERS

build {
  hcp_packer_registry {
    bucket_name = "ore-ubuntu-image"
    description = "Bucket for ubuntu Images in Azure, AWS, and On-Prem."
    bucket_labels = {
      "ubuntu" = "server",
      "security_hardened" = "false",
      "cis_benchmarked" = "false"
    }
  }
  sources = [
    "source.azure-arm.base-ubuntu",
    "source.amazon-ebs.base-ubuntu"
  ]
  provisioner "shell" {
    script = "post-script.sh"
  }
  #provisioner "ansible" {
  #  playbook_file = "./playbook.yaml"
  #  user = "ubuntu"
  #  extra_arguments = [
	#		"--extra-vars",
	#		"ansible_user_password=${var.ansible_user_password}",
  #    "--tags",
  #    "level_1_server"
	#	]
  #}
  
}