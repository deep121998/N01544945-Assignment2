resource "null_resource" "linux_provisioner" {
  count = var.vm_count
  depends_on = [
    azurerm_linux_virtual_machine.linux_vm
  ]

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]
    connection {
      type        = "ssh"
      user        = var.user_details.username
      private_key = file(var.user_details.private_key)
      host        = element(azurerm_public_ip.public_ip[*].fqdn, count.index + 1)
    }
  }

}
